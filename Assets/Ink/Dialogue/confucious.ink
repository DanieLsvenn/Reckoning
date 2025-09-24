VAR order = 0
VAR chaos = 0

-> confucius_intro

=== confucius_intro ===
Confucius: Welcome, traveler, to the Hall of Rites. #speaker:confucius
Confucius: Here we seek not only wisdom, but harmony between Heaven, Earth, and humanity. #speaker:confucius
Confucius: Tell me, seeker—will you walk the path of li (ritual and order), or follow only your own heart’s desire? #speaker:confucius
* To follow li, the way of order. #moral:order:+1
    ~ order += 1
    Confucius: Ah, noble choice! Ritual cultivates respect, and respect nurtures virtue. #speaker:confucius #sticker:order_scroll
    Confucius: Yet tell me—do you follow li because you fear punishment, or because you revere harmony itself? #speaker:confucius
    * * Out of fear of punishment. #moral:chaos:+1
        ~ chaos += 1
        Confucius: Then your virtue is shallow, for it bends only when threatened. #speaker:confucius
        Confucius: True harmony must spring from the heart, not from fear. #speaker:confucius
        -> story_end
    * * Out of reverence for harmony. #moral:order:+1
        ~ order += 1
        Confucius: Indeed! To act with reverence is to align oneself with Heaven’s way. #speaker:confucius
        Confucius: You walk the path of the junzi—the noble person. #speaker:confucius
        -> story_end

* To follow my own heart’s desire. #moral:chaos:+1
    ~ chaos += 1
    Confucius: Many pursue desire—for it is easy, immediate, and sweet to the tongue. #speaker:confucius #sticker:chaos_flame
    Confucius: But tell me—does desire lead to harmony, or to disorder? #speaker:confucius
    * * It leads to harmony. #moral:order:+1
        ~ order += 1
        Confucius: If one’s desires are virtuous, then yes—desire and harmony may unite. #speaker:confucius
        Confucius: Yet such a heart is rare, requiring constant cultivation. #speaker:confucius
        -> story_end
    * * It leads to disorder. #moral:chaos:+1
        ~ chaos += 1
        Confucius: Then you see clearly. For when desire rules unchecked, families break, kingdoms fall, and harmony shatters. #speaker:confucius
        Confucius: Beware the path of chaos—it is wide, but it ends in ruin. #speaker:confucius
        -> story_end

=== story_end ===
-> DONE
