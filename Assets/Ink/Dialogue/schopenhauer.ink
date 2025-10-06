VAR idealism = 0
VAR materialism = 0  
VAR rationalism = 0
VAR empiricism = 0
VAR order = 0
VAR chaos = 0
VAR pessimism = 0

-> schopenhauer_scene

=== schopenhauer_scene ===
The air is cold.  
A single candle fights the dark, its flame shaking in a breathless room.  
The walls are covered with mirrors — cracked, smeared, each one reflecting a version of you that looks a little less alive.  
Schopenhauer sits on the floor, back against the wall, coat draped over his knees.  
He doesn’t look up. He just speaks. #speaker:schopenhauer

Schopenhauer:  
Tell me something, before the light goes out.  
Do you still think the world means well? #speaker:schopenhauer

* [No.] Not anymore. #moral:pessimism:+2
  ~ pessimism += 2
  Schopenhauer:  
   Good. You’ve stopped pretending.  
   The world doesn’t care if you breathe or choke — it just keeps turning.  
   That’s what living things do: they consume. #speaker:schopenhauer
  -> schopenhauer_reflection

* [Maybe once.] When I thought God was watching. #moral:idealism:+1 #moral:pessimism:+1
  ~ idealism += 1
  ~ pessimism += 1
  Schopenhauer:  
   God was never watching. You were.  
   You built the eye that judged you. Then you prayed to it. #speaker:schopenhauer
  -> schopenhauer_reflection

* [Yes.] There’s still something good left. #moral:idealism:+2
  ~ idealism += 2
  Schopenhauer:  
   You’re not wrong. Just naïve.  
   The light you see isn’t hope — it’s decay burning slow enough to look pretty. #speaker:schopenhauer
  -> schopenhauer_reflection

* [I stopped thinking about it.] I just live. Eat. Drink. Sleep. #moral:materialism:+1 #moral:pessimism:+1
  ~ materialism += 1
  ~ pessimism += 1
  Schopenhauer:  
   Then you’ve done better than most.  
   Thought is the wound. Animals are lucky — they bleed, but they don’t _know_ they’re bleeding. #speaker:schopenhauer
  -> schopenhauer_reflection

=== schopenhauer_reflection ===
The mirrors hum softly, like glass remembering screams.  
Your reflection blurs — it’s you, but hollow, like someone scraped out the part that believed in morning.  
Schopenhauer’s voice follows, low and even. #speaker:schopenhauer

Schopenhauer:  
Life doesn’t ask. It takes.  
It takes your hunger, your love, your faith, and turns them into reasons to keep you chained here.  
You can’t win. You can only stop struggling long enough to see the cage.  
Did you ever find peace in all that noise? #speaker:schopenhauer

* [For a minute.] Then it slipped away. #moral:pessimism:+2 #moral:materialism:+1
  ~ pessimism += 2
  ~ materialism += 1
  Schopenhauer:  
   That’s all peace ever is — a pause before the next wave hits.  
   You thought it was the shore. It was just the eye of the storm. #speaker:schopenhauer
  -> schopenhauer_suffering

* [No.] I never did. #moral:pessimism:+3
  ~ pessimism += 3
  Schopenhauer:  
   Good. At least you’re honest.  
   Some people spend their whole lives trying to turn pain into poetry. You just let it rot. #speaker:schopenhauer
  -> schopenhauer_suffering

* [Maybe that’s what life is.] The noise. #moral:chaos:+1 #moral:rationalism:+1
  ~ chaos += 1
  ~ rationalism += 1
  Schopenhauer:  
   Then stop calling it life. Call it what it is — hunger that doesn’t know what it wants.  
   Every heartbeat’s just the body begging for something it can’t have. #speaker:schopenhauer
  -> schopenhauer_suffering

* [It worked once.] When I loved someone. #moral:idealism:+2 #moral:pessimism:+1
  ~ idealism += 2
  ~ pessimism += 1
  Schopenhauer:  
   Love.  
   The longest con the Will ever pulled.  
   It makes you bleed for someone else and calls it virtue. #speaker:schopenhauer
  -> schopenhauer_suffering

=== schopenhauer_suffering ===
The candle wavers. Shadows stretch across the mirrors until your reflection looks like it’s drowning in black water.  
Schopenhauer’s eyes finally rise — gray, hollow, too tired to hate. #speaker:schopenhauer

Schopenhauer:  
You think you’ve suffered more than others. You haven’t.  
You’ve just noticed it more.  
That’s the curse of being aware — every scream, every wound in the world becomes a mirror.  
You carry them until you forget which one was yours. #speaker:schopenhauer

* [Then peace is death.] Why not end it now? #moral:pessimism:+3
  ~ pessimism += 3
  Schopenhauer:  
   Death doesn’t fix it. The Will doesn’t care if you die — it just starts over with someone new.  
   It’ll build another fool and give him your hunger. #speaker:schopenhauer
  -> schopenhauer_final

* [Then I’ll live without expecting peace.] I’ll stop asking for more. #moral:order:+1 #moral:rationalism:+1
  ~ order += 1
  ~ rationalism += 1
  Schopenhauer:  
   Maybe that’s the closest thing to wisdom — not joy, not faith, just the quiet that comes when you stop begging for better. #speaker:schopenhauer
  -> schopenhauer_final

* [Then I’ll help someone else.] If we all hurt, maybe we can soften it. #moral:idealism:+2 #moral:order:+1
  ~ idealism += 2
  ~ order += 1
  Schopenhauer:  
   Compassion’s the only rebellion left — the only time the Will shuts up.  
   But don’t lie to yourself. You still help others because it makes _you_ hurt less. #speaker:schopenhauer
  -> schopenhauer_final

* [Then I’ll kill it myself.] End everything I touch. #moral:chaos:+2 #moral:pessimism:+1
  ~ chaos += 2
  ~ pessimism += 1
  Schopenhauer:  
   You can’t kill the Will. Every death just feeds it.  
   You’d be another offering — and it would thank you by forgetting. #speaker:schopenhauer
  -> schopenhauer_final

=== schopenhauer_final ===
The last candle dies.  
For a second, everything stops — even your heartbeat sounds like it’s holding its breath.  
Schopenhauer speaks from the dark. His voice sounds close enough to touch. #speaker:schopenhauer

Schopenhauer:  
You want to know what the world is?  
It’s a wound that heals just enough to keep bleeding again.  
We call that “hope.” #speaker:schopenhauer

He exhales — not like a sigh, but like giving up on breathing.  
Schopenhauer:  
If you still want to live, do it quietly. Don’t dream. Don’t reach. Don’t make more noise than you must.  
Every want is another scream in a world that’s already deaf. #speaker:schopenhauer

* [Then I’ll be quiet.] I’ll fade with the rest. #moral:order:+2 #moral:pessimism:+1
  ~ order += 2
  ~ pessimism += 1
  Schopenhauer:  
   Then the world will thank you in its own way — by forgetting you completely. #speaker:schopenhauer
  -> schopenhauer_scene_end

* [No.] I’ll live loud. Even if it hurts. #moral:chaos:+2 #moral:idealism:+1
  ~ chaos += 2
  ~ idealism += 1
  Schopenhauer:  
   Then scream. Let the Will sing through you.  
   The brave ones don’t win — they just burn better. #speaker:schopenhauer
  -> schopenhauer_scene_end

* [I’ll try to help.] Maybe that’s enough. #moral:idealism:+2 #moral:order:+1
  ~ idealism += 2
  ~ order += 1
  Schopenhauer:  
   Maybe.  
   If there’s any redemption, it’s in the small mercies no one notices. #speaker:schopenhauer
  -> schopenhauer_scene_end

* [I’ll embrace it.] Pain’s all I’ve got left. #moral:chaos:+1 #moral:rationalism:+1
  ~ chaos += 1
  ~ rationalism += 1
  Schopenhauer:  
   Then wear it like armor. Just remember — armor rusts from the inside. #speaker:schopenhauer
  -> schopenhauer_scene_end

=== schopenhauer_scene_end ===
The darkness thickens until even your reflection disappears.  
Somewhere far off, a sound — maybe wind, maybe breathing, maybe the world still turning.  
Schopenhauer’s voice drifts like smoke. #speaker:schopenhauer

Schopenhauer:  
The world isn’t evil. It’s just hungry.  
It eats everything that tries to mean something.  
If you can’t stop it — at least don’t feed it. #speaker:schopenhauer

-> DONE
