VAR idealism = 0
VAR materialism = 0  
VAR rationalism = 0
VAR empiricism = 0
VAR order = 0
VAR chaos = 0
VAR pessimism = 0

-> nietzsche_scene

=== nietzsche_scene ===
A great empty hall.  
The mirrors are gone. The floor is cracked marble streaked with veins of red light.  
At the center stands Nietzsche — shirt open, chest scarred, hair wild.  
He looks like a prophet who’s been awake for a thousand years and still refuses to die.  
Behind him, a faint, endless scream rolls like wind through a cathedral. #speaker:nietzsche

Nietzsche:  
So… the man finally crawls out of his coffin.  
Did you enjoy Schopenhauer’s lullaby? He always did love teaching corpses how to whisper.  
Tell me, soldier — when did you decide to make peace with your own rot? #speaker:nietzsche

* [I didn’t.] I just stopped fighting. #moral:pessimism:+2
  ~ pessimism += 2
  Nietzsche:  
   Stopped fighting?  
   You call surrender peace — I call it decay that learned how to speak.  
   The world doesn’t forgive stagnation; it buries it. #speaker:nietzsche
  -> nietzsche_reflection

* [After the killing.] I couldn’t fight anymore. #moral:pessimism:+1 #moral:order:+1
  ~ pessimism += 1
  ~ order += 1
  Nietzsche:  
   Ah, morality — the final drug of the guilty.  
   You killed and then tried to invent peace to excuse the nausea.  
   You didn’t lose your faith. You traded it for shame. #speaker:nietzsche
  -> nietzsche_reflection

* [When God left.] There was nothing to fight for. #moral:idealism:+1 #moral:pessimism:+1
  ~ idealism += 1
  ~ pessimism += 1
  Nietzsche:  
   God didn’t leave.  
   You pushed Him off the tower when He stopped obeying you.  
   Don’t weep over a servant you fired. #speaker:nietzsche
  -> nietzsche_reflection

* [I never made peace.] I just got tired. #moral:chaos:+1 #moral:materialism:+1
  ~ chaos += 1
  ~ materialism += 1
  Nietzsche:  
   Then you are half-alive — the worst kind.  
   Too afraid to die, too numb to live.  
   The in-betweeners, the lukewarm, the half-broken — I have no patience for them. #speaker:nietzsche
  -> nietzsche_reflection

=== nietzsche_reflection ===
He starts pacing — every step echoes like thunder.  
His hands twitch as he speaks, as if he’s trying to rip something invisible out of the air. #speaker:nietzsche

Nietzsche:  
You think despair is noble? It’s not.  
It’s just another excuse to hide from the burden of creation.  
You see suffering and call it proof of the world’s cruelty.  
I see it and call it _the price of being awake._  
You suffer because you still matter enough to feel pain. #speaker:nietzsche

* [I don’t want to matter.] I just want it to stop. #moral:pessimism:+3
  ~ pessimism += 3
  Nietzsche:  
   Then crawl back into the dirt and let worms finish what the war started.  
   You want peace, not truth. You want to die without admitting you chose to. #speaker:nietzsche
  -> nietzsche_will

* [I wanted meaning.] I just couldn’t find it. #moral:idealism:+2 #moral:rationalism:+1
  ~ idealism += 2
  ~ rationalism += 1
  Nietzsche:  
   Meaning isn’t found. It’s carved — from blood, from fear, from will.  
   You prayed for it instead of _making_ it. That’s why you broke. #speaker:nietzsche
  -> nietzsche_will

* [Pain isn’t meaning.] It’s just pain. #moral:rationalism:+1 #moral:materialism:+1
  ~ rationalism += 1
  ~ materialism += 1
  Nietzsche:  
   Wrong. Pain _is_ meaning — stripped naked.  
   You think joy makes gods? No.  
   Only those who bleed without apology ever become real. #speaker:nietzsche
  -> nietzsche_will

* [I matter to no one.] That’s why it hurts. #moral:pessimism:+2 #moral:idealism:+1
  ~ pessimism += 2
  ~ idealism += 1
  Nietzsche:  
   Lies. You just never mattered to yourself.  
   And you made the mistake of expecting love to fix that. #speaker:nietzsche
  -> nietzsche_will

=== nietzsche_will ===
He laughs — low, rough, genuine. It sounds like someone remembering pain as proof they’re still alive. #speaker:nietzsche

Nietzsche:  
The weak worship their wounds.  
They hold them like relics, polish them, show them off and call it humility.  
You’re no different. You call your misery wisdom because it’s easier than standing up.  
Where’s your fire, soldier? Did the world take it, or did you hand it over? #speaker:nietzsche

* [The world took it.] It stripped me bare. #moral:pessimism:+2
  ~ pessimism += 2
  Nietzsche:  
   The world takes nothing. You _give_ it away.  
   You let it. That’s the sin you can’t admit. #speaker:nietzsche
  -> nietzsche_power

* [I gave it up.] I couldn’t trust it anymore. #moral:idealism:+1 #moral:pessimism:+1
  ~ idealism += 1
  ~ pessimism += 1
  Nietzsche:  
   Then trust something else. Yourself.  
   If you can’t worship a god, then build one in your own image. #speaker:nietzsche
  -> nietzsche_power

* [I never had any fire.] Just orders. Just noise. #moral:order:+1 #moral:pessimism:+1
  ~ order += 1
  ~ pessimism += 1
  Nietzsche:  
   Then you lived as a machine — now try dying as a man.  
   The first breath of freedom always tastes like blood. #speaker:nietzsche
  -> nietzsche_power

* [It’s still there.] Buried. Waiting. #moral:chaos:+2 #moral:idealism:+1
  ~ chaos += 2
  ~ idealism += 1
  Nietzsche:  
   Good. That’s life — clawing under the dirt, screaming to be let out.  
   Don’t kill it. Unleash it. #speaker:nietzsche
  -> nietzsche_power

=== nietzsche_power ===
Nietzsche steps close, his voice burning hot enough to feel like breath against skin.  
The faint screaming in the hall grows louder — it’s not horror, but laughter, like joy that forgot its reason. #speaker:nietzsche

Nietzsche:  
You call yourself damned because you loved, fought, killed, doubted.  
But that’s _being human._  
All those clean souls hiding behind faith and law — they rot slower, that’s all.  
You have seen what they won’t. You’ve looked straight into the pit.  
So why are you crawling away from it instead of building a throne inside? #speaker:nietzsche

* [Because it’s hell.] I don’t want to live there. #moral:idealism:+1 #moral:pessimism:+2
  ~ idealism += 1
  ~ pessimism += 2
  Nietzsche:  
   Then you’re still a believer — a child afraid of his own shadow.  
   Hell isn’t punishment. It’s home for those who stopped pretending. #speaker:nietzsche
  -> nietzsche_final

* [Because I don’t deserve that power.] Not after what I’ve done. #moral:order:+2 #moral:idealism:+1
  ~ order += 2
  ~ idealism += 1
  Nietzsche:  
   Deserve?  
   The lion doesn’t ask if it deserves the sun.  
   You’re still begging for permission to exist. Pathetic. #speaker:nietzsche
  -> nietzsche_final

* [Because I like it.] Power feels honest. #moral:chaos:+2 #moral:materialism:+1
  ~ chaos += 2
  ~ materialism += 1
  Nietzsche:  
   Finally. Honesty.  
   You were never a saint. You were just too cowardly to admit you enjoyed the burn. #speaker:nietzsche
  -> nietzsche_final

* [Because I can make something from it.] Maybe it’s not too late. #moral:idealism:+2 #moral:rationalism:+1
  ~ idealism += 2
  ~ rationalism += 1
  Nietzsche:  
   Creation through ruin — the only kind that matters.  
   Pain is your raw material. Use it or be used by it. #speaker:nietzsche
  -> nietzsche_final

=== nietzsche_final ===
He spreads his arms wide — a silhouette backlit by fire leaking through the cracks in the world.  
For a second, he looks almost divine, almost monstrous, and perfectly proud to be both. #speaker:nietzsche

Nietzsche:  
Schopenhauer wanted you to be quiet.  
I want you to _roar._  
If there is no God — then every act is sacred, because you chose it.  
That’s the weight. That’s the glory. #speaker:nietzsche

He laughs again — not at you, but with something in you that’s finally starting to move.  
Nietzsche:  
There’s no redemption. No forgiveness.  
Only the will — raw, endless, hungry.  
Feed it, soldier.  
Or it’ll feed on you. #speaker:nietzsche

* [Then I’ll rise.] I’ll stand on my own. #moral:idealism:+2 #moral:order:+1
  ~ idealism += 2
  ~ order += 1
  Nietzsche:  
   Good. Rise filthy, rise broken — rise anyway.  
   That’s godhood enough. #speaker:nietzsche
  -> nietzsche_scene_end

* [Then I’ll burn.] If that’s what life is, I’ll burn. #moral:chaos:+2 #moral:pessimism:+1
  ~ chaos += 2
  ~ pessimism += 1
  Nietzsche:  
   Burn bright, then. The gods you killed will envy your flame. #speaker:nietzsche
  -> nietzsche_scene_end

* [Then I’ll reject it all.] I want no thrones. No crowns. #moral:order:+2 #moral:idealism:+1
  ~ order += 2
  ~ idealism += 1
  Nietzsche:  
   Rejecting power is still an act of power.  
   Just don’t pretend it makes you pure. #speaker:nietzsche
  -> nietzsche_scene_end

* [Then I’ll watch it die with me.] Let the world choke on silence. #moral:pessimism:+3
  ~ pessimism += 3
  Nietzsche:  
   The truest nihilist.  
   Even death won’t remember your name — and that’s your victory. #speaker:nietzsche
  -> nietzsche_scene_end

=== nietzsche_scene_end ===
The red light explodes. The marble splits. The hall screams.  
When the sound dies, Nietzsche is gone. Only echoes remain — echoes that sound too much like your own heartbeat. #speaker:nietzsche

Nietzsche (distant):  
You keep asking what you are.  
Stop.  
Be it.  
That’s the only answer worth anything. #speaker:nietzsche

-> DONE
