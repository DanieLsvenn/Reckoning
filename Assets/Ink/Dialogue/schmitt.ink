/*VAR idealism = 0
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
*/
VAR idealism = 0
VAR materialism = 0
VAR rationalism = 0
VAR empiricism = 0
VAR order = 0
VAR chaos = 0
VAR pessimism = 0

-> schmitt_scene

=== schmitt_scene ===

Căn phòng vừa là tòa án, vừa là lăng mộ: gỗ đen, một ngọn đèn thấp, chiếc bàn dài như thể nuốt chửng ánh sáng. Không khí chuyển động như tiếng thở dài từ mấy thế kỷ trước – chưa bao giờ ngừng lại. Carl Schmitt ngồi ở đầu bàn như vị quan tòa luôn háo hức với mỗi bản án. Gương mặt ông không mang ác ý – chỉ là sự quan tâm chính xác của kẻ đã lập danh mục mọi tội lỗi. Khi lời nói rơi xuống, đó là tơ lụa phủ lên thép.

#speaker:schmitt
Schmitt: Ngồi. Đừng vội. Lời thú tội thường vụng về; điều ta cần không phải tiếng ồn, mà là một cái tên sạch sẽ. Tên làm cho sự vật trở nên thật. Chúng khiến kẻ thù trở nên tất yếu. Chúng cắt đứt thế giới thành từng mảnh sự thật vừa ăn. Đúng không nào, ngài Marshall?

#speaker:schmitt

* [Tôi từ chối bị đặt tên.] Tôi không thuộc về bất kỳ hạng mục nào của ông.
    #moral:chaos:+1
    ~ chaos += 1
    Schmitt: Sự từ chối cũng là một câu trả lời – loại thảm hại nhất, bởi nó buộc ta phải đặt tên cho ngươi dù sao. Ngươi cầu xin sự vô danh; ta sẽ ban cho ngươi phân loại.
    #speaker:schmitt
    -> schmitt_reflection

* [Cứ làm đi.] Hãy đặt tên cho tôi. Tôi chịu được.
    #moral:order:+1
    ~ order += 1
    Schmitt: Dũng cảm, hay tuyệt vọng. Sẽ thấy thôi. Có phẩm giá khi được đặt tên – nếu ngươi chấp nhận hậu quả. Nhưng biết cho: tên không phải là lòng thương. Chúng là luật lệ đang chờ được thi hành.
    #speaker:schmitt
    -> schmitt_reflection

* [Không còn gì để xét xử.] Tôi đã rỗng từ lâu.
    #moral:pessimism:+2
    ~ pessimism += 2
    Schmitt: Tuyệt vời. Cái rỗng là mảnh đất màu mỡ nhất cho quyết định. Kẻ rỗng không phủ nhận được gì; hắn dễ dàng bị tuyên bố là kẻ thù, và bị xử lý một cách tiện lợi.
    #speaker:schmitt
    -> schmitt_reflection

* [Ông không phải là thượng đế.] Ông chỉ là kẻ cầm sổ sách.
    #moral:rationalism:+1
    ~ rationalism += 1
    Schmitt: Ta là người biết quyết định tạo ra điều gì. Thượng đế là tình cảm; ta là công cụ. Công cụ tạo ra kết quả. Kết quả không cần van xin.
    #speaker:schmitt
    -> schmitt_reflection

=== schmitt_reflection ===

Ông mở một cuốn sổ mỏng – không dày, chỉ là danh sách những từ đơn lẻ, khủng khiếp. Mỗi từ nằm trên trang giấy như một khúc xương. Ông lướt ngón tay qua một từ, mỉm cười như đang đọc thực đơn.

#speaker:schmitt
Schmitt: Ngươi trở về từ thế giới, mang theo tiếng ồn và máu. Ngươi muốn gọi đó bằng bất cứ thứ gì ngoài chiến tranh – gọi là đạo đức, gọi là nhiệm vụ. Ta gọi nó là dữ liệu thô. Chính trị từng là vậy: ai đó quyết định mạng sống của người này tiếp tục, và mạng sống của người kia có thể xin lỗi rồi xóa đi.

#speaker:schmitt

* [Vậy hãy đặt tên kẻ thù của tôi.] Nếu đặt tên là điểm mấu chốt, hãy nói ra.
    #moral:order:+1
    ~ order += 1
    Schmitt: Được thôi. Có những khuôn mẫu ở đây; chúng nhỏ bé và xấu xa. Kẻ thù của ngươi có phải là cái tôi đánh thức ngươi mỗi đêm? Thế giới trả công cho sự vâng lời của ngươi? Hay những thể chế khoác cái tàn nhẫn vào cờ hiệu?
    #speaker:schmitt
    -> schmitt_query

* [Đừng đặt tên nữa.] Ngôn từ đã phản bội tôi.
    #moral:pessimism:+2
    ~ pessimism += 2
    Schmitt: Ngôn từ và luật lệ chỉ phản bội kẻ không dám chọn. Nhưng sự thất bại cũng là một thứ lòng thương: nó lột bỏ màn giả tạo, để lại thứ nguyên sơ.
    #speaker:schmitt
    -> schmitt_query

* [Hãy đặt tên tất cả.] Cả thế giới đều có tội.
    #moral:chaos:+2
    #moral:materialism:+1
    ~ chaos += 2
    ~ materialism += 1
    Schmitt: Lên án toàn diện. Đam mê, thiếu chính xác. Một khởi điểm nguy hiểm – những kẻ đặt tên mọi thứ là kẻ thù sau này thường khắc tên lên xương.
    #speaker:schmitt
    -> schmitt_query

* [Hãy đặt tên tôi.] Nếu ông phải, hãy cầm lấy công cụ và vung xuống.
    #moral:order:+2
    #moral:pessimism:+1
    ~ order += 2
    ~ pessimism += 1
    Schmitt: Sự sẵn lòng đó thật thú vị. Thánh nhân tình nguyện; bạo chủ cũng tình nguyện. Khác biệt là cách họ ngủ.
    #speaker:schmitt
    -> schmitt_query

=== schmitt_query ===

Ngọn đèn lung lay. Bên ngoài, thứ gì đó giống như tiếng tụng niệm từ xa – hoặc có thể là gió – khâu sự im lặng thành nhịp tim. Ông nghiêng người về phía trước với sự lịch sự tàn nhẫn. Mỗi câu nói là một con dao nhỏ, lịch thiệp.

#speaker:schmitt
Schmitt: Trả lời thẳng. Ai là kẻ thù của ngươi? Chọn một từ nếu phải. Đây không phải tu từ học; đây là phép tính của hệ quả.

#speaker:schmitt

* [Chính tôi.]
    #moral:pessimism:+2
    #moral:order:+1
    ~ pessimism += 2
    ~ order += 1
    Schmitt: Tuyệt vời. Bản thân làm kẻ thù – loại thân mật nhất. Ngươi sẽ tự xét xử trong riêng tư và tự tuân theo trong công khai. Đó là chủ quyền không có khán giả. Là sự cai trị của một, và vương miện cô đơn nhất.
    #speaker:schmitt
    -> schmitt_consequence

* [Thế giới đã gửi tôi đi.] Thế giới đã gửi tôi đi.
    #moral:chaos:+1
    #moral:pessimism:+1
    ~ chaos += 1
    ~ pessimism += 1
    Schmitt: Vật tế thần gọn gàng. Thế giới là sự trừu tượng tiện lợi; nó khiến trả thù trở thành nghi lễ. Nhưng hãy cẩn thận: trả thù cần một bộ máy. Ai sẽ đưa nó cho ngươi?
    #speaker:schmitt
    -> schmitt_consequence

* [Những kẻ nắm quyền.]
    #moral:idealism:+1
    #moral:order:+1
    ~ idealism += 1
    ~ order += 1
    Schmitt: Vậy ngươi tìm cách thay một cái tên bằng một cái tên khác – để trèo lên nấc thang chỉ huy. Tham vọng mặc chung quần áo với thù hận.
    #speaker:schmitt
    -> schmitt_consequence

* [Không ai cả.]
    #moral:pessimism:+3
    ~ pessimism += 3
    Schmitt: Vậy ngươi chọn quên lãng làm chính sách. Đó là một lập trường chính trị, và kẻ chết nổi tiếng là công dân gọn gàng.
    #speaker:schmitt
    -> schmitt_consequence

=== schmitt_consequence ===

Ông gõ nhẹ vào cuốn sổ; âm thanh như răng nghiến. Không có lòng thương trong nhịp điệu – chỉ có sự chắc chắn thoải mái của kẻ biết quyết định buộc phải làm gì.

#speaker:schmitt
Schmitt: Lựa chọn sinh ra thể chế. Thể chế sinh ra kết quả. Kết quả nhuốm màu đôi tay. Nếu ngươi nói "chính tôi," ngươi mời gọi hình phạt, cải tạo, hoặc hành quyết – nhưng ngươi vẫn là chủ quyền của số phận mình. Nếu ngươi nói "chúng," ngươi huy động, ngươi bạo loạn, ngươi trở thành cái tên mà kẻ khác sẽ đọc và sợ hãi. Nếu ngươi nói "không ai," ngươi chọn bị xóa mờ.

#speaker:schmitt

* [Tôi sẽ tự xét xử.] Tôi sẽ trả lời cho nó.
    #moral:order:+2
    #moral:idealism:+1
    ~ order += 2
    ~ idealism += 1
    Schmitt: Cao thượng, và sạch sẽ. Tự xét xử là công lý chậm nhất – một luyện ngục ngươi phải điều hành hàng ngày. Một số tìm thấy bình yên trong việc ghi chép sổ sách như vậy; số khác bị nghiền nát dưới sức nặng.
    #speaker:schmitt
    -> schmitt_final

* [Tôi sẽ chiến đấu với chúng.] Tôi sẽ đặt tên kẻ thù và hành động.
    #moral:chaos:+2
    #moral:materialism:+1
    ~ chaos += 2
    ~ materialism += 1
    Schmitt: Vậy hãy chọn công cụ cẩn thận. Bạo lực tự tổ chức. Kẻ chính nghĩa thường trở thành quái vật hiệu quả nhất. Ngươi chấp nhận rủi ro đó chứ?
    #speaker:schmitt
    -> schmitt_final

* [Tôi sẽ xóa mình.] Tôi sẽ biến mất.
    #moral:pessimism:+3
    ~ pessimism += 3
    Schmitt: Tẩy xóa phổ biến trong giới kiệt sức. Nó gọn gàng, tàn nhẫn, và chung cuộc. Lịch sử không tôn trọng gì bằng khoảng trống nơi một con người từng tồn tại.
    #speaker:schmitt
    -> schmitt_final

* [Tôi sẽ chỉ đặt tên vài kẻ đồi bại.] Công lý có chọn lọc.
    #moral:order:+1
    #moral:idealism:+1
    ~ order += 1
    ~ idealism += 1
    Schmitt: Chính xác. Nguy hiểm, chính nghĩa, và hiếm hơn ngươi tưởng. Mục tiêu phải được xác định, nhân chứng được thu thập, kiên nhẫn được áp dụng. Đó là sự trả thù của quan liêu – chậm, hợp pháp, bền bỉ.
    #speaker:schmitt
    -> schmitt_final

=== schmitt_final ===

Ông đóng cuốn sổ mỏng lại với động tác nhẹ nhàng, thỏa mãn. Căn phòng lạnh hơn, như thể quyết định của ông hút nhiệt khỏi không khí.

#speaker:schmitt
Schmitt: Nghe ta và đừng nhầm lẫn sự dịu dàng với lòng thương. Ta là người dạy rằng kẻ thù không phải ẩn dụ – chúng là danh từ. Một khi ngươi đặt tên chúng, mọi thứ theo sau: luật pháp, bạo lực, ký ức, quên lãng. Chuỗi dây đó dài và tinh tế. Nó phá vỡ mọi thứ một cách tuyệt đẹp.

#speaker:schmitt

Ông mỉm cười, nụ cười nhỏ và sắc bén như dao mổ. Ánh đèn tạo nên khuôn mặt ông như phù điêu xương.

#speaker:schmitt
Schmitt: Nếu ngươi tuyên bố bản thân là kẻ thù, ngươi sẽ trở thành đền thờ kỷ luật hoặc liệt sĩ của sự điên loạn. Nếu ngươi tuyên bố thế giới, ngươi sẽ thấy bộ máy quyền lực đói khát và khôn ngoan. Nếu ngươi tuyên bố kẻ quyền thế, ngươi phải trở thành tấm gương của chúng – và gương luôn nói dối. Nếu ngươi tuyên bố không ai, ngươi sẽ bị xóa, và cuốn sổ sẽ thở phào nhẹ nhõm khi không có ngươi.

#speaker:schmitt

* [Vậy hãy biến tôi thành quan tòa.] Tôi sẽ nhận lấy cái tên và sức nặng của nó.
    #moral:order:+2
    #moral:chaos:+1
    ~ order += 2
    ~ chaos += 1
    Schmitt: Được thôi. Cầm lấy công cụ. Cai trị. Sự bình yên ngươi khao khát sẽ được mua bằng những quyết định để lại vết nhơ. Ngươi sẽ là chủ quyền – và có lẽ, đến cuối cùng, là quái vật.
    #speaker:schmitt
    -> schmitt_scene_end

* [Vậy hãy để tôi chết không dấu vết.] Xóa tôi khỏi câu chuyện.
    #moral:pessimism:+3
    ~ pessimism += 3
    Schmitt: Một thứ hèn nhát duyên dáng. Cách yên lặng nhất để tránh trách nhiệm là biến mất. Thế giới sẽ nhún vai và tiếp tục.
    #speaker:schmitt
    -> schmitt_scene_end

* [Vậy hãy để tôi thử sửa chữa.] Tôi sẽ đặt tên vài kẻ đồi bại và tái thiết.
    #moral:idealism:+2
    #moral:order:+1
    ~ idealism += 2
    ~ order += 1
    Schmitt: Vậy hãy học kiên nhẫn. Cách mạng được khởi đầu bởi cơn thịnh nộ và hoàn tất bởi thư ký. Nếu ngươi muốn sửa chữa, hãy chuẩn bị bị làm cho nhỏ bé bởi chính những hệ thống ngươi mơ ước thay đổi.
    #speaker:schmitt
    -> schmitt_scene_end

* [Tôi sẽ thiêu rụi tất cả.] Tất cả.
    #moral:chaos:+3
    #moral:materialism:+1
    ~ chaos += 3
    ~ materialism += 1
    Schmitt: Chân thành tàn bạo. Những đại hỏa hoạn rất ngoạn mục để xem. Nhưng chúng cũng bất thành. Ngươi sẽ không sống để thấy điều gì mọc lên sau ngọn lửa.
    #speaker:schmitt
    -> schmitt_scene_end

=== schmitt_scene_end ===

Ông đứng dậy, động tác tiết kiệm và chung cuộc. Giọng nói của ông là ký ức của một bản án.

#speaker:schmitt
Schmitt: Hãy quyết định, vậy. Mọi luật lệ bắt đầu bằng một định nghĩa. Mọi hỗn loạn bắt đầu bằng một lời hứa. Ngươi đã được ban cho một từ. Nói nó thành tiếng, và xem thế giới sẽ làm gì để đáp lại.

#speaker:schmitt

Ông nghiêng người về phía trước. Trong một khoảnh khắc, khuôn mặt ông là lưỡi dao dưới ánh nến. Điều cuối cùng ông nói không phải lời khuyên; đó là mệnh lệnh có vị như tro tàn.

#speaker:schmitt
Schmitt: Hãy đặt tên kẻ thù của ngươi – và kiếm lấy quyền của ngươi.

#speaker:schmitt

-> DONE
