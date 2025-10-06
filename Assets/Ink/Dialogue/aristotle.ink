VAR idealism = 0
VAR materialism = 0  
VAR rationalism = 0
VAR empiricism = 0
VAR order = 0
VAR chaos = 0
VAR pessimism = 0

-> aristotle_scene

=== aristotle_scene ===
A narrow stoa at dusk. The columns throw long, accusing shadows across the stone. The air smells faintly of oil and dust — old virtues kept like moth-eaten cloaks. Aristotle stands with one hand behind his back, watching you as if you were an experiment gone slightly wrong. #speaker:aristotle

Aristotle: Walk with me, if you must. Philosophy is not a pleasant bath — it is a scalpel. Tell me, in blunt terms: what do you call a life worth living? Do not dress your answer in pious comforts. #speaker:aristotle

* [A life of pleasure — stop the pain] I want comfort. Pleasure quiets the noise; it is the most honest relief I can find. #moral:materialism:+2 #moral:chaos:+1
  ~ materialism += 2
  ~ chaos += 1
  Aristotle: Pleasure is an easy priest to serve. It flatters and then eats you. Men mistake relief for flourishing and call it philosophy. #speaker:aristotle

  * * [Pleasure at least tells the truth] At least pleasure is honest. It tells me what I want. #moral:materialism:+1 #moral:pessimism:+1
      ~ materialism += 1
      ~ pessimism += 1
      Aristotle: Honesty of appetite is not the same as excellence. The appetite tells you what you are prone to — not what you ought to be. #speaker:aristotle #sticker:golden_mean
      -> peripatetic_virtue

  * * [Pleasure is empty] It leaves me hollow. Pleasure is only a brief anesthetic. #moral:idealism:+1 #moral:pessimism:+1
      ~ idealism += 1
      ~ pessimism += 1
      Aristotle: Then you sense rightly; pleasure can be a poor tutor. Seek ends that last longer than the next swallow. #speaker:aristotle
      -> peripatetic_virtue

* [Duty, order, ritual — structure matters] Rules, rituals, duty — these bind a life into shape. I want that shape. #moral:order:+2 #moral:idealism:+1
  ~ order += 2
  ~ idealism += 1
  Aristotle: Good — at least you prefer a garment to rags. Yet structure without discernment becomes a cage. Men worship the rope that binds them and call it salvation. #speaker:aristotle

  * * [Structure steadies me] I need rules; without them I unravel. #moral:order:+1 #moral:rationalism:+1
      ~ order += 1
      ~ rationalism += 1
      Aristotle: Stability is cheap unless it is earned by right practice. Do not confuse obedience with wisdom. #speaker:aristotle #sticker:phronesis
      -> peripatetic_virtue
  * * [Rules feel hollow — they failed me] Rules failed when I tested them; they hide rot beneath a varnish. #moral:pessimism:+2 #moral:materialism:+1
      ~ pessimism += 2
      ~ materialism += 1
      Aristotle: Then examine the rule — is the rule itself corrupt, or the hands that wield it? Either way, virtue cannot thrive on a lie. #speaker:aristotle
      -> peripatetic_virtue

* [Fulfillment — excellence and purpose] Flourishing means realizing what I can be. Call it excellence, call it function fulfilled. #moral:idealism:+2 #moral:rationalism:+1
  ~ idealism += 2
  ~ rationalism += 1
  Aristotle: Eudaimonia — a word people tuck into prayers like talismans. It is not a feeling; it is activity according to excellence. Do you expect a feast or the slow craft of a life? #speaker:aristotle #sticker:eudaimonia

  * * [How do I find excellence?] My habits are ruined. Where does one start? #moral:pessimism:+1 #moral:order:+1
      ~ pessimism += 1
      ~ order += 1
      Aristotle: Begin with the smallest acts. Virtue is habit hammered into habit. The great oak begins as a stubborn shoot. #speaker:aristotle
      -> peripatetic_virtue
  * * [I tried — it failed me] Attempts at betterment turned to ash. I cannot trust them. #moral:pessimism:+2 #moral:materialism:+1
      ~ pessimism += 2
      ~ materialism += 1
      Aristotle: Failure is a tutor whose lessons are harsh. Few learn because few endure the correction. Endure, or remain a catalogue of missteps. #speaker:aristotle
      -> peripatetic_virtue

* [Numbness — I avoid feeling] I shut the world out. Numbness keeps pain hushed. #moral:pessimism:+2 #moral:materialism:+1
  ~ pessimism += 2
  ~ materialism += 1
  Aristotle: Numbness is the grave's apprentice. It denies the soul's faculty to judge and so kills the possibility of repair. We do not need less feeling; we need better-ordered feeling. #speaker:aristotle
  * * [Feeling breaks me] Feeling breaks me because it opens wounds that never close. #moral:pessimism:+2 #moral:materialism:+1
      ~ pessimism += 2
      ~ materialism += 1
      Aristotle: Then you have chosen the coward's economy: pay nothing now and owe infinitely later. Courage is not absence of fear; it is action despite it. #speaker:aristotle
      -> peripatetic_virtue
  * * [I will relearn to feel rightly] I will relearn to feel in measured ways. #moral:idealism:+1 #moral:rationalism:+1
      ~ idealism += 1
      ~ rationalism += 1
      Aristotle: Good. Feeling that answers reason becomes judgment; feeling that runs rampant becomes ruin. #speaker:aristotle
      -> peripatetic_virtue

=== peripatetic_virtue ===
You walk between columns; the light narrows. Aristotle’s voice drops, sharpened by impatience. #speaker:aristotle
Aristotle: Virtue is a habit — not a vow one utters once and keeps like a charm. Tell me: which vice haunts you most when you awake? #speaker:aristotle

* [I live at extremes — everything all or nothing] I swing to extremes; I am either all in or broken. #moral:chaos:+2 #moral:materialism:+1
  ~ chaos += 2
  ~ materialism += 1
  Aristotle: Extremes are for fools and tyrants. Extremity lacks the contour of judgment; it is the act of someone who has abandoned the faculty to measure. Temper your force with thought. #speaker:aristotle

  * * [Moderation feels weak] Moderation looks like surrender. #moral:pessimism:+1 #moral:order:+1
      ~ pessimism += 1
      ~ order += 1
      Aristotle: Weakness is not the mean; it is the absence of the courage required to act rightly. Strength married to prudence is the true victory. #speaker:aristotle
      -> civic_friendship
  * * [Teach me the mean] Show me where the mean lies. #moral:idealism:+1 #moral:rationalism:+1
      ~ idealism += 1
      ~ rationalism += 1
      Aristotle: Observe, practice, correct. Find mentors who scorn vanity and reward patience. #speaker:aristotle
      -> civic_friendship

* [I numb — I avoid everything] I hide in emptiness until the world cannot reach me. #moral:pessimism:+2 #moral:materialism:+1
  ~ pessimism += 2
  ~ materialism += 1
  Aristotle: That is not cleverness; it is an abdication. The mean requires engagement. Numbness is the opposite of civic courage. #speaker:aristotle
  * * [But engagement kills me] Engagement opens old wounds; I cannot risk it. #moral:pessimism:+2 #moral:materialism:+1
      ~ pessimism += 2
      ~ materialism += 1
      Aristotle: Pain is not the only teacher; it is merely the most insistent. Begin with small, safe obligations — a neighbor, a promise kept. Build back your measure. #speaker:aristotle
      -> civic_friendship
  * * [I will practice engagement] I will try small duties and see if the muscles return. #moral:order:+1 #moral:idealism:+1
      ~ order += 1
      ~ idealism += 1
      Aristotle: Then begin. Habit polishes what raw will cannot. #speaker:aristotle
      -> civic_friendship

=== civic_friendship ===
He stops and fixes you with a look that has no tenderness left. #speaker:aristotle
Aristotle: Friendship is a mirror. Some mirrors beautify; others lie. Tell me — what do you seek in companions? #speaker:aristotle

* [Companions who make me forget] I want people who dull the edges — laughter, forgetting. #moral:materialism:+1 #moral:chaos:+1
  ~ materialism += 1
  ~ chaos += 1
  Aristotle: Those are friendships of pleasure: temporary and shallow. They go when the pleasure fades, dragging you with them. #speaker:aristotle

  * * [But they keep me from falling apart] They keep the nights less sharp. #moral:pessimism:+1 #moral:materialism:+1
      ~ pessimism += 1
      ~ materialism += 1
      Aristotle: A brief salve may be useful, but if you live only for salves, you will never build a life. Seek companions who correct you, not merely amuse you. #speaker:aristotle
      -> civic_polis
  * * [I want something deeper] I want anchors — people who hold me to better actions. #moral:idealism:+1 #moral:order:+1
      ~ idealism += 1
      ~ order += 1
      Aristotle: Then be such a friend yourself. Friends of virtue require reciprocity; you must give what you hope to receive. #speaker:aristotle
      -> civic_polis

* [Friends who sharpen me — make me fierce] I want comrades who do not coddle me. #moral:chaos:+1 #moral:order:+1
  ~ chaos += 1
  ~ order += 1
  Aristotle: Courage is valuable — when guided. Bravado without judgment leads to cruelty. Test your comrades: do they admire your virtue or your violence? #speaker:aristotle
  * * [I only know bravado] Bravado was all I learned; it was survival. #moral:pessimism:+1 #moral:materialism:+1
      ~ pessimism += 1
      ~ materialism += 1
      Aristotle: Survival habits may be necessary, but they are not sufficient for a life of excellence. Rework the habits into something honorable. #speaker:aristotle
      -> civic_polis
  * * [I will seek true courage] Then seek comrades who practice courage with wisdom. #moral:idealism:+1 #moral:rationalism:+1
      ~ idealism += 1
      ~ rationalism += 1
      Aristotle: Such friendships are rare; they demand that you first become rare yourself. #speaker:aristotle
      -> civic_polis

=== civic_polis ===
Distantly, a city murmurs — markets and courts and the low machinery of human life. Aristotle's voice turns colder. #speaker:aristotle
Aristotle: The city shapes character. Men are political animals; we find completion in the polis. Tell me plainly: do you belong to a city, or do you drift like cast-off cargo? #speaker:aristotle

* [I am separate — an outsider] I no longer fit in any city. I am adrift. #moral:pessimism:+1 #moral:materialism:+1
  ~ pessimism += 1
  ~ materialism += 1
  Aristotle: Isolation is a slow rot. Civilization requires work and risk; withdrawal buys a private comfort that often ends in private ruin. #speaker:aristotle

  * * [I doubt I can rejoin] I lack the strength to return. #moral:pessimism:+2
      ~ pessimism += 2
      Aristotle: Strength is built, not summoned. Begin with promises you can keep and obligations you can fulfill. Grow the strength by practising it. #speaker:aristotle
      -> aristotle_scene_end
  * * [Maybe I can serve] Perhaps service will anchor me. #moral:idealism:+1 #moral:order:+1
      ~ idealism += 1
      ~ order += 1
      Aristotle: Then serve well and humbly. Great repair is the slow work of many small, honest acts. #speaker:aristotle
      -> aristotle_scene_end

* [The city is rotten] Institutions are corrupt — the city is a carcass. #moral:pessimism:+2 #moral:chaos:+1
  ~ pessimism += 2
  ~ chaos += 1
  Aristotle: Cynicism is fashionable, but it is also convenient. Rot exists; so does repair. If you choose only to denounce, you will become a professional malcontent. #speaker:aristotle

  * * [Rebuilding seems impossible] Rebuilding feels absurd when the rot runs deep. #moral:pessimism:+2 #moral:materialism:+1
      ~ pessimism += 2
      ~ materialism += 1
      Aristotle: Then you are resigned — a spectator of your own decay. Even resignation is a choice; at least choose with full awareness. #speaker:aristotle
      -> aristotle_scene_end

  * * [I might plant a seed] If one seed can grow, perhaps I can try. #moral:order:+1 #moral:idealism:+1
      ~ order += 1
      ~ idealism += 1
      Aristotle: A single wise act can begin the long unravelling of corruption. Plant the seed where it can take root; do not scatter it to the wind. #speaker:aristotle

      -> aristotle_scene_end

      Aristotle drops his gaze to the pavement as if disappointed by the slowness of human repair, then looks back at you with an expression that can be read either as hope or pure calculation. #speaker:aristotle

      Aristotle: Practice. Habit. Courage married to judgment. If you disdain these, you will be remembered as a storm — loud, destructive, forgotten. If you take them, you will be slow and small — and possibly, in time, human again. #speaker:aristotle

=== aristotle_scene_end ===
-> DONE
