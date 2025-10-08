/*VAR idealism = 0
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
*/

VAR idealism = 0
VAR materialism = 0  
VAR rationalism = 0
VAR empiricism = 0
VAR order = 0
VAR chaos = 0
VAR pessimism = 0

-> descartes_scene

=== descartes_scene ===
Một căn phòng u tối — ngọn nến duy nhất lập lòe bên những chồng sổ tay mở toang. Mùi mực, sáp cháy và mất ngủ quẩn quanh trong không khí. Tiếng mưa thì thầm bên khung cửa sổ.  
Descartes ngồi bất động sau bàn, ánh mắt sắc bén, nét mặt lạnh lẽo — như thể ông đã mổ xẻ linh hồn ngươi, và giờ chỉ đang xác nhận lại ghi chú của mình. #speaker:descartes

Descartes: Ngồi đi. Hoặc đứng, nếu ngươi vẫn tin thân thể mình có nghĩa. Đa số con người tưởng rằng họ đang sống — nhưng thật ra chỉ đang mộng du. Nói ta nghe — ngươi biết mình tồn tại bằng cách nào? #speaker:descartes

* [Vì tôi cảm nhận được đau đớn.] Nỗi đau nhắc tôi rằng mình vẫn sống. Không gì khác chứng minh được điều đó. #moral:materialism:+1 #moral:pessimism:+1
  ~ materialism += 1
  ~ pessimism += 1
  Descartes: Đau đớn ư? Vậy ra một lưỡi dao định nghĩa hiện thực của ngươi. Một chứng cứ mong manh biết bao. Ngươi tin cảm giác ấy là thật — hay chỉ là tín hiệu của một cơn mộng chưa tàn? #speaker:descartes

  * * [Nỗi đau là thật. Đó là tất cả những gì tôi còn lại.] Nỗi đau là thật; mọi thứ khác đều dối trá. #moral:materialism:+1 #moral:chaos:+1
      ~ materialism += 1
      ~ chaos += 1
      Descartes: Con thú trong ngươi đang nói. Đau đớn thuyết phục, đúng thế — nhưng kẻ lừa dối có thể bắt chước nó. Phải có thứ gì vẫn còn, ngay cả khi mọi ảo tưởng bị bóc trần. Tìm lại lần nữa đi. #speaker:descartes
      -> descartes_doubt
  * * [Có lẽ đó chỉ là giấc mơ của đau đớn.] Có lẽ chẳng có gì là thật — kể cả nỗi khổ. #moral:pessimism:+2
      ~ pessimism += 2
      Descartes: Lời ru của kẻ hư vô. Tiện lợi, nhưng lười biếng. Ngay cả để nghi ngờ nỗi đau, cũng cần có một tâm trí _đang nghi ngờ._ Vậy nên — tâm trí có trước khổ đau. #speaker:descartes
      -> descartes_doubt

* [Vì tôi có thể suy nghĩ.] Suy tưởng là bằng chứng đủ rồi. #moral:rationalism:+2 #moral:order:+1
  ~ rationalism += 2
  ~ order += 1
  Descartes: _Cogito, ergo sum._ — “Ta tư duy, nên ta tồn tại.” Một nhà tù tao nhã. Ngươi tồn tại, nhưng chỉ như một điểm ý thức, bị bao quanh bởi nghi hoặc. Một tâm trí không mỏ neo. Nói ta nghe, điều gì neo giữ tư tưởng của ngươi? #speaker:descartes

  * * [Niềm tin từng làm điều đó.] Thượng Đế từng là chiếc neo. Rồi ta đánh mất Người. #moral:pessimism:+1 #moral:rationalism:+1
      ~ pessimism += 1
      ~ rationalism += 1
      Descartes: Ngươi đã tin vào cái vô hạn để bảo chứng cho cái hữu hạn — một sự phụ thuộc nguy hiểm. Khi cái vô hạn rút lui, hình học của ngươi sụp đổ. #speaker:descartes
      -> descartes_doubt
  * * [Giờ chẳng còn gì níu giữ.] Không còn gì giữ ta vững; ta chỉ suy nghĩ và trôi sâu hơn. #moral:pessimism:+2 #moral:chaos:+1
      ~ pessimism += 2
      ~ chaos += 1
      Descartes: Vậy ngươi là một ý niệm trôi nổi tự do — đáng kính, nhưng bi thảm. Cái giá của sự sáng tỏ không có đức tin là cơn chóng mặt vô tận. #speaker:descartes
      -> descartes_doubt

* [Vì người khác nhớ đến tôi.] Họ thấy tôi, nói chuyện với tôi — nghĩa là tôi tồn tại. #moral:idealism:+1 #moral:order:+1
  ~ idealism += 1
  ~ order += 1
  Descartes: Lời chứng của đám đông — một chứng cớ mỏng manh. Ngươi đặt bản thể mình trong mắt họ, nhưng ánh mắt biết dối trá. Khi họ quên ngươi, ngươi cũng tan biến sao? #speaker:descartes

  * * [Có lẽ tôi đã biến mất rồi.] Tôi đã cảm thấy vô hình trong mắt họ từ lâu. #moral:pessimism:+2
      ~ pessimism += 2
      Descartes: Vậy thì luận cứ của ngươi yếu ớt. Dựa vào lời chứng của kẻ mù là một sai lầm. #speaker:descartes
      -> descartes_doubt
  * * [Không, tôi vẫn tồn tại dù chẳng ai thấy.] Dù vô hình, tôi vẫn còn đó. #moral:rationalism:+1 #moral:idealism:+1
      ~ rationalism += 1
      ~ idealism += 1
      Descartes: Tốt hơn. Ngươi đã thoáng thấy sự tự chứng của bản thân. Nhưng nhớ lấy — tự chứng có thể hóa kiêu mạn, hoặc tan vào cô độc tuyệt đối. Hãy chọn cẩn thận. #speaker:descartes
      -> descartes_doubt

* [Tôi không còn biết nữa.] Trước đây tôi biết; giờ thì không. #moral:pessimism:+2
  ~ pessimism += 2
  Descartes: Vậy thì ta bắt đầu tại nơi triết học khởi sinh — trong vô minh. Kẻ ngu dại tự cho là biết; kẻ tổn thương biết rằng mình không. #speaker:descartes
  -> descartes_doubt

=== descartes_doubt ===
Descartes nghiêng người về phía trước; ánh nến kéo dài bóng ông thành quái vật. Giọng ông sắc lại — không còn là bậc thầy, mà là kẻ tra vấn. #speaker:descartes  
Descartes: Nghi ngờ là thứ axit tinh khiết nhất. Nó hòa tan sai lầm — và đôi khi, cả kẻ nghi ngờ. Vấn đề là: ngươi có chịu nổi sự ăn mòn đó không? Có điều gì trong tâm trí ngươi là không thể nghi ngờ chăng? #speaker:descartes

* [Tình yêu.] Tình yêu phải là thật. #moral:idealism:+1 #moral:order:+1
  ~ idealism += 1
  ~ order += 1
  Descartes: Cảm xúc làm bằng chứng — yếu ớt, nhưng nhân tính. Nói ta nghe: tình yêu là chân lý của lý trí, hay chỉ là ảo giác của nhu cầu? #speaker:descartes

  * * [Là ảo giác.] Tình yêu chỉ là sự an ủi hóa học. #moral:materialism:+1 #moral:pessimism:+1
      ~ materialism += 1
      ~ pessimism += 1
      Descartes: Thế thì ngươi đứng một mình trong thí nghiệm của chính mình — một mẫu vật tuyệt vọng, đang quan sát sự tan rã của bản thân. #speaker:descartes
      -> descartes_reflection
  * * [Là chân lý.] Tình yêu là điều thật duy nhất ta từng cảm nhận. #moral:idealism:+1 #moral:rationalism:+1
      ~ idealism += 1
      ~ rationalism += 1
      Descartes: Vậy là trái tim, chứ không phải lý trí, đang duy trì ngươi. Có lẽ ngươi chưa chết như ngươi tưởng. #speaker:descartes
      -> descartes_reflection

* [Lý trí.] Lý trí là ngọn đuốc duy nhất ta tin. #moral:rationalism:+2
  ~ rationalism += 2
  Descartes: Vậy lý trí phải tinh khiết — công cụ hoàn hảo trong tay không hoàn hảo. Tay ngươi có đủ vững để cầm nó, hay cơn điên đã khiến lưỡi dao run rẩy? #speaker:descartes

  * * [Nó run.] Ta không còn suy nghĩ mạch lạc nữa. #moral:pessimism:+2
      ~ pessimism += 2
      Descartes: Vậy là kẻ lừa dối đã thắng rồi. Nghi ngờ nuốt chửng ngươi, không phải để soi sáng, mà để tê liệt. #speaker:descartes
      -> descartes_reflection
  * * [Ta vẫn giữ được.] Lý trí giúp ta chưa tan vỡ hoàn toàn. #moral:rationalism:+1 #moral:order:+1
      ~ rationalism += 1
      ~ order += 1
      Descartes: Vậy hãy nuôi dưỡng nó — một cách lạnh lùng. Cảm xúc làm mờ phán đoán. Nếu muốn sống sót, hãy lấy trí tuệ làm khiên và gươm. #speaker:descartes
      -> descartes_reflection

* [Không có gì.] Không có gì vượt khỏi nghi ngờ. #moral:pessimism:+2 #moral:chaos:+1
  ~ pessimism += 2
  ~ chaos += 1
  Descartes: Vậy ngươi đã nhầm chủ nghĩa hoài nghi với tự sát. Kẻ nghi ngờ mọi chân lý cũng đã nghi ngờ khả năng sống của mình. Ngươi không đứng trong truy vấn, mà đang mục rữa trong nó. #speaker:descartes
  * * [Có lẽ đó là sự trung thực.] Có lẽ mục rữa là chân lý duy nhất còn lại. #moral:pessimism:+2
      ~ pessimism += 2
      Descartes: Trung thực mà không có mục đích chỉ là lời xưng tội trước cái chết. Ta chờ một môn sinh, mà gặp một kẻ chịu tang. #speaker:descartes
      -> descartes_reflection
  * * [Vậy ta sẽ tìm một điều.] Ta sẽ tìm đến khi có thứ gì còn tồn tại. #moral:idealism:+1 #moral:rationalism:+1
      ~ idealism += 1
      ~ rationalism += 1
      Descartes: Tốt. Hãy tìm sự nghiêm cẩn — không phải sự an ủi. Nếu ngươi sống sót qua cuộc truy vấn này, ngươi có thể trở nên người hơn bao giờ hết. #speaker:descartes
      -> descartes_reflection

=== descartes_reflection ===
Ánh nến chập chờn. Descartes đan tay trước miệng, ánh mắt không thể đoán. Cơn bão ngoài kia gầm lên, như tiếng đồng hồ sắp ngừng đếm. #speaker:descartes

Descartes: Nghi ngờ là con dao mổ, không phải nấm mồ. Nhưng ngươi — ngươi dùng nó như lưỡi dao đâm ngược vào tim mình. Ngươi tìm sự sáng tỏ; đổi lại, chỉ còn những chân lý đang chảy máu.  
Ông nghiêng sát hơn, giọng trầm xuống. #speaker:descartes  
Descartes: Nói ta nghe, chiến binh — khi ngươi nhìn vào hư vô và gọi đó là chân lý, ngươi đang tìm kiếm tri thức — hay tìm sự cho phép để biến mất? #speaker:descartes

* [Tri thức.] Ta vẫn muốn biết. Dù có chết vì điều đó. #moral:rationalism:+2
  ~ rationalism += 2
  Descartes: Vậy ta cúi đầu trước trí tuệ của ngươi — và thương tiếc trái tim ngươi. Chân lý không hơi ấm sẽ hóa thành cuộc giải phẫu lạnh lẽo. #speaker:descartes
  -> descartes_scene_end

* [Sự cho phép.] Ta chỉ muốn tất cả dừng lại. Hết rồi. #moral:pessimism:+3
  ~ pessimism += 3
  Descartes: Vậy ngươi nhầm tuyệt vọng với chắc chắn. Cái chết chẳng ban tặng chân lý nào — chỉ mang đến im lặng. Ngươi sẽ chết trong ngu dốt, nhưng được an ủi tạm thời. #speaker:descartes
  -> descartes_scene_end

* [Không phải cả hai.] Ta chỉ muốn nhớ lại cách tin tưởng. #moral:idealism:+2 #moral:order:+1
  ~ idealism += 2
  ~ order += 1
  Descartes: Niềm tin khởi đầu không ở người khác, mà ở tâm trí đã được rèn luyện. Hãy gột sạch lý trí khỏi mê tín, khỏi hèn nhát, khỏi những ảo vọng dễ chịu. Khi ấy — có lẽ — chân lý sẽ lên tiếng đáp lại. #speaker:descartes
  -> descartes_scene_end

=== descartes_scene_end ===
Ngọn nến phụt tắt. Trong khoảnh khắc, bóng tối như nuốt trọn tất cả — rồi rất khẽ, tiếng mưa lại trở về, đều đặn và lạnh lùng.  
Giọng Descartes vẫn vang trong màn đêm như một dư âm:  
Descartes: Ta tìm sự chắc chắn, và chỉ thấy cô độc. Còn ngươi, chiến binh, cũng thế. Có lẽ đó mới là bằng chứng chân thực nhất của tồn tại: chịu đựng cô đơn, mà vẫn tiếp tục suy tư. #speaker:descartes

-> DONE
