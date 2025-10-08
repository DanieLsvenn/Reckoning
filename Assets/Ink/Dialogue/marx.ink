/*VAR idealism = 0
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
*/

VAR idealism = 0
VAR materialism = 0  
VAR rationalism = 0
VAR empiricism = 0
VAR order = 0
VAR chaos = 0
VAR pessimism = 0
-> marx_scene

=== marx_scene ===
Căn phòng mang hơi thở công nghiệp — ánh sáng đỏ rỉ qua những ô cửa sổ cao phủ bụi.  
Không khí rung nhẹ, như thể có một cỗ máy khổng lồ ngay sau bức tường chưa bao giờ ngừng vận hành.  
Karl Marx đứng trước nó, áo khoác mở, khuôn mặt được hắt sáng bởi ánh kim loại nóng chảy.  
Ông không nhìn ngươi — ông nhìn thế giới. #speaker:marx
Marx: Ngươi mang mùi của lao động, không phải của đức hạnh.  
Mỗi kẻ lao động đều giết đi một phần con người mình. Mỗi kẻ giết đều đang làm việc cho kẻ giàu hơn.  
Nói ta nghe, người lính — khi ngươi phục vụ, ai là kẻ thu lợi? #speaker:marx
* [Không ai cả.] Không ai cả. Chỉ là hỗn loạn thôi. #moral:chaos:+2 #moral:pessimism:+1  
~ chaos += 2  
~ pessimism += 1  
Marx: Hỗn loạn chỉ là câu chuyện do những kẻ cai trị trật tự kể ra.  
Ngay cả điên loạn cũng có kế toán của nó. Mỗi viên đạn, mỗi khẩu phần, mỗi xác chết — đều được trả giá, sở hữu, ghi lại. #speaker:marx  
-> marx_reflection
* [Kẻ quyền lực.] Những kẻ an toàn sau tấm màn. #moral:idealism:+1 #moral:pessimism:+1  
~ idealism += 1  
~ pessimism += 1  
Marx: Đúng vậy. Những lãnh chúa của sự tiện nghi — họ xây thiên đường bằng xương người.  
Ngươi mang gánh nặng để họ hát thánh ca ca ngợi lợi nhuận. #speaker:marx  
-> marx_reflection
* [Ta không biết.] Ta chỉ làm theo lệnh. #moral:order:+1 #moral:pessimism:+1  
~ order += 1  
~ pessimism += 1  
Marx: Sự vâng lời — hình thức lao động rẻ nhất.  
Tâm trí trở thành giám sát viên của chính xiềng xích mình. #speaker:marx  
-> marx_reflection
* [Ta phục vụ Tổ quốc.] Ta phục vụ Tổ quốc. Thế là đủ rồi. #moral:order:+2 #moral:idealism:+1  
~ order += 2  
~ idealism += 1  
Marx: “Tổ quốc” — từ ngữ đẹp đẽ nhất để che giấu lá cờ của kẻ sở hữu.  
Chúng vẽ ranh giới quanh máu ngươi và gọi đó là lòng yêu nước. #speaker:marx  
-> marx_reflection

=== marx_reflection ===
Marx bước đi, tiếng giày dội trên nền bê tông.  
Mỗi bước chân như nhịp búa của nhà máy vẫn đang nghiền nát kẻ nghèo thành bụi.  
Ông dừng lại, nhìn xuống sàn như thấy hồn ma trong những vết dầu loang. #speaker:marx
Marx: Ta từng mơ về một thế giới nơi lao động giải phóng con người — nơi công việc xây nên phẩm giá, chứ không phải nợ nần.  
Nhưng rồi lao động lại trở thành xiềng xích.  
Người công nhân bán từng giờ, từng phần thân thể, từng khoảng im lặng… cho đến khi không còn gì để bán ngoài ký ức về chính mình.  
Ngươi đã thấy giấc mơ ấy chết chưa? #speaker:marx
* [Ta đã thấy tệ hơn.] Giấc mơ chết lặng lẽ. Con người chết ầm ỹ. #moral:pessimism:+2 #moral:chaos:+1  
~ pessimism += 2  
~ chaos += 1  
Marx: Và thế giới vỗ tay cho cả hai.  
Thị trường gọi đó là hiệu suất. Nhà thờ gọi đó là hiến tế.  
Còn ta gọi đó là ăn cắp — ở quy mô thần thánh. #speaker:marx  
-> marx_tyranny
* [Công việc từng cho ta mục đích.] Cho đến khi ta ngừng tin vào nó. #moral:idealism:+1 #moral:pessimism:+1  
~ idealism += 1  
~ pessimism += 1  
Marx: “Mục đích” là món hàng đầu tiên họ bán cho ngươi — và là thứ cuối cùng họ tước đi.  
Khi mục đích sụp đổ, ngươi thấy bánh răng đang quay. Và nhận ra: chẳng ai lái cả. #speaker:marx  
-> marx_tyranny
* [Không ai xứng đáng tự do.] Ai cũng phục vụ một thứ gì đó. #moral:pessimism:+2 #moral:order:+1  
~ pessimism += 2  
~ order += 1  
Marx: Một sự thật cay đắng, nhưng chỉ đúng một nửa.  
Nửa còn lại là thế này: sự phục vụ chỉ trở thành nô lệ khi kẻ chủ nói dối về thần tính của hắn. #speaker:marx  
-> marx_tyranny
* [Chẳng liên quan gì đến ta.] Thế giới đã hỏng. Ta không sửa nó đâu. #moral:chaos:+2 #moral:materialism:+1  
~ chaos += 2  
~ materialism += 1  
Marx: Giai cấp tư sản cảm ơn ngươi vì sự buông xuôi ấy.  
Mỗi người ngừng chiến đấu là thêm một viên gạch trong pháo đài của chúng. #speaker:marx  
-> marx_tyranny

=== marx_tyranny ===
Giọng Marx thay đổi — không lớn hơn, mà nặng hơn, mỗi từ rơi xuống như một bản án.  
Ông chỉ tay về phía cỗ máy vô hình.  
Tiếng rung của nó vang to hơn, như tiếng hô của một đám đông dưới búa sắt. #speaker:marx
Marx: Họ gọi đó là “tiến bộ”.  
Nhưng mọi đế chế, mọi nền cộng hòa, mọi “trật tự” — đều là cùng một lò luyện.  
Kẻ nghèo cháy, kẻ giàu sưởi ấm bàn tay, và tro tàn được gọi là lịch sử.  
Ngươi biết điều khiến ta sợ nhất không, người lính?  
Một ngày nào đó, ngay cả tro tàn cũng quên rằng chúng từng là con người. #speaker:marx
* [Vậy hãy đốt sạch tất cả.] Có lẽ ta nên bắt đầu lại từ số không. #moral:chaos:+2 #moral:pessimism:+1  
~ chaos += 2  
~ pessimism += 1  
Marx: Ngươi nghĩ ngọn lửa cứu rỗi được tàn tro. Sai rồi.  
Lửa chẳng phục vụ ý thức hệ nào. Cỗ máy sẽ tự tái sinh từ chính cuộc nổi loạn của ngươi. #speaker:marx  
-> marx_final
* [Phải có con đường tốt hơn.] Một thứ vượt khỏi máu và lao động. #moral:idealism:+2 #moral:order:+1  
~ idealism += 2  
~ order += 1  
Marx: Có thể từng tồn tại.  
Nhưng mọi ý tưởng cao quý đều trở thành khẩu hiệu nhà máy khi nó bắt đầu có giá. #speaker:marx  
-> marx_final
* [Cỗ máy không thể dừng.] Vậy sao phải cố? #moral:pessimism:+2 #moral:order:+1  
~ pessimism += 2  
~ order += 1  
Marx: Thế là ngươi đã chấp nhận nô lệ như một dạng tỉnh táo.  
Lịch sử yêu những kẻ như ngươi — những người khiến xiềng xích trở nên vô hình. #speaker:marx  
-> marx_final
* [Hãy để kẻ giàu thối rữa cùng kẻ nghèo.] Bình đẳng trong đổ nát. #moral:chaos:+1 #moral:pessimism:+1  
~ chaos += 1  
~ pessimism += 1  
Marx: Ngươi nhầm lẫn giữa hủy diệt và công lý.  
Nghĩa trang thì bình đẳng, đúng vậy — nhưng nó cũng im lặng. #speaker:marx  
-> marx_final

=== marx_final ===
Tiếng máy lắng xuống. Sự im lặng nuốt chửng căn phòng như một bản án.  
Marx đứng yên — lần đầu tiên, ông nhìn thẳng vào ngươi. Ánh mắt không giận dữ, mà thất vọng.  
Nỗi thất vọng dành cho cả giống loài. #speaker:marx
Marx: Ta đã trao cho thế giới một lời tiên tri.  
Chúng biến nó thành cẩm nang quyền lực.  
Ngay cả cách mạng cũng trở thành món hàng.  
Ông bước đến gần, giọng nói như sắt kéo lê trên kính.  
Marx: Ngươi tưởng nỗi đau của mình là duy nhất.  
Không đâu.  
Nó là triệu chứng của một cấu trúc ăn sạch mọi thứ — kể cả những kẻ chống lại nó.  
Và ngươi, hỡi người thợ của cái chết, chỉ là một bánh răng đang hỏi tại sao bánh răng khác lại nghiền nát. #speaker:marx
* [Vậy thì ý nghĩa là gì?] Tại sao phải chiến đấu? #moral:pessimism:+2  
~ pessimism += 2  
Marx: Không có ý nghĩa nào cả. Chỉ có đấu tranh.  
Ý nghĩa là thứ được rèn ra, không phải được tìm thấy — và đa phần tan chảy trước khi kim loại kịp nguội. #speaker:marx  
-> marx_scene_end
* [Vậy ta vẫn sẽ chiến đấu.] Chỉ để khinh miệt cỗ máy. #moral:idealism:+2 #moral:chaos:+1  
~ idealism += 2  
~ chaos += 1  
Marx: Tốt. Sự khinh miệt cũng có nét thuần khiết riêng.  
Dù là kháng cự tuyệt vọng, nó vẫn nuôi dưỡng huyền thoại về tự do.  
Hãy để huyền thoại ấy sống lâu hơn chúng ta. #speaker:marx  
-> marx_scene_end
* [Vậy ta sẽ phục vụ nó.] Ít ra còn trung thực. #moral:materialism:+1 #moral:pessimism:+1  
~ materialism += 1  
~ pessimism += 1  
Marx: Mọi cỗ máy đều yêu kẻ thú nhận với nó.  
Nhưng thú nhận không phải là giải thoát — mà là đầu hàng. #speaker:marx  
-> marx_scene_end
* [Không ai sở hữu ta.] Ta từ chối mọi phe phái. #moral:chaos:+2 #moral:rationalism:+1  
~ chaos += 2  
~ rationalism += 1  
Marx: Thế là ngươi đã biến mình thành một nền kinh tế riêng — tự cung tự cấp, tự tiêu diệt.  
Tự do không có mục đích chỉ là hỗn loạn nằm trong quan tài. #speaker:marx  
-> marx_scene_end

=== marx_scene_end ===
Lò luyện rên rỉ. Tàn lửa rơi xuống như những vì sao hấp hối.  
Marx quay lưng lại, hai tay đan sau lưng. #speaker:marx
Marx: Lịch sử là sổ cái của đồ tể, viết bằng lửa.  
Con người sống, chịu đựng, và gọi đó là “tiến bộ”.  
Nếu cứu rỗi tồn tại, nó sẽ không rơi xuống từ trời.  
Nó sẽ bò ra từ đống tro tàn, mang tro trong phổi, và tự gọi mình là “thay đổi.” #speaker:marx
Ông dừng lại.  
Marx: Ngươi đã thấy điều tệ nhất của loài người.  
Giờ nói đi, người lính — ngươi sẽ nhập vào đống xác, hay thành ngọn lửa thiêu chúng? #speaker:marx
-> DONE
