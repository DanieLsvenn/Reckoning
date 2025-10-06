VAR idealism = 0
VAR materialism = 0  
VAR rationalism = 0
VAR empiricism = 0
VAR order = 0
VAR chaos = 0
VAR pessimism = 0

-> marx_scene

=== marx_scene ===
The room is industrial — red light seeps through high, dust-caked windows.  
The air hums faintly, as if some great machine just beyond the walls has never stopped running.  
Karl Marx stands before it, coat unbuttoned, face lit by the dull glow of molten metal.  
He doesn’t look at you — he looks at the world. #speaker:marx

Marx: You smell of labor, not virtue.  
Every man who works, kills a little. Every man who kills, works for someone richer.  
Tell me, soldier — when you served, who profited? #speaker:marx

* [No one did.] No one did. It was just chaos. #moral:chaos:+2 #moral:pessimism:+1
  ~ chaos += 2
  ~ pessimism += 1
  Marx: Chaos is a myth told by those who command order.  
   Even madness has accountants. Every bullet, every ration, every corpse — paid for, owned, written down. #speaker:marx
  -> marx_reflection

* [The powerful.] The ones who stay safe behind the curtains. #moral:idealism:+1 #moral:pessimism:+1
  ~ idealism += 1
  ~ pessimism += 1
  Marx: Yes. The lords of comfort — they build heaven on bones.  
   You carried the burden so they could sing hymns to profit. #speaker:marx
  -> marx_reflection

* [I don’t know.] I just did what I was told. #moral:order:+1 #moral:pessimism:+1
  ~ order += 1
  ~ pessimism += 1
  Marx: Obedience — the cheapest form of labor.  
   The mind becomes the overseer of its own chains. #speaker:marx
  -> marx_reflection

* [I served my country.] I served my country. That was enough. #moral:order:+2 #moral:idealism:+1
  ~ order += 2
  ~ idealism += 1
  Marx: “Country” — the prettiest word for an owner’s flag.  
   They drew borders around your blood and called it patriotism. #speaker:marx
  -> marx_reflection

=== marx_reflection ===
Marx paces, boots echoing against concrete.  
Every movement feels like a rhythm beaten out by a factory still grinding the poor into dust.  
He stops, looking at the floor as if seeing ghosts in the oil stains. #speaker:marx

Marx: I dreamed of a world where labor freed men — where work built dignity, not debt.  
Instead, labor became the chain.  
The worker sells his hours, his body, his silence… until he’s nothing left to sell but the memory of who he was.  
You’ve seen that dream die, haven’t you? #speaker:marx

* [I’ve seen worse.] Dreams die quietly. Men die loud. #moral:pessimism:+2 #moral:chaos:+1
  ~ pessimism += 2
  ~ chaos += 1
  Marx: And the world applauds both.  
   The market calls it efficiency. The Church calls it sacrifice.  
   I call it theft on a divine scale. #speaker:marx
  -> marx_tyranny

* [Work gave me purpose once.] Until I stopped believing in it. #moral:idealism:+1 #moral:pessimism:+1
  ~ idealism += 1
  ~ pessimism += 1
  Marx: Purpose is the first thing they sell you — and the last thing they take.  
   When purpose collapses, you see the gears turning. You realize: no one was driving. #speaker:marx
  -> marx_tyranny

* [No one deserves freedom.] Everyone serves something. #moral:pessimism:+2 #moral:order:+1
  ~ pessimism += 2
  ~ order += 1
  Marx: A bitter truth, but half-true.  
   The other half is this: service becomes slavery only when the master lies about his divinity. #speaker:marx
  -> marx_tyranny

* [It’s not my problem anymore.] The world’s broken. I won’t fix it. #moral:chaos:+2 #moral:materialism:+1
  ~ chaos += 2
  ~ materialism += 1
  Marx: The bourgeoisie thanks you for your resignation.  
   Every man who stops fighting is another brick in their fortress. #speaker:marx
  -> marx_tyranny

=== marx_tyranny ===
Marx’s tone changes — not louder, but heavier, each word landing like a verdict.  
He gestures toward the unseen machinery.  
Its hum grows louder, like a distant crowd chanting under iron. #speaker:marx

Marx: They call it progress.  
But every empire, every republic, every “order” — it’s the same furnace.  
The poor burn, the rich warm their hands, and the ashes are called history.  
Do you know what terrifies me most, soldier?  
That one day, even the ashes will forget they were once men. #speaker:marx

* [So burn it all.] Maybe we start again from zero. #moral:chaos:+2 #moral:pessimism:+1
  ~ chaos += 2
  ~ pessimism += 1
  Marx: You think the flame redeems the cinder. It doesn’t.  
   Fire obeys no ideology. The machine will simply rebuild itself out of your rebellion. #speaker:marx
  -> marx_final

* [There has to be a better way.] Something beyond blood and labor. #moral:idealism:+2 #moral:order:+1
  ~ idealism += 2
  ~ order += 1
  Marx: There might have been.  
   But every noble idea becomes a factory slogan the moment it gains currency. #speaker:marx
  -> marx_final

* [The machine can’t be stopped.] So why try? #moral:pessimism:+2 #moral:order:+1
  ~ pessimism += 2
  ~ order += 1
  Marx: Then you’ve accepted servitude as sanity.  
   History loves men like you — the ones who make its chains invisible. #speaker:marx
  -> marx_final

* [Let the rich rot with the poor.] Equality in ruin. #moral:chaos:+1 #moral:pessimism:+1
  ~ chaos += 1
  ~ pessimism += 1
  Marx: You confuse destruction with justice.  
   The graveyard is equal, yes — but it’s also silent. #speaker:marx
  -> marx_final

=== marx_final ===
The hum dies down. Silence takes the air like a verdict.  
Marx stands still — for the first time, he looks directly at you. His eyes are not angry, but disappointed.  
The kind of disappointment reserved for the species itself. #speaker:marx

Marx: I gave the world a prophecy.  
They turned it into a manual for power.  
Even revolution became another commodity.  
He steps closer, voice like iron dragged across glass.  
Marx: You think your suffering is yours alone.  
It isn’t.  
It’s a symptom of a structure that eats everything — even those who fight it.  
And you, my dear worker of death, are just one more cog asking why the gears grind. #speaker:marx

* [Then what’s the point?] Why fight? #moral:pessimism:+2
  ~ pessimism += 2
  Marx: There is no point. Only struggle.  
   Meaning is forged, not found — and most melt before the metal cools. #speaker:marx
  -> marx_scene_end

* [Then I’ll fight anyway.] If only to spite the machine. #moral:idealism:+2 #moral:chaos:+1
  ~ idealism += 2
  ~ chaos += 1
  Marx: Good. Spite has its own purity.  
   Even doomed resistance feeds the myth of freedom.  
   Let that myth outlive us. #speaker:marx
  -> marx_scene_end

* [Then I’ll serve it.] Might as well be honest. #moral:materialism:+1 #moral:pessimism:+1
  ~ materialism += 1
  ~ pessimism += 1
  Marx: Every machine loves the man who confesses to it.  
   But confession is not absolution — it’s surrender. #speaker:marx
  -> marx_scene_end

* [No one owns me.] I refuse all sides. #moral:chaos:+2 #moral:rationalism:+1
  ~ chaos += 2
  ~ rationalism += 1
  Marx: Then you’ve made yourself your own economy — self-contained, self-consuming.  
   Freedom without purpose is just anarchy in a coffin. #speaker:marx
  -> marx_scene_end

=== marx_scene_end ===
The furnace groans. Sparks fall like dying stars.  
Marx turns away, hands clasped behind his back. #speaker:marx

Marx: History is a butcher’s ledger written in fire.  
Men live, suffer, and call it progress.  
If redemption exists, it won’t come from heaven.  
It will crawl from the ruins with ash in its lungs and call itself “change.” #speaker:marx

He pauses.  
Marx: You’ve seen the worst of men.  
Now tell me, soldier — will you join the pile, or the fire that burns it? #speaker:marx

-> DONE
