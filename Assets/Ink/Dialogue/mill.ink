VAR idealism = 0
VAR materialism = 0  
VAR rationalism = 0
VAR empiricism = 0
VAR order = 0
VAR chaos = 0
VAR pessimism = 0

-> mill_scene

=== mill_scene ===
The room smells of burnt paper and rain-damp books.  
A small fire flickers in the grate, struggling against the grayness pressing through the window.  
John Stuart Mill sits in a heavy chair, sleeves rolled, eyes ringed with sleepless discipline.  
He looks at you not as a sinner, but as a case study — a ruin to be measured. #speaker:mill

Mill: I have written that the good of the many outweighs the pain of the few.  
But when the “few” is oneself, that equation turns cruel, doesn’t it?  
Tell me — did your pleasures ease the world, or merely drown your guilt for a while? #speaker:mill

* [They drowned it.] They were an escape. Nothing noble in them. #moral:pessimism:+2 #moral:materialism:+1
  ~ pessimism += 2
  ~ materialism += 1
  Mill: Escape is never neutral. It leaves pain where you were supposed to stand.  
   You ran from your share of the world’s weight — and someone else had to carry it. #speaker:mill
  -> mill_reflection

* [They eased it.] For a time, they made things bearable. That counts for something. #moral:materialism:+1 #moral:chaos:+1
  ~ materialism += 1
  ~ chaos += 1
  Mill: “For a time.” A dangerous phrase. Every drunk and despot hides behind it.  
   Temporary happiness is how suffering learns to disguise itself. #speaker:mill
  -> mill_reflection

* [There was no happiness.] Pleasure, virtue, meaning — all lies. #moral:pessimism:+3
  ~ pessimism += 3
  Mill: Then you’ve walked further than I dared.  
   I once believed reason could justify joy. You’ve proven that belief naïve. #speaker:mill
  -> mill_reflection

* [I hurt people.] There’s no measure that cancels that. #moral:pessimism:+1 #moral:idealism:+1
  ~ pessimism += 1
  ~ idealism += 1
  Mill: Hurt is rarely erased, but sometimes it can be balanced — not in books, but in choices that cost.  
   Balance begins with the willingness to lose. Are you still willing? #speaker:mill
  * * [Yes. I’ll pay whatever’s left.] Then yes, I’ll pay. If it means peace. #moral:order:+1 #moral:idealism:+1
      ~ order += 1
      ~ idealism += 1
      Mill: A dangerous kind of honesty. Justice without ego can border on martyrdom. But perhaps that’s the cleanest arithmetic left. #speaker:mill
      -> mill_reflection
  * * [No. I’ve paid enough.] I’ve paid. The rest belongs to them. #moral:chaos:+1 #moral:materialism:+1
      ~ chaos += 1
      ~ materialism += 1
      Mill: Then you’ve chosen peace over equity. The living always do. #speaker:mill
      -> mill_reflection

=== mill_reflection ===
Mill rises, walking to the fireplace. He stares into the coals as if reading a slow, red scripture.  
His voice is low — conversational, almost kind — but every word is an incision. #speaker:mill

Mill: People think morality is a sermon. It isn’t. It’s a trade.  
Every comfort you take costs someone something — their time, their breath, their chance at peace.  
You, of all people, should understand that. #speaker:mill

He turns, his eyes catching the firelight — not angry, not pitying, just… tired.  
Mill: I spent my life arguing that the good of the many justified my own pain.  
You, soldier, did the opposite — you sought to feel better and let the world bleed.  
And tell me — did it work? Do you feel alive yet? #speaker:mill

* [No. I feel nothing.] Nothing left to save. #moral:pessimism:+2
  ~ pessimism += 2
  Mill: Then you are the perfect utilitarian product: a man reduced to zero.  
   Nothing wasted. Nothing redeemed. #speaker:mill
  -> mill_weight

* [A little.] Some moments still glow. #moral:idealism:+1 #moral:order:+1
  ~ idealism += 1
  ~ order += 1
  Mill: Then tend them. The faintest spark has utility. Even faint light can hold back the dark. #speaker:mill
  -> mill_weight

* [Alive, yes — but filthy.] I lived. It wasn’t worth it. #moral:pessimism:+1 #moral:chaos:+1
  ~ pessimism += 1
  ~ chaos += 1
  Mill: That’s the cost of unmeasured freedom — liberty without restraint curdles into appetite.  
   You traded conscience for motion, and now call the ache “living.” #speaker:mill
  -> mill_weight

=== mill_weight ===
The wind knocks against the glass.  
Mill’s tone darkens — the patience of a man who has seen too many moral optimists rot into cynics. #speaker:mill

Mill: I once believed pain could educate — that suffering refined the soul like iron under flame.  
But I was wrong. Pain only instructs those who already listen.  
The rest just burn louder. #speaker:mill

He steps closer, his shadow taller than his body.  
Mill: You want forgiveness? It’s simple arithmetic.  
Do something — anything — that makes the world slightly less unbearable.  
And if you can’t, then at least die without adding to the total. #speaker:mill

* [Then I’ll try.] One act, however small. I can do that. #moral:idealism:+2 #moral:order:+1
  ~ idealism += 2
  ~ order += 1
  Mill: Then that’s morality enough for the dying — not a system, but a gesture. #speaker:mill
  -> mill_scene_end

* [I’ve added too much already.] It’s too late to subtract anything. #moral:pessimism:+3
  ~ pessimism += 3
  Mill: Every arithmetic of guilt ends the same way — the debt exceeds the lifetime.  
   But the mind insists on counting anyway. That’s punishment enough. #speaker:mill
  -> mill_scene_end

* [I don’t care about the world.] The world never cared about me. #moral:chaos:+2 #moral:materialism:+1
  ~ chaos += 2
  ~ materialism += 1
  Mill: Then you’ve become the very thing philosophy fears — not a villain, but an empty man.  
   The kind who leaves no pain behind because he leaves nothing at all. #speaker:mill
  -> mill_scene_end

=== mill_scene_end ===
The fire dies into a slow pulse of ash.  
Mill doesn’t look at you again — his voice comes thin, nearly broken. #speaker:mill

Mill: Freedom means the right to suffer for one’s own mistakes.  
You’ve earned that right more than most.  
But liberty without virtue is just noise in an empty house.  
He sets down his teacup, finally cold.  
Mill: Go, then. Make your noise.  
At least it will mean someone’s still alive to make it. #speaker:mill

-> DONE
