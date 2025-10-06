VAR idealism = 0
VAR materialism = 0  
VAR rationalism = 0
VAR empiricism = 0
VAR order = 0
VAR chaos = 0
VAR pessimism = 0

-> descartes_scene

=== descartes_scene ===
A dark study — the only light comes from a candle flickering beside stacks of open notebooks. The smell of ink, burnt wax, and sleeplessness hangs heavy in the air. Rain whispers against the window.  
Descartes sits perfectly still at his desk, eyes sharp, expression detached — as though he’s already dissected your soul and is merely confirming his notes. #speaker:descartes

Descartes: Sit. Or stand, if you still believe your body matters. Most men think they live, but they only dream. Tell me — how do you know you exist? #speaker:descartes

* [Because I can feel pain.] Pain reminds me I’m alive. Nothing else proves it. #moral:materialism:+1 #moral:pessimism:+1
  ~ materialism += 1
  ~ pessimism += 1
  Descartes: Pain? Then a knife defines your reality. How fragile a proof. Do you believe the feeling itself is true, or merely the signal of a dream that hasn’t yet ended? #speaker:descartes

  * * [Pain is real. It’s all I have left.] Pain is real; everything else lies. #moral:materialism:+1 #moral:chaos:+1
      ~ materialism += 1
      ~ chaos += 1
      Descartes: The beast within you speaks. Pain convinces, yes — but the deceiver could mimic it. There must be something that survives even the deception. Search again. #speaker:descartes
      -> descartes_doubt
  * * [Maybe it’s just a dream of pain.] Maybe nothing is real — not even the suffering. #moral:pessimism:+2
      ~ pessimism += 2
      Descartes: The nihilist’s lullaby. Convenient, but lazy. Even to doubt pain requires a mind that _doubts._ Therefore — mind precedes agony. #speaker:descartes
      -> descartes_doubt

* [Because I can think.] Thought is proof enough. #moral:rationalism:+2 #moral:order:+1
  ~ rationalism += 2
  ~ order += 1
  Descartes: _Cogito, ergo sum._ The elegant prison. You exist — but only as a point of thought, surrounded by uncertainty. A mind without anchor. Tell me, what anchors your thought? #speaker:descartes

  * * [Faith used to.] God was the anchor. Then I lost Him. #moral:pessimism:+1 #moral:rationalism:+1
      ~ pessimism += 1
      ~ rationalism += 1
      Descartes: You trusted in the infinite to guarantee the finite — a dangerous dependency. When the infinite withdrew, your geometry collapsed. #speaker:descartes
      -> descartes_doubt
  * * [Nothing anchors it now.] Nothing keeps me steady; I just think and fall deeper. #moral:pessimism:+2 #moral:chaos:+1
      ~ pessimism += 2
      ~ chaos += 1
      Descartes: Then you are a free-floating thought — admirable, tragic. The price of clarity without faith is vertigo. #speaker:descartes
      -> descartes_doubt

* [Because others remember me.] Others see me, speak to me — that must mean I exist. #moral:idealism:+1 #moral:order:+1
  ~ idealism += 1
  ~ order += 1
  Descartes: The testimony of the herd — fragile evidence. You place your being in their eyes, but eyes deceive. When they forget you, will you vanish? #speaker:descartes

  * * [Maybe I already have.] I feel invisible to them already. #moral:pessimism:+2
      ~ pessimism += 2
      Descartes: Then your proof was poor. To depend on the witness of the blind is folly. #speaker:descartes
      -> descartes_doubt
  * * [No, I exist even if unseen.] Even unseen, I remain. #moral:rationalism:+1 #moral:idealism:+1
      ~ rationalism += 1
      ~ idealism += 1
      Descartes: Better. You glimpse self-certainty. Yet remember — self-certainty can harden into arrogance, or dissolve into solipsism. Choose carefully. #speaker:descartes
      -> descartes_doubt

* [I don’t know anymore.] I used to know; now I don’t. #moral:pessimism:+2
  ~ pessimism += 2
  Descartes: Then we begin where philosophy begins — in ignorance. The fool claims knowledge; the wounded know they don’t. #speaker:descartes
  -> descartes_doubt

=== descartes_doubt ===
Descartes leans forward; the candle casts monstrous shadows across his face. His tone sharpens — less teacher, more inquisitor. #speaker:descartes  
Descartes: Doubt is the purest acid. It dissolves error — and occasionally, the doubter. The question is whether you can endure the corrosion. What, in your mind, must never be doubted? #speaker:descartes

* [Love.] Love must be real. #moral:idealism:+1 #moral:order:+1
  ~ idealism += 1
  ~ order += 1
  Descartes: Sentiment as evidence — fragile, but human. Tell me: is love a truth of reason, or merely a hallucination of need? #speaker:descartes

  * * [A hallucination.] Love is chemical comfort. #moral:materialism:+1 #moral:pessimism:+1
      ~ materialism += 1
      ~ pessimism += 1
      Descartes: Then you stand alone in your experiment — a specimen of despair observing its own dissolution. #speaker:descartes
      -> descartes_reflection
  * * [A truth.] Love is the only real thing I’ve felt. #moral:idealism:+1 #moral:rationalism:+1
      ~ idealism += 1
      ~ rationalism += 1
      Descartes: Then your heart, not your logic, sustains you. Perhaps you are not as dead as you wish. #speaker:descartes
      -> descartes_reflection

* [Reason.] Reason is the only torch I trust. #moral:rationalism:+2
  ~ rationalism += 2
  Descartes: Then reason must be pure — a perfect tool in imperfect hands. Are your hands steady enough to wield it, or does your madness shake the blade? #speaker:descartes

  * * [It shakes.] I cannot think straight anymore. #moral:pessimism:+2
      ~ pessimism += 2
      Descartes: Then the deceiver has already won. Doubt devoured you not to enlighten, but to paralyze. #speaker:descartes
      -> descartes_reflection
  * * [I keep steady enough.] My logic keeps me from breaking entirely. #moral:rationalism:+1 #moral:order:+1
      ~ rationalism += 1
      ~ order += 1
      Descartes: Then nurture it, coldly. Emotion clouds judgment. If you must survive, do so with the mind as shield and weapon. #speaker:descartes
      -> descartes_reflection

* [Nothing.] Nothing is beyond doubt. #moral:pessimism:+2 #moral:chaos:+1
  ~ pessimism += 2
  ~ chaos += 1
  Descartes: Then you have mistaken skepticism for suicide. A man who doubts all truth also doubts his capacity to live. You stand not in inquiry, but in decay. #speaker:descartes
  * * [Maybe that’s honesty.] Maybe decay is the only truth left. #moral:pessimism:+2
      ~ pessimism += 2
      Descartes: Honesty without purpose is merely confession before death. I expected a student; I find a mourner. #speaker:descartes
      -> descartes_reflection
  * * [Then I will find one thing.] I will search until something endures. #moral:idealism:+1 #moral:rationalism:+1
      ~ idealism += 1
      ~ rationalism += 1
      Descartes: Good. Seek rigor — not comfort. If you survive this inquiry, you may become more human than before. #speaker:descartes
      -> descartes_reflection

=== descartes_reflection ===
The candlelight flickers. Descartes folds his hands before his mouth, eyes unreadable. The storm outside grows louder, like a ticking clock threatening to stop. #speaker:descartes

Descartes: Doubt is a scalpel, not a tomb. But you — you wield it like a dagger against your own chest. You wanted clarity; instead, you bled certainties.  
He leans closer, voice low. #speaker:descartes  
Descartes: Tell me, soldier: when you stare into nothing and call it truth, are you seeking knowledge — or permission to vanish? #speaker:descartes

* [Knowledge.] I still want to know. Even if it kills me. #moral:rationalism:+2
  ~ rationalism += 2
  Descartes: Then I salute your intellect — and mourn your heart. Truth without warmth becomes autopsy. #speaker:descartes
  -> descartes_scene_end

* [Permission.] I just want it to stop. To be done. #moral:pessimism:+3
  ~ pessimism += 3
  Descartes: So you mistake despair for certainty. Death will grant no truth — only silence. You will die ignorant, but briefly relieved. #speaker:descartes
  -> descartes_scene_end

* [Neither.] I want to remember how to trust. #moral:idealism:+2 #moral:order:+1
  ~ idealism += 2
  ~ order += 1
  Descartes: Trust begins not in others, but in a disciplined mind. Clean your reason of superstition, of cowardice, of wishful thinking. Then — perhaps — truth will speak back. #speaker:descartes
  -> descartes_scene_end

=== descartes_scene_end ===
The candle gutters out. For a moment, the darkness feels total — and then, faintly, the rain resumes its rhythm, indifferent and precise.  
Descartes’ voice lingers in the dark like an afterthought:  
Descartes: I sought certainty and found solitude. You, soldier, have found the same. Perhaps that is the truest proof of existence: to suffer alone, and still think. #speaker:descartes

-> DONE
