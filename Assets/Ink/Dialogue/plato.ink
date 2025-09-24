VAR idealism = 0
VAR materialism = 0

-> plato_intro

=== plato_intro ===
Plato: Welcome, traveler, to my Academy. #speaker:plato
Plato: Here we pursue not the fleeting shadows, but the eternal truths that shine beyond them. #speaker:plato
Plato: Tell me, seeker—do you search for the Forms that dwell above, or the shadows that dance upon the cave wall? #speaker:plato
* To seek the Forms. #moral:idealism:+1
    ~ idealism += 1
    Plato: Ah, noble choice! The Forms are the very essence of reality—unchanging, perfect, eternal. #speaker:plato #sticker:idealism_sun
    Plato: Yet I wonder—how do you grasp them? With the senses, or with the mind alone? #speaker:plato
    * * With the senses. #moral:materialism:+1
        ~ materialism += 1
        Plato: Beware, my friend! The senses deceive us, showing only shadows of the truth. #speaker:plato
        Plato: One who trusts only in the senses is like a prisoner mistaking flickering firelight for the sun itself. #speaker:plato
        -> story_end
    * * With the mind. #moral:idealism:+1
        ~ idealism += 1
        Plato: Indeed! Only reason can lift the soul upward, as the eye is lifted to behold the light of the sun. #speaker:plato
        Plato: Perhaps you, too, are ready for the philosopher’s ascent out of the cave. #speaker:plato
        -> story_end

* To chase the shadows. #moral:materialism:+1
    ~ materialism += 1
    Plato: The shadows call to many—for they are vivid, immediate, and easy to grasp. #speaker:plato #sticker:idealism_cave
    Plato: But tell me—are shadows all that exist, or do they point to something greater beyond them? #speaker:plato
    * * Shadows are all there is. #moral:materialism:+1
        ~ materialism += 1
        Plato: Then you are a materialist, grounding truth in what the senses reveal. #speaker:plato
        Plato: Yet remember: shadows shift, crumble, and fade. Can what perishes be called real? #speaker:plato
        -> story_end
    * * They point to something greater. #moral:idealism:+1
        ~ idealism += 1
        Plato: A wise admission! For even a shadow proves the existence of a form that casts it. #speaker:plato
        Plato: Perhaps you glimpse, however dimly, the eternal realm beyond appearances. #speaker:plato
        -> story_end

=== story_end ===
-> DONE
