:- dynamic answer_yes/1.
:- dynamic answer_no/1.

maybe_yes(_) :- true.

question(enemy_has_more_than_one_frontliner, "Do the enemies have more than one frontliner?").
question(has_more_than_one_frontliner, "Do you have more than one frontliner?").
question(facing_engage_support, "Are you facing an engage support?").
question(blnc_team, "Is your team damage balanced?").
question(adc_good, "Is your ADC doing well?").

%grasp_enchant_gen
build("Runes: Grasp, Font of Life, Second Wind, Revitalize, Manaflow | Item: Sickle, Lucid Boots, Harmonic, Ardent" ):-
answer_yes(has_more_than_one_frontliner),
answer_yes(facing_engage_support),
answer_yes(blnc_team).

%grasp_enchant_ap
build("Runes: Grasp, Font of Life, Second Wind, Revitalize, Manaflow | Item: Sickle, Lucid Boots, Harmonic, SOFW" ):-
answer_yes(has_more_than_one_frontliner),
answer_yes(facing_engage_support),
answer_no(blnc_team).

%grasp_dmg
build("Runes: Grasp, Font of Life, Second Wind, Overgrowth, Manaflow | Item: Sickle, Lucid Boots, Black Cleaver, Executioner, Magnetic Blaster" ):-
answer_yes(enemy_has_more_than_one_frontliner),
answer_no(has_more_than_one_frontliner),
answer_yes(facing_engage_support).

%aery_enchant_gen
build("Runes: Aery, Item Crafting, Transcendence, Manaflow, Revitalize | Item: Sickle, Lucid Boots, Harmonic, Ardent" ):-
answer_yes(enemy_has_more_than_one_frontliner),
answer_yes(has_more_than_one_frontliner),
answer_yes(blnc_team).

%aery_enchant_ap
build("Runes: Aery, Item Crafting, Transcendence, Manaflow, Revitalize | Item: Sickle, Lucid Boots, Harmonic, SOFW" ):-
answer_yes(enemy_has_more_than_one_frontliner),
answer_yes(has_more_than_one_frontliner),
answer_no(blnc_team).

%enemy_squishy
build("Runes: Fleet, Gathering Storm, Coup de Grace, Alacrity, Transcendence | Item: Sickle, Lucid Boots, Manamune, Youmuu's, Magnetic Blaster" ):-
answer_no(enemy_has_more_than_one_frontliner),
answer_no(facing_engage_support).

%screw_adc_squishy
build("Runes: Anything you picked before the match | Item: Sickle, Lucid Boots, Manamune, Youmuu's, Magnetic Blaster" ):-
answer_no(enemy_has_more_than_one_frontliner),
answer_no(adc_good).

%screw_adc_tanky
build("Runes: Anything you picked before the match | Item: Sickle, Lucid Boots, Black Cleaver, Runaan's, IE" ):-
answer_yes(enemy_has_more_than_one_frontliner),
answer_no(adc_good).

ask(QuestionKey) :-
    question(QuestionKey, Text),
    format("~w (yes/no): ", [Text]),
    read(Response),
    handle_response(Response, QuestionKey).

handle_response(yes, X) :- assertz(answer_yes(X)).
handle_response(no, X) :- assertz(answer_no(X)).
handle_response(_, _) :- write("Invalid input. Skipping...\n").

clear_answers :-
    retractall(answer_yes(_)),
    retractall(answer_no(_)).

run :-
    clear_answers,
    forall(question(Key, _), ask(Key)),
    ( build(Build) ->
        format("\n Recommended Build: ~w~n", [Build])
    ;
        write("\n No matching build found (T^T)\n")
    ).
