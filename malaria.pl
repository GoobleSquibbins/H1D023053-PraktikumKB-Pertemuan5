:- dynamic gejala/2.

penyakit(X, tertiana):-
gejala(X, nyeri_otot),
gejala(X, muntah),
gejala(X, kejang).

penyakit(X, quartana):-
gejala(X, nyeri_otot),
gejala(X, menggigil),
gejala(X, tidak_enak_badan).

penyakit(X, tropika):-
gejala(X, keringat_dingin),
gejala(X, sakit_kepala),
gejala(X, mimisan),
gejala(X, mual).

penyakit(X, pernisiosa):-
gejala(X, menggigil),
gejala(X, tidak_enak_badan),
gejala(X, demam),
gejala(X, mimisan),
gejala(X, mual).