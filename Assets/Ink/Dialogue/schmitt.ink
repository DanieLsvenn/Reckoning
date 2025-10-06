VAR idealism = 0
VAR materialism = 0  
VAR rationalism = 0
VAR empiricism = 0
VAR order = 0
VAR chaos = 0
VAR pessimism = 0

-> schmitt_scene

=== schmitt_scene ===
The room is a courtroom and a tomb at once: black wood, a single low lamp, a long table that eats light.  
The air moves as if someone sighed centuries ago and never stopped.  
Carl Schmitt sits at the head like a judge who has always been a little too eager for verdicts.  
He wears no malice on his face — only the precise interest of a man who has catalogued every sin.  
When he speaks, the voice is silk over steel. #speaker:schmitt

Schmitt:  
Sit. Do not hurry. Confessions are clumsy; what I want is not noise but a clean name.  
Names make things true. They make enemies inevitable. They carve the world into bite-sized facts. Isn't that right, Mr. Marshall? #speaker:schmitt

* [I won’t be named.] I refuse your categories. #moral:chaos:+1
  ~ chaos += 1
  Schmitt:  
   Refusal is a kind of answer — the most pitiful, because it forces me to name you anyway.  
   You ask for anonymity; I will give you classification. #speaker:schmitt
  -> schmitt_reflection

* [Do it.] Name me. I can bear it. #moral:order:+1
  ~ order += 1
  Schmitt:  
   Brave, or desperate. We will see. There is dignity in being named if you accept the consequences.  
   But know this — names are not mercy. They are laws that wait to be enforced. #speaker:schmitt
  -> schmitt_reflection

* [There is nothing left to judge.] I am already empty. #moral:pessimism:+2
  ~ pessimism += 2
  Schmitt:  
   Excellent. Emptiness is the richest soil for decision.  
   A hollow man presents no denial; he is easily declared enemy and conveniently disposed of. #speaker:schmitt
  -> schmitt_reflection

* [You’re not a god.] You are a man with a ledger. #moral:rationalism:+1
  ~ rationalism += 1
  Schmitt:  
   I am a man who knows what decisions do. God is a sentiment; I am an instrument.  
   Instruments make outcomes. Outcomes do not beg. #speaker:schmitt
  -> schmitt_reflection

=== schmitt_reflection ===
He opens a thin book — no volume, only a list of single, terrible words.  
Each word sits on the page like a bone. He traces one with the tip of a finger, smiling as if reading a menu. #speaker:schmitt

Schmitt:  
You came back from the world wearing noise and blood. You want to call that anything but war — call it morality, call it duty. I call it raw data.  
That is all politics ever was: someone deciding whose life continues and whose life can be excused away. #speaker:schmitt

* [So name my enemy.] If naming is the point, say it. #moral:order:+1
  ~ order += 1
  Schmitt:  
   Very well. There are patterns here; they are small and ugly.  
   Is your enemy the self that woke you each night? The world that paid for your obedience? Or the institutions that clothed cruelty in banners? #speaker:schmitt
  -> schmitt_query

* [No more names.] Words have failed me. #moral:pessimism:+2
  ~ pessimism += 2
  Schmitt:  
   Words and laws only fail those unwilling to choose. But failure is a kind of mercy: it strips away pretence and leaves the raw thing. #speaker:schmitt
  -> schmitt_query

* [Name them all.] The whole world is to blame. #moral:chaos:+2 #moral:materialism:+1
  ~ chaos += 2
  ~ materialism += 1
  Schmitt:  
   Blanket condemnation. Passionate, imprecise. A dangerous starting point — people who name everything as enemy later carve names into bones. #speaker:schmitt
  -> schmitt_query

* [Name me.] If you must, take the instrument and strike. #moral:order:+2 #moral:pessimism:+1
  ~ order += 2
  ~ pessimism += 1
  Schmitt:  
   That willingness is interesting. Saints volunteer; tyrants volunteer. The difference is how they sleep. #speaker:schmitt
  -> schmitt_query

=== schmitt_query ===
The lamp gutters. Outside, something like distant chanting — or perhaps the wind — stitches the silence into a rhythm like a heartbeat.  
He leans in with merciless courtesy. Each sentence is a small, courteous knife. #speaker:schmitt

Schmitt:  
Answer plainly. Who is your enemy? Choose one word if you must. This is not rhetoric; it is the arithmetic of consequence. #speaker:schmitt

* [Myself.] #moral:pessimism:+2 #moral:order:+1
  ~ pessimism += 2
  ~ order += 1
  Schmitt:  
   Splendid. Self as enemy — the most intimate sort. You will judge yourself in private and obey yourself in public.  
   That is a sovereign without audience. It is a rule of one, and the loneliest crown. #speaker:schmitt
  -> schmitt_consequence

* [The world that sent me.] The world that sent me. #moral:chaos:+1 #moral:pessimism:+1
  ~ chaos += 1
  ~ pessimism += 1
  Schmitt:  
   A tidy scapegoat. The world is a convenient abstraction; it makes revenge ceremonial. Beware: revenge needs an apparatus. Who will give it to you? #speaker:schmitt
  -> schmitt_consequence

* [Those in power.] #moral:idealism:+1 #moral:order:+1
  ~ idealism += 1
  ~ order += 1
  Schmitt:  
   Then you seek to replace a name with another name — to climb the ladder of command. Ambition wears the same clothes as vengeance. #speaker:schmitt
  -> schmitt_consequence

* [No one.] #moral:pessimism:+3
  ~ pessimism += 3
  Schmitt:  
   Then you choose oblivion as policy. That is a political stance, and the dead are notoriously tidy citizens. #speaker:schmitt
  -> schmitt_consequence

=== schmitt_consequence ===
He taps the ledger; the sound is like teeth.  
There is no mercy in his cadence — only the comfortable certainty of one who knows what decisions compel. #speaker:schmitt

Schmitt:  
Choices birth institutions. Institutions birth outcomes. Outcomes stain hands.  
If you say “myself,” you invite punishment, reform, or execution — but you remain sovereign of your fate. If you say “them,” you mobilize, you riot, you become a name that others will read and fear. If you say “no one,” you choose erasure. #speaker:schmitt

* [I’ll judge myself.] I’ll answer for it. #moral:order:+2 #moral:idealism:+1
  ~ order += 2
  ~ idealism += 1
  Schmitt:  
   Noble, and clean. Self-judgment is the slowest justice — a purgatory you must administer daily. Some find peace in such ledger-keeping; others crush under the weight. #speaker:schmitt
  -> schmitt_final

* [I’ll fight them.] I’ll name an enemy and act. #moral:chaos:+2 #moral:materialism:+1
  ~ chaos += 2
  ~ materialism += 1
  Schmitt:  
   Then pick your instruments carefully. Violence organizes itself. The righteous often become the most efficient monsters. Do you accept that risk? #speaker:schmitt
  -> schmitt_final

* [I’ll erase myself.] I’ll vanish. #moral:pessimism:+3
  ~ pessimism += 3
  Schmitt:  
   Erasure is popular among the exhausted. It is tidy, merciless, and final. History respects nothing more than a blank space where a man used to be. #speaker:schmitt
  -> schmitt_final

* [I’ll name the corrupt few.] Targeted justice. #moral:order:+1 #moral:idealism:+1
  ~ order += 1
  ~ idealism += 1
  Schmitt:  
   Precision. Dangerous, righteous, and rarer than you think. Targets must be identified, witnesses gathered, patience applied. It is the bureaucrat’s vengeance — slow, legal, durable. #speaker:schmitt
  -> schmitt_final

=== schmitt_final ===
He closes the thin book with a soft, satisfied motion. The room grows colder, as if his decision took heat from the air. #speaker:schmitt

Schmitt:  
Listen to me and do not mistake the gentleness for mercy. I am the man who teaches that enemies are not metaphors — they are nouns.  
Once you name them, everything follows: law, violence, memory, oblivion. That chain is long and elegant. It breaks things beautifully. #speaker:schmitt

He smiles, and the smile is small and surgical. The lamp throws his face into a relief of bone. #speaker:schmitt

Schmitt:  
If you claim the self as enemy, you will become a shrine to discipline or a martyr to madness.  
If you claim the world, you will find the machinery of power hungry and clever.  
If you claim the powerful, you must become their mirror — and mirrors always lie.  
If you claim no one, you will be erased, and the ledger will breathe easier without you. #speaker:schmitt

* [Then make me a judge.] I’ll take the name and its weight. #moral:order:+2 #moral:chaos:+1
  ~ order += 2
  ~ chaos += 1
  Schmitt:  
   Very well. Take the instrument. Rule. The peace you crave will be bought with decisions that stain. You will be sovereign — and perhaps, in the end, monstrous. #speaker:schmitt
  -> schmitt_scene_end

* [Then let me die unmarked.] Take me out of the story. #moral:pessimism:+3
  ~ pessimism += 3
  Schmitt:  
   A graceful cowardice. The quietest way to avoid responsibility is to vanish. The world will shrug and carry on. #speaker:schmitt
  -> schmitt_scene_end

* [Then let me try to fix it.] I’ll name the corrupt few and rebuild. #moral:idealism:+2 #moral:order:+1
  ~ idealism += 2
  ~ order += 1
  Schmitt:  
   Then learn patience. Revolutions are started by fury and finished by clerks. If you want repair, prepare to be made small by the very systems you dream of changing. #speaker:schmitt
  -> schmitt_scene_end

* [I will burn them all.] All of it. #moral:chaos:+3 #moral:materialism:+1
  ~ chaos += 3
  ~ materialism += 1
  Schmitt:  
   Brutal honesty. Great conflagrations are spectacular to watch. They are also sterile. You will not live to see what grows after the fire. #speaker:schmitt
  -> schmitt_scene_end

=== schmitt_scene_end ===
He stands, the motion economical and final. His voice is the memory of a verdict. #speaker:schmitt

Schmitt:  
Decide, then. All law begins with a definition. All havoc begins with a promise. You have been given a word. Say it aloud, and see what the world will do in response. #speaker:schmitt

He leans forward. For a moment, his face is a blade under candlelight. The last thing he says is not advice; it is an instruction that tastes like ash. #speaker:schmitt

Schmitt:  
Name your enemy — and earn your right. #speaker:schmitt

-> DONE
