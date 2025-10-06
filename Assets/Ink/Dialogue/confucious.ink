VAR idealism = 0
VAR materialism = 0  
VAR rationalism = 0
VAR empiricism = 0
VAR order = 0
VAR chaos = 0
VAR pessimism = 0

-> confucius_scene

=== confucius_scene ===
A quiet courtyard shrouded in perpetual dusk. Stone lanterns burn with dull, red light. The air tastes of incense and damp paper. Confucius stands beside an ancient tree, hands folded neatly within his sleeves. His eyes are steady, but their warmth feels rehearsed — the gaze of a man who has already judged you. #speaker:confucius

Confucius: You come here, foreign son, carrying ruin in your wake. I will not ask what you have done. The rites are not for confession; they are for order. Tell me — what do you think the world owes to you? #speaker:confucius

* [Nothing. The world owes me nothing.] I deserve nothing. The world took its due. #moral:pessimism:+2 #moral:order:+1
  ~ pessimism += 2
  ~ order += 1
  Confucius: A humble answer, or perhaps a broken one. When a man forgets his place, chaos follows. When he denies his worth, decay follows faster. Which is yours — pride or neglect? #speaker:confucius

  * * [Neglect. I abandoned my duties.] I walked away from every role I had. #moral:pessimism:+1 #moral:order:+1
      ~ pessimism += 1
      ~ order += 1
      Confucius: The Way does not vanish when a man flees it. It waits. The shame you feel is the shadow of that waiting. But shame can temper — if you kneel long enough to learn why. #speaker:confucius
      -> confucius_ritual
  * * [Pride. I thought I could make my own path.] I thought I could walk outside the system, above it. #moral:chaos:+2 #moral:rationalism:+1
      ~ chaos += 2
      ~ rationalism += 1
      Confucius: A man who despises order soon becomes a ghost to all bonds — family, duty, heaven. Ghosts wander; they do not build. Do you still believe in building? #speaker:confucius
      -> confucius_ritual

* [The world owes me fairness.] It should have been fair. I gave and was left with nothing. #moral:materialism:+1 #moral:pessimism:+1
  ~ materialism += 1
  ~ pessimism += 1
  Confucius: Fairness is a fiction of rulers. What the world owes you is the shape of your own virtue. Heaven sees through balance, not bargains. You demand justice — but have you practiced it? #speaker:confucius

  * * [I tried, and it failed.] I tried to live by justice. It did not protect me. #moral:pessimism:+2 #moral:order:+1
      ~ pessimism += 2
      ~ order += 1
      Confucius: Then you misunderstood justice as a shield rather than a burden. The noble man holds the law even when it crushes him. #speaker:confucius
      -> confucius_ritual
  * * [No. I only demanded it.] I wanted others to be just, not myself. #moral:chaos:+1 #moral:materialism:+1
      ~ chaos += 1
      ~ materialism += 1
      Confucius: Then you are like the crooked magistrate who condemns thieves while pocketing their coins. Balance cannot be begged; it must be cultivated. #speaker:confucius
      -> confucius_ritual

* [The world owes me peace.] I only wanted quiet — no banners, no screaming. #moral:pessimism:+1 #moral:idealism:+1
  ~ pessimism += 1
  ~ idealism += 1
  Confucius: Peace is not quiet. It is order humming beneath the surface — harmony earned through restraint. You sought the stillness of death, not the order of life. Tell me, soldier, do you still crave silence more than meaning? #speaker:confucius
  * * [Yes. Meaning is a wound.] I prefer numbness to meaning; meaning always hurts. #moral:pessimism:+2 #moral:materialism:+1
      ~ pessimism += 2
      ~ materialism += 1
      Confucius: Then you are already among the unfilial dead — those who speak nothing, feel nothing, and leave nothing. The quiet you seek is not peace, but punishment. #speaker:confucius
      -> confucius_ritual
  * * [No. I want harmony.] Harmony, not silence. Balance, not oblivion. #moral:idealism:+1 #moral:order:+1
      ~ idealism += 1
      ~ order += 1
      Confucius: Then learn harmony by attending the smallest forms — greeting, courtesy, discipline. The Way begins in gesture before it ever reaches heaven. #speaker:confucius
      -> confucius_ritual

=== confucius_ritual ===
A faint sound of a drum echoes. Confucius gestures to the courtyard floor, where faint lines form a circle — the ritual boundary. #speaker:confucius
Confucius: Each man stands within a circle of duties — father, son, friend, subject. When one fails, the others sag. Tell me which circle you broke first. #speaker:confucius

* [The circle of family.] I failed my kin — stopped writing, stopped calling. #moral:pessimism:+1 #moral:order:+1
  ~ pessimism += 1
  ~ order += 1
  Confucius: To neglect the roots is to doom the tree. You sought freedom, and found hollowness. Return to the roots if you wish for fruit. #speaker:confucius

  * * [They would not forgive me.] They wouldn’t accept me back. #moral:pessimism:+2
      ~ pessimism += 2
      Confucius: Forgiveness is their duty, but repentance is yours. Write to them, even if the page burns before it’s sent. The ritual matters even if unseen. #speaker:confucius
      -> confucius_reflection
  * * [I might return someday.] I will try, someday. #moral:idealism:+1 #moral:order:+1
      ~ idealism += 1
      ~ order += 1
      Confucius: “Someday” is a word that rots deeds. Begin now, while your name can still be spoken without spitting. #speaker:confucius
      -> confucius_reflection

* [The circle of comrades.] I failed those beside me. I left them to rot. #moral:pessimism:+2 #moral:chaos:+1
  ~ pessimism += 2
  ~ chaos += 1
  Confucius: Loyalty is the spine of man. Without it, the body folds. You broke the spine and wonder why you crawl. #speaker:confucius

  * * [They deserved better than me.] I was not fit to lead or follow. #moral:pessimism:+2
      ~ pessimism += 2
      Confucius: Self-pity masks cowardice. The brave face guilt with action, not lament. Visit their graves if they still exist. Speak to the dead if the living will not listen. #speaker:confucius
      -> confucius_reflection
  * * [I could not bear their deaths.] I left because their deaths haunted me. #moral:pessimism:+1 #moral:idealism:+1
      ~ pessimism += 1
      ~ idealism += 1
      Confucius: A noble fear — but fear must not be the master. Honor their deaths by carrying their virtues, not their ghosts. #speaker:confucius
      -> confucius_reflection

* [The circle of heaven.] I broke faith with heaven itself. I stopped believing. #moral:pessimism:+2 #moral:rationalism:+1
  ~ pessimism += 2
  ~ rationalism += 1
  Confucius: Heaven does not demand belief. It demands alignment. You mistook faith for favor. The heavens are not sentimental — they mirror your conduct, not your prayers. #speaker:confucius
  * * [Then heaven is cruel.] Heaven is indifferent — why should I serve it? #moral:chaos:+1 #moral:pessimism:+1
      ~ chaos += 1
      ~ pessimism += 1
      Confucius: Cruel? No. Uncompromising. You call it cruelty because it refuses to flatter your pain. #speaker:confucius
      -> confucius_reflection
  * * [Then I will align again.] If belief is hollow, I will practice alignment. #moral:order:+1 #moral:idealism:+1
      ~ order += 1
      ~ idealism += 1
      Confucius: Practice, not feeling, restores the Way. Conduct is the only prayer heaven answers. #speaker:confucius
      -> confucius_reflection

=== confucius_reflection ===
The incense dims. The red lanterns flicker until only the outline of Confucius remains. His voice turns colder, quieter. #speaker:confucius

Confucius: Ritual without virtue is theater. Virtue without ritual is noise. You Westerners call it hypocrisy; I call it civilization. Do not ask heaven to forgive — act in a way that needs no forgiveness. #speaker:confucius

He pauses, head tilted slightly — not kindly.  
Confucius: If you truly wish for harmony, start where the smallest cracks form — the greeting, the promise, the tone. Civilization begins in the mouth before it ever reaches the soul. But perhaps it is too late for your mouth to speak decently. #speaker:confucius

* [I can still learn.] Then teach me. I can still learn the right words. #moral:idealism:+1 #moral:order:+1
  ~ idealism += 1
  ~ order += 1
  Confucius: Then bow. Practice without faith is still better than faith without practice. If you repeat the gesture enough, the heart might follow. #speaker:confucius
  -> confucius_scene_end

* [Words won’t fix rot.] Words mean nothing to a corpse. #moral:pessimism:+2 #moral:chaos:+1
  ~ pessimism += 2
  ~ chaos += 1
  Confucius: Then rot elegantly. Even a dying tree must fall in accordance with form. #speaker:confucius
  -> confucius_scene_end

* [I reject your order.] Rituals are lies for those afraid to think. #moral:chaos:+2 #moral:rationalism:+1
  ~ chaos += 2
  ~ rationalism += 1
  Confucius: Thought without ritual breeds monsters that reason their own decay. Perhaps that is what you are — the monster reason made when it lost shame. #speaker:confucius
  -> confucius_scene_end

=== confucius_scene_end ===
Confucius folds his hands once more. The lantern light dims until only his silhouette remains — rigid, unbending, eternal. #speaker:confucius
Confucius: Heaven does not forgive. It endures. If you wish to endure with it, discipline yourself until the body obeys the mind, and the mind obeys something higher. If not — the mud welcomes you. #speaker:confucius

-> DONE
