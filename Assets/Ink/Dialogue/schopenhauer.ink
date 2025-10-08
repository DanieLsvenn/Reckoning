/*VAR idealism = 0
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
*/
VAR idealism = 0
VAR materialism = 0  
VAR rationalism = 0
VAR empiricism = 0
VAR order = 0
VAR chaos = 0
VAR pessimism = 0

-> schopenhauer_scene

=== schopenhauer_scene ===
Không khí lạnh ngắt.  
Ngọn nến đơn độc chống chọi với bóng tối, ngọn lửa run rẩy trong căn phòng tắt hơi.  
Bốn bề tường phủ đầy gương — nứt vỡ, vấy bẩn, mỗi tấm phản chiếu một phiên bản của ngươi trông chết dần từng phần.  
Schopenhauer ngồi sụp xuống sàn, lưng dựa tường, chiếc áo khoác phủ lên đầu gối.  
Ông không ngẩng mặt. Chỉ lên tiếng. #speaker:schopenhauer

Schopenhauer:  
Kể ta nghe điều gì đó, trước khi ánh sáng tắt hẳn.  
Ngươi vẫn nghĩ thế giới này tốt bụng chứ? #speaker:schopenhauer

* [Không.] Không còn nữa. #moral:pessimism:+2
  ~ pessimism += 2
  Schopenhauer:  
   Tốt. Ngươi đã ngừng giả vờ.  
   Thế giới chẳng quan tâm ngươi thở hay nghẹt — nó cứ quay mãi.  
   Đó là điều sinh linh làm: nuốt chửng. #speaker:schopenhauer
  -> schopenhauer_reflection

* [Có lẽ từng thế.] Khi ta nghĩ Thượng Đế đang ngắm nhìn. #moral:idealism:+1 #moral:pessimism:+1
  ~ idealism += 1
  ~ pessimism += 1
  Schopenhauer:  
   Thượng Đế chưa bao giờ ngắm nhìn. Chính ngươi mới là kẻ nhìn.  
   Ngươi tự tạo ra con mắt phán xét mình. Rồi cầu nguyện với nó. #speaker:schopenhauer
  -> schopenhauer_reflection

* [Vẫn còn.] Vẫn còn thứ gì đó tốt đẹp. #moral:idealism:+2
  ~ idealism += 2
  Schopenhauer:  
   Ngươi không sai. Chỉ là ngây thơ.  
   Ánh sáng ngươi thấy không phải hy vọng — mà là sự thối rữa cháy đủ chậm để trông đẹp. #speaker:schopenhauer
  -> schopenhauer_reflection

* [Tôi đã ngừng nghĩ về nó.] Tôi chỉ sống. Ăn. Uống. Ngủ. #moral:materialism:+1 #moral:pessimism:+1
  ~ materialism += 1
  ~ pessimism += 1
  Schopenhauer:  
   Vậy thì ngươi làm tốt hơn đa số.  
   Tư tưởng chính là vết thương. Loài thú may mắn — chúng chảy máu, nhưng chúng không _biết_ rằng mình đang chảy máu. #speaker:schopenhauer
  -> schopenhauer_reflection

=== schopenhauer_reflection ===
Những tấm gương rung lên nhẹ nhàng, như thủy tinh đang nhớ lại tiếng hét.  
Bóng ngươi mờ nhạt — vẫn là ngươi, nhưng trống rỗng, như có ai đó đã nạo sạch phần từng tin vào buổi bình minh.  
Giọng Schopenhauer theo sau, trầm và đều đặn. #speaker:schopenhauer

Schopenhauer:  
Cuộc sống không hỏi ý kiến. Nó chỉ lấy đi.  
Nó lấy đi cơn đói, tình yêu, đức tin của ngươi, rồi biến chúng thành những lý do để giữ ngươi xích tại đây.  
Ngươi không thể thắng. Ngươi chỉ có thể ngừng vùng vẫy đủ lâu để nhìn thấy cái lồng.  
Ngươi có từng tìm thấy bình yên giữa tất cả ồn ào ấy không? #speaker:schopenhauer

* [Có, một lúc.] Rồi nó trôi mất. #moral:pessimism:+2 #moral:materialism:+1
  ~ pessimism += 2
  ~ materialism += 1
  Schopenhauer:  
   Bình yên chỉ là thế — khoảng lặng trước khi con sóng tiếp theo ập đến.  
   Ngươi tưởng đó là bờ. Hóa ra chỉ là mắt bão. #speaker:schopenhauer
  -> schopenhauer_suffering

* [Không.] Chưa bao giờ. #moral:pessimism:+3
  ~ pessimism += 3
  Schopenhauer:  
   Tốt. Ít nhất ngươi thành thật.  
   Có người trải cả đời cố biến đau khổ thành thơ ca. Ngươi chỉ để nó thối rữa. #speaker:schopenhauer
  -> schopenhauer_suffering

* [Có lẽ cuộc sống chính là thế.] Chính là ồn ào ấy. #moral:chaos:+1 #moral:rationalism:+1
  ~ chaos += 1
  ~ rationalism += 1
  Schopenhauer:  
   Vậy thì đừng gọi nó là cuộc sống. Gọi đúng tên nó — cơn đói không biết mình muốn gì.  
   Mỗi nhịp tim chỉ là thân xác nài nỉ thứ gì đó mà nó không bao giờ có được. #speaker:schopenhauer
  -> schopenhauer_suffering

* [Có lần nó hiệu nghiệm.] Khi tôi yêu ai đó. #moral:idealism:+2 #moral:pessimism:+1
  ~ idealism += 2
  ~ pessimism += 1
  Schopenhauer:  
   Tình yêu.  
   Trò lừa bịp dài nhất mà Ý Chí từng thực hiện.  
   Nó bắt ngươi chảy máu cho người khác rồi gọi đó là đức hạnh. #speaker:schopenhauer
  -> schopenhauer_suffering

=== schopenhauer_suffering ===
Ngọn nến lắc lư. Bóng tối kéo dài trên các tấm gương cho đến khi bóng ngươi trông như đang chết đắm trong nước đen.  
Mắt Schopenhauer cuối cùng cũng ngẩng lên — xám xịt, trống rỗng, mệt mỏi đến mức chẳng còn sức ghét. #speaker:schopenhauer

Schopenhauer:  
Ngươi nghĩ mình đau khổ hơn người khác. Không phải đâu.  
Ngươi chỉ nhận ra nó nhiều hơn.  
Đó là lời nguyền của việc tỉnh thức — mỗi tiếng hét, mỗi vết thương trên đời đều trở thành một tấm gương.  
Ngươi vác chúng đi cho đến khi quên mất cái nào là của mình. #speaker:schopenhauer

* [Vậy thì bình yên chính là cái chết.] Tại sao không kết thúc ngay bây giờ? #moral:pessimism:+3
  ~ pessimism += 3
  Schopenhauer:  
   Cái chết không giải quyết gì. Ý Chí chẳng quan tâm ngươi chết — nó chỉ bắt đầu lại với ai đó mới thôi.  
   Nó sẽ dựng lên một tên ngốc khác và giao cho hắn cơn đói của ngươi. #speaker:schopenhauer
  -> schopenhauer_final

* [Vậy tôi sẽ sống mà không cần bình yên.] Tôi sẽ ngừng đòi hỏi thêm. #moral:order:+1 #moral:rationalism:+1
  ~ order += 1
  ~ rationalism += 1
  Schopenhauer:  
   Có lẽ đó là thứ gần nhất với trí tuệ — không phải vui sướng, không phải đức tin, chỉ là sự im lặng đến khi ngươi ngừng cầu xin điều tốt hơn. #speaker:schopenhauer
  -> schopenhauer_final

* [Vậy tôi sẽ giúp người khác.] Nếu tất cả đều đau, có lẽ chúng ta có thể làm nó dịu đi. #moral:idealism:+2 #moral:order:+1
  ~ idealism += 2
  ~ order += 1
  Schopenhauer:  
   Từ bi là cuộc nổi loạn duy nhất còn lại — lúc duy nhất Ý Chí im miệng.  
   Nhưng đừng tự lừa dối. Ngươi vẫn giúp người khác vì nó khiến _chính ngươi_ đau ít hơn. #speaker:schopenhauer
  -> schopenhauer_final

* [Vậy tôi sẽ tự tay giết nó.] Kết liễu mọi thứ tôi chạm vào. #moral:chaos:+2 #moral:pessimism:+1
  ~ chaos += 2
  ~ pessimism += 1
  Schopenhauer:  
   Ngươi không thể giết Ý Chí. Mỗi cái chết chỉ nuôi sống nó thêm.  
   Ngươi sẽ chỉ là thêm một đồ cúng — và nó sẽ cảm ơn bằng cách quên đi. #speaker:schopenhauer
  -> schopenhauer_final

=== schopenhauer_final ===
Ngọn nến cuối cùng tắt hẳn.  
Trong một giây, mọi thứ dừng lại — ngay cả nhịp tim ngươi cũng như đang nín thở.  
Schopenhauer cất tiếng từ bóng tối. Giọng ông nghe đủ gần để chạm tới. #speaker:schopenhauer

Schopenhauer:  
Ngươi muốn biết thế giới là gì?  
Nó là vết thương lành vừa đủ để rồi lại chảy máu.  
Chúng ta gọi đó là "hy vọng." #speaker:schopenhauer

Ông thở ra — không như tiếng thở dài, mà như từ bỏ việc thở.  
Schopenhauer:  
Nếu ngươi vẫn muốn sống, hãy sống lặng lẽ. Đừng mơ. Đừng với tới. Đừng làm ồn hơn mức cần thiết.  
Mỗi mong muốn là thêm một tiếng hét trong thế giới vốn đã điếc. #speaker:schopenhauer

* [Vậy tôi sẽ im lặng.] Tôi sẽ phai nhạt cùng phần còn lại. #moral:order:+2 #moral:pessimism:+1
  ~ order += 2
  ~ pessimism += 1
  Schopenhauer:  
   Vậy thì thế giới sẽ cảm ơn ngươi theo cách của nó — bằng cách quên ngươi hoàn toàn. #speaker:schopenhauer
  -> schopenhauer_scene_end

* [Không.] Tôi sẽ sống ầm ĩ. Dù nó có đau. #moral:chaos:+2 #moral:idealism:+1
  ~ chaos += 2
  ~ idealism += 1
  Schopenhauer:  
   Vậy thì hét lên. Để Ý Chí ca hát qua ngươi.  
   Kẻ dũng cảm chẳng thắng — họ chỉ cháy đẹp hơn thôi. #speaker:schopenhauer
  -> schopenhauer_scene_end

* [Tôi sẽ cố giúp đỡ.] Có lẽ như vậy là đủ. #moral:idealism:+2 #moral:order:+1
  ~ idealism += 2
  ~ order += 1
  Schopenhauer:  
   Có lẽ.  
   Nếu có bất kỳ sự cứu chuộc nào, nó nằm trong những lòng từ bi nhỏ bé mà chẳng ai chú ý. #speaker:schopenhauer
  -> schopenhauer_scene_end

* [Tôi sẽ ôm lấy nó.] Đau đớn là tất cả tôi còn lại. #moral:chaos:+1 #moral:rationalism:+1
  ~ chaos += 1
  ~ rationalism += 1
  Schopenhauer:  
   Vậy thì mặc nó như áo giáp. Chỉ cần nhớ — áo giáp gỉ từ bên trong. #speaker:schopenhauer
  -> schopenhauer_scene_end

=== schopenhauer_scene_end ===
Bóng tối dày đặc cho đến khi ngay cả bóng ngươi cũng biến mất.  
Đâu đó xa xa, một âm thanh — có lẽ là gió, có lẽ là hơi thở, có lẽ là thế giới vẫn đang quay.  
Giọng Schopenhauer trôi như khói. #speaker:schopenhauer

Schopenhauer:  
Thế giới không xấu xa. Nó chỉ đói.  
Nó ăn mọi thứ cố gắng có ý nghĩa.  
Nếu ngươi không thể ngăn nó — ít nhất đừng nuôi nó. #speaker:schopenhauer

-> DONE
