:- dynamic gejala_pos/1.
:- dynamic gejala_neg/1.

pertanyaan(nyeri_otot) :-
write("Apakah Anda merasa nyeri otot?").
pertanyaan(muntah) :-
write("Apakah Anda muntah-muntah?").
pertanyaan(kejang) :-
write("Apakah Anda mengalami kejang-kejang?").
pertanyaan(menggigil) :-
write("Apakah Anda sering menggigil?").
pertanyaan(tidak_enak_badan) :-
write("Apakah Anda merasa tidak enak badan?").
pertanyaan(keringat_dingin) :-
write("Apakah Anda mengalami keringat dingin?").
pertanyaan(sakit_kepala) :-
write("Apakah Anda sering sakit kepala?").
pertanyaan(mimisan) :-
write("Apakah Anda sering mimisan?").
pertanyaan(mual) :-
write("Apakah Anda merasa mual?").
pertanyaan(demam) :-
write("Apakah Anda demam?").

diagnosa(G) :-
    pertanyaan(G),
    writeln(" (y/t)"),
    read(Jawaban),
    Jawaban == y,
    assertz(gejala_pos(G)).

diagnosa(G) :-
    assertz(gejala_neg(G)),
    fail.

gejala(G) :-
    gejala_pos(G), !.

gejala(G) :-
    gejala_neg(G), !,
    fail.

gejala(G) :-
diagnosa(G).

penyakit(tertiana) :-
    gejala(nyeri_otot),
    gejala(muntah),
    gejala(kejang),
    terdeteksi("Malaria Tertiana").

penyakit(quartana) :-
    gejala(nyeri_otot),
    gejala(menggigil),
    gejala(tidak_enak_badan),
    terdeteksi("Malaria Quartana").
    
penyakit(tropika) :-
    gejala(keringat_dingin),
    gejala(sakit_kepala),
    gejala(mimisan),
    gejala(mual),
    terdeteksi("Malaria Tropika").
    
penyakit(pernisiosa) :-
    gejala(menggigil),
    gejala(tidak_enak_badan),
    gejala(demam),
    gejala(mimisan),
    gejala(mual),
    terdeteksi("Malaria Pernisiosa").

penyakit(_) :-
    writeln("Tidak terdeteksi penyakit.").

terdeteksi(P) :-
    write("Anda terdeteksi penyakit "),
    writeln(P).

clear_db :-
    retractall(gejala_pos(_)),
    retractall(gejala_neg(_)).

main :-
    write('\33\[2J'), % Clear window
    writeln("DIAGNOSA PENYAKIT THT"),
    penyakit(_),
    clear_db,
    writeln("INGIN MENGULANG?"),
    read(Jawaban), !,
    Jawaban == y,
    main.
