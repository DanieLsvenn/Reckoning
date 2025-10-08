/*VAR idealism = 0
VAR materialism = 0  
VAR rationalism = 0
VAR empiricism = 0
VAR order = 0
VAR chaos = 0
VAR pessimism = 0

-> aristotle_scene

=== aristotle_scene ===
A narrow stoa at dusk. The columns throw long, accusing shadows across the stone. The air smells faintly of oil and dust — old virtues kept like moth-eaten cloaks. Aristotle stands with one hand behind his back, watching you as if you were an experiment gone slightly wrong. #speaker:aristotle

Aristotle: Walk with me, if you must. Philosophy is not a pleasant bath — it is a scalpel. Tell me, in blunt terms: what do you call a life worth living? Do not dress your answer in pious comforts. #speaker:aristotle

* [A life of pleasure — stop the pain] I want comfort. Pleasure quiets the noise; it is the most honest relief I can find. #moral:materialism:+2 #moral:chaos:+1
  ~ materialism += 2
  ~ chaos += 1
  Aristotle: Pleasure is an easy priest to serve. It flatters and then eats you. Men mistake relief for flourishing and call it philosophy. #speaker:aristotle

  * * [Pleasure at least tells the truth] At least pleasure is honest. It tells me what I want. #moral:materialism:+1 #moral:pessimism:+1
      ~ materialism += 1
      ~ pessimism += 1
      Aristotle: Honesty of appetite is not the same as excellence. The appetite tells you what you are prone to — not what you ought to be. #speaker:aristotle #sticker:golden_mean
      -> peripatetic_virtue

  * * [Pleasure is empty] It leaves me hollow. Pleasure is only a brief anesthetic. #moral:idealism:+1 #moral:pessimism:+1
      ~ idealism += 1
      ~ pessimism += 1
      Aristotle: Then you sense rightly; pleasure can be a poor tutor. Seek ends that last longer than the next swallow. #speaker:aristotle
      -> peripatetic_virtue

* [Duty, order, ritual — structure matters] Rules, rituals, duty — these bind a life into shape. I want that shape. #moral:order:+2 #moral:idealism:+1
  ~ order += 2
  ~ idealism += 1
  Aristotle: Good — at least you prefer a garment to rags. Yet structure without discernment becomes a cage. Men worship the rope that binds them and call it salvation. #speaker:aristotle

  * * [Structure steadies me] I need rules; without them I unravel. #moral:order:+1 #moral:rationalism:+1
      ~ order += 1
      ~ rationalism += 1
      Aristotle: Stability is cheap unless it is earned by right practice. Do not confuse obedience with wisdom. #speaker:aristotle #sticker:phronesis
      -> peripatetic_virtue
  * * [Rules feel hollow — they failed me] Rules failed when I tested them; they hide rot beneath a varnish. #moral:pessimism:+2 #moral:materialism:+1
      ~ pessimism += 2
      ~ materialism += 1
      Aristotle: Then examine the rule — is the rule itself corrupt, or the hands that wield it? Either way, virtue cannot thrive on a lie. #speaker:aristotle
      -> peripatetic_virtue

* [Fulfillment — excellence and purpose] Flourishing means realizing what I can be. Call it excellence, call it function fulfilled. #moral:idealism:+2 #moral:rationalism:+1
  ~ idealism += 2
  ~ rationalism += 1
  Aristotle: Eudaimonia — a word people tuck into prayers like talismans. It is not a feeling; it is activity according to excellence. Do you expect a feast or the slow craft of a life? #speaker:aristotle #sticker:eudaimonia

  * * [How do I find excellence?] My habits are ruined. Where does one start? #moral:pessimism:+1 #moral:order:+1
      ~ pessimism += 1
      ~ order += 1
      Aristotle: Begin with the smallest acts. Virtue is habit hammered into habit. The great oak begins as a stubborn shoot. #speaker:aristotle
      -> peripatetic_virtue
  * * [I tried — it failed me] Attempts at betterment turned to ash. I cannot trust them. #moral:pessimism:+2 #moral:materialism:+1
      ~ pessimism += 2
      ~ materialism += 1
      Aristotle: Failure is a tutor whose lessons are harsh. Few learn because few endure the correction. Endure, or remain a catalogue of missteps. #speaker:aristotle
      -> peripatetic_virtue

* [Numbness — I avoid feeling] I shut the world out. Numbness keeps pain hushed. #moral:pessimism:+2 #moral:materialism:+1
  ~ pessimism += 2
  ~ materialism += 1
  Aristotle: Numbness is the grave's apprentice. It denies the soul's faculty to judge and so kills the possibility of repair. We do not need less feeling; we need better-ordered feeling. #speaker:aristotle
  * * [Feeling breaks me] Feeling breaks me because it opens wounds that never close. #moral:pessimism:+2 #moral:materialism:+1
      ~ pessimism += 2
      ~ materialism += 1
      Aristotle: Then you have chosen the coward's economy: pay nothing now and owe infinitely later. Courage is not absence of fear; it is action despite it. #speaker:aristotle
      -> peripatetic_virtue
  * * [I will relearn to feel rightly] I will relearn to feel in measured ways. #moral:idealism:+1 #moral:rationalism:+1
      ~ idealism += 1
      ~ rationalism += 1
      Aristotle: Good. Feeling that answers reason becomes judgment; feeling that runs rampant becomes ruin. #speaker:aristotle
      -> peripatetic_virtue

=== peripatetic_virtue ===
You walk between columns; the light narrows. Aristotle’s voice drops, sharpened by impatience. #speaker:aristotle
Aristotle: Virtue is a habit — not a vow one utters once and keeps like a charm. Tell me: which vice haunts you most when you awake? #speaker:aristotle

* [I live at extremes — everything all or nothing] I swing to extremes; I am either all in or broken. #moral:chaos:+2 #moral:materialism:+1
  ~ chaos += 2
  ~ materialism += 1
  Aristotle: Extremes are for fools and tyrants. Extremity lacks the contour of judgment; it is the act of someone who has abandoned the faculty to measure. Temper your force with thought. #speaker:aristotle

  * * [Moderation feels weak] Moderation looks like surrender. #moral:pessimism:+1 #moral:order:+1
      ~ pessimism += 1
      ~ order += 1
      Aristotle: Weakness is not the mean; it is the absence of the courage required to act rightly. Strength married to prudence is the true victory. #speaker:aristotle
      -> civic_friendship
  * * [Teach me the mean] Show me where the mean lies. #moral:idealism:+1 #moral:rationalism:+1
      ~ idealism += 1
      ~ rationalism += 1
      Aristotle: Observe, practice, correct. Find mentors who scorn vanity and reward patience. #speaker:aristotle
      -> civic_friendship

* [I numb — I avoid everything] I hide in emptiness until the world cannot reach me. #moral:pessimism:+2 #moral:materialism:+1
  ~ pessimism += 2
  ~ materialism += 1
  Aristotle: That is not cleverness; it is an abdication. The mean requires engagement. Numbness is the opposite of civic courage. #speaker:aristotle
  * * [But engagement kills me] Engagement opens old wounds; I cannot risk it. #moral:pessimism:+2 #moral:materialism:+1
      ~ pessimism += 2
      ~ materialism += 1
      Aristotle: Pain is not the only teacher; it is merely the most insistent. Begin with small, safe obligations — a neighbor, a promise kept. Build back your measure. #speaker:aristotle
      -> civic_friendship
  * * [I will practice engagement] I will try small duties and see if the muscles return. #moral:order:+1 #moral:idealism:+1
      ~ order += 1
      ~ idealism += 1
      Aristotle: Then begin. Habit polishes what raw will cannot. #speaker:aristotle
      -> civic_friendship

=== civic_friendship ===
He stops and fixes you with a look that has no tenderness left. #speaker:aristotle
Aristotle: Friendship is a mirror. Some mirrors beautify; others lie. Tell me — what do you seek in companions? #speaker:aristotle

* [Companions who make me forget] I want people who dull the edges — laughter, forgetting. #moral:materialism:+1 #moral:chaos:+1
  ~ materialism += 1
  ~ chaos += 1
  Aristotle: Those are friendships of pleasure: temporary and shallow. They go when the pleasure fades, dragging you with them. #speaker:aristotle

  * * [But they keep me from falling apart] They keep the nights less sharp. #moral:pessimism:+1 #moral:materialism:+1
      ~ pessimism += 1
      ~ materialism += 1
      Aristotle: A brief salve may be useful, but if you live only for salves, you will never build a life. Seek companions who correct you, not merely amuse you. #speaker:aristotle
      -> civic_polis
  * * [I want something deeper] I want anchors — people who hold me to better actions. #moral:idealism:+1 #moral:order:+1
      ~ idealism += 1
      ~ order += 1
      Aristotle: Then be such a friend yourself. Friends of virtue require reciprocity; you must give what you hope to receive. #speaker:aristotle
      -> civic_polis

* [Friends who sharpen me — make me fierce] I want comrades who do not coddle me. #moral:chaos:+1 #moral:order:+1
  ~ chaos += 1
  ~ order += 1
  Aristotle: Courage is valuable — when guided. Bravado without judgment leads to cruelty. Test your comrades: do they admire your virtue or your violence? #speaker:aristotle
  * * [I only know bravado] Bravado was all I learned; it was survival. #moral:pessimism:+1 #moral:materialism:+1
      ~ pessimism += 1
      ~ materialism += 1
      Aristotle: Survival habits may be necessary, but they are not sufficient for a life of excellence. Rework the habits into something honorable. #speaker:aristotle
      -> civic_polis
  * * [I will seek true courage] Then seek comrades who practice courage with wisdom. #moral:idealism:+1 #moral:rationalism:+1
      ~ idealism += 1
      ~ rationalism += 1
      Aristotle: Such friendships are rare; they demand that you first become rare yourself. #speaker:aristotle
      -> civic_polis

=== civic_polis ===
Distantly, a city murmurs — markets and courts and the low machinery of human life. Aristotle's voice turns colder. #speaker:aristotle
Aristotle: The city shapes character. Men are political animals; we find completion in the polis. Tell me plainly: do you belong to a city, or do you drift like cast-off cargo? #speaker:aristotle

* [I am separate — an outsider] I no longer fit in any city. I am adrift. #moral:pessimism:+1 #moral:materialism:+1
  ~ pessimism += 1
  ~ materialism += 1
  Aristotle: Isolation is a slow rot. Civilization requires work and risk; withdrawal buys a private comfort that often ends in private ruin. #speaker:aristotle

  * * [I doubt I can rejoin] I lack the strength to return. #moral:pessimism:+2
      ~ pessimism += 2
      Aristotle: Strength is built, not summoned. Begin with promises you can keep and obligations you can fulfill. Grow the strength by practising it. #speaker:aristotle
      -> aristotle_scene_end
  * * [Maybe I can serve] Perhaps service will anchor me. #moral:idealism:+1 #moral:order:+1
      ~ idealism += 1
      ~ order += 1
      Aristotle: Then serve well and humbly. Great repair is the slow work of many small, honest acts. #speaker:aristotle
      -> aristotle_scene_end

* [The city is rotten] Institutions are corrupt — the city is a carcass. #moral:pessimism:+2 #moral:chaos:+1
  ~ pessimism += 2
  ~ chaos += 1
  Aristotle: Cynicism is fashionable, but it is also convenient. Rot exists; so does repair. If you choose only to denounce, you will become a professional malcontent. #speaker:aristotle

  * * [Rebuilding seems impossible] Rebuilding feels absurd when the rot runs deep. #moral:pessimism:+2 #moral:materialism:+1
      ~ pessimism += 2
      ~ materialism += 1
      Aristotle: Then you are resigned — a spectator of your own decay. Even resignation is a choice; at least choose with full awareness. #speaker:aristotle
      -> aristotle_scene_end

  * * [I might plant a seed] If one seed can grow, perhaps I can try. #moral:order:+1 #moral:idealism:+1
      ~ order += 1
      ~ idealism += 1
      Aristotle: A single wise act can begin the long unravelling of corruption. Plant the seed where it can take root; do not scatter it to the wind. #speaker:aristotle

      -> aristotle_scene_end

      Aristotle drops his gaze to the pavement as if disappointed by the slowness of human repair, then looks back at you with an expression that can be read either as hope or pure calculation. #speaker:aristotle

      Aristotle: Practice. Habit. Courage married to judgment. If you disdain these, you will be remembered as a storm — loud, destructive, forgotten. If you take them, you will be slow and small — and possibly, in time, human again. #speaker:aristotle

=== aristotle_scene_end ===
-> DONE
*/

VAR idealism = 0
VAR materialism = 0  
VAR rationalism = 0
VAR empiricism = 0
VAR order = 0
VAR chaos = 0
VAR pessimism = 0

-> aristotle_scene

=== aristotle_scene ===
Một hành lang hẹp nơi hoàng hôn. Những cột đá dài, như những lời buộc tội trải khắp nền gạch. Không khí phảng phất mùi dầu và bụi — những đức hạnh cũ kỹ được giữ lại như chiếc áo choàng đầy lỗ. 
Aristotle đứng đó, một tay giấu sau lưng, nhìn bạn như thể bạn là một thí nghiệm vừa sai lệch.

Aristotle: Hãy đi cùng ta, nếu ngươi muốn. Triết học không phải một bồn tắm dễ chịu — nó như một con dao mổ. #speaker:aristotle
Aristotle: Hãy nói thẳng:x Với ngươi, thế nào là một đời sống đáng sống? Đừng che đậy câu trả lời bằng những lời đạo đức rỗng tuếch. #speaker:aristotle

* [Một đời thoải mái, thoát khỏi đau đớn.] Ta muốn sự thoải mái. Nó làm dịu tiếng ồn; đó là sự nhẹ nhõm len lỏi mà ta có thể tìm được. #moral:materialism:+2 #moral:chaos:+1
  ~ materialism += 2
  ~ chaos += 1
  Aristotle: Khoái lạc là bậc thầy của sự nịnh bợ. Nó làm ngươi mất cảnh giác rồi nuốt chửng ngươi. #speaker:aristotle
  
  Aristotle: Con người hay nhầm lẫn sự nhẹ nhõm với thịnh vượn, rồi gọi đó là triết học.  #speaker:aristotle

  * * [Sự thoải mái giúp tôi thành thật.] Ít nhất thì khoái lạc thành thật. Nó cho ta biết ta muốn gì. #moral:materialism:+1 #moral:pessimism:+1
      ~ materialism += 1
      ~ pessimism += 1
      Aristotle: Sự thành thật của ham muốn không đồng nghĩa với sự ưu tú. Ham muốn chỉ cho ngươi thấy ngươi muốn làm gì — không phải ngươi nên làm gì. #speaker:aristotle #sticker:golden_mean
      -> peripatetic_virtue

  * * [Nó thật là trống rỗng.] Khoái lạc để lại sự rỗng tuếch. Nó chỉ là một liều thuốc tê ngắn ngủi. #moral:idealism:+1 #moral:pessimism:+1
      ~ idealism += 1
      ~ pessimism += 1
      Aristotle: Vậy là ngươi đã cảm nhận đúng; khoái lạc chỉ là nhất thời. Hãy tìm những kim chỉ nam lâu dài mà hướng tới. #speaker:aristotle
      -> peripatetic_virtue

* [Bổn phận, trật tự, nghi lễ.] Bổn phận, trật tự và nghi lễ — chúng tạo nên hình dạng cho cuộc đời. Tôi muốn đạt được hình dạng đó. #moral:order:+2 #moral:idealism:+1
  ~ order += 2
  ~ idealism += 1
  Aristotle: Tốt — ít ra ngươi thích một tấm áo hơn là giẻ rách. Nhưng hình dạng không phân định sẽ trở thành cái lồng. Con người ta thích tôn thờ sợi dây trói mình và tự nhận đó là sự cứu rỗi. #speaker:aristotle

  * * [Cấu trúc giữ ta vững.] Ta cần luật lệ để tồn tại; nếu không, ta không thể làm gì. #moral:order:+1 #moral:rationalism:+1
      ~ order += 1
      ~ rationalism += 1
      Aristotle: Sự ổn định thật là dễ vỡ nếu nó không được rèn bởi hành động đúng đắn. Đừng lẫn lộn giữa vâng lời và trí tuệ. #speaker:aristotle #sticker:phronesis
      -> peripatetic_virtue

  * * [Luật lệ thật trống rỗng.] Ta đã thất bại khi đặt niềm tin vào luật lệ; chúng che giấu sự mục ruỗng sâu thẳm ở bên trong. #moral:pessimism:+2 #moral:materialism:+1
      ~ pessimism += 2
      ~ materialism += 1
      Aristotle: Vậy hãy xét lại luật lệ — bản thân nó đã thối nát, hay là bàn tay kẻ áp dụng? Dù thế nào, đức hạnh cũng không thể sống trên một lời dối trá. #speaker:aristotle
      -> peripatetic_virtue

* [Sự viên mãn — ưu tú và mục đích] Hưng thịnh nghĩa là thực hiện trọn vẹn điều ta có thể trở thành. Gọi nó là sự ưu tú, gọi nó là hoàn thành chức năng. #moral:idealism:+2 #moral:rationalism:+1
  ~ idealism += 2
  ~ rationalism += 1
  Aristotle: Eudaimonia — một từ mà người ta nhét vào những lời cầu nguyện như bùa hộ mệnh. Nó không phải cảm giác; nó là hoạt động theo đúng ưu tú. Ngươi chờ một bữa tiệc, hay công trình chậm rãi của cả đời? #speaker:aristotle #sticker:eudaimonia

  * * [Ta tìm ưu tú ở đâu?] Thói quen của ta đã hỏng. Phải bắt đầu từ đâu? #moral:pessimism:+1 #moral:order:+1
      ~ pessimism += 1
      ~ order += 1
      Aristotle: Hãy bắt đầu từ những hành động nhỏ nhất. Đức hạnh là thói quen được rèn dũa qua thói quen. Cây sồi vĩ đại khởi đầu từ mầm non cứng cỏi. #speaker:aristotle
      -> peripatetic_virtue

  * * [Ta đã thử — và thất bại] Những nỗ lực cải thiện chỉ thành tro tàn. Ta không thể tin vào chúng. #moral:pessimism:+2 #moral:materialism:+1
      ~ pessimism += 2
      ~ materialism += 1
      Aristotle: Thất bại là một người thầy nghiêm khắc. Ít ai học được vì ít ai chịu nổi sự sửa chữa. Hãy chịu đựng, hoặc ở mãi trong cuốn sổ ghi sai lầm. #speaker:aristotle
      -> peripatetic_virtue

* [Sự tê liệt — ta né tránh cảm xúc] Ta chặn thế giới ra ngoài. Sự tê liệt giữ cho nỗi đau im lặng. #moral:pessimism:+2 #moral:materialism:+1
  ~ pessimism += 2
  ~ materialism += 1
  Aristotle: Tê liệt là người học việc của nấm mồ. Nó phủ nhận khả năng phán đoán của linh hồn và vì thế giết đi hy vọng phục hồi. Ta không cần ít cảm xúc hơn; ta cần cảm xúc được sắp xếp đúng trật tự. #speaker:aristotle

  * * [Cảm xúc phá hủy ta] Cảm xúc phá hủy ta vì nó mở ra những vết thương chẳng bao giờ khép lại. #moral:pessimism:+2 #moral:materialism:+1
      ~ pessimism += 2
      ~ materialism += 1
      Aristotle: Vậy ngươi đã chọn nền kinh tế của kẻ hèn nhát: trả không gì lúc này và nợ vô hạn về sau. Can đảm không phải là không sợ; nó là hành động bất chấp sợ hãi. #speaker:aristotle
      -> peripatetic_virtue

  * * [Ta sẽ học lại cách cảm nhận đúng] Ta sẽ học lại cách cảm nhận theo chừng mực. #moral:idealism:+1 #moral:rationalism:+1
      ~ idealism += 1
      ~ rationalism += 1
      Aristotle: Tốt. Cảm xúc phục tùng lý trí trở thành phán đoán; cảm xúc phóng túng trở thành diệt vong. #speaker:aristotle
      -> peripatetic_virtue

=== peripatetic_virtue ===
Ngươi bước đi giữa những hàng cột; ánh sáng thu hẹp dần. Giọng Aristotle hạ thấp, sắc bén vì thiếu kiên nhẫn. #speaker:aristotle
Aristotle: Đức hạnh là thói quen — không phải một lời thề có thể thốt ra một lần rồi giữ như bùa chú. Hãy nói cho ta: tật xấu nào ám ảnh ngươi nhất mỗi khi ngươi thức dậy? #speaker:aristotle

* [Ta sống trong cực đoan — tất cả hoặc chẳng có gì] Ta luôn nghiêng về cực đoan; hoặc dốc toàn bộ, hoặc tan vỡ. #moral:chaos:+2 #moral:materialism:+1
  ~ chaos += 2
  ~ materialism += 1
  Aristotle: Cực đoan là trò của kẻ ngu và bạo chúa. Cực đoan thiếu hình dáng của phán đoán; nó là hành động của kẻ đã bỏ đi khả năng đo lường. Hãy tôi luyện sức mạnh bằng suy xét. #speaker:aristotle

  * * [Sự điều độ khiến ta thấy yếu đuối] Điều độ giống như đầu hàng. #moral:pessimism:+1 #moral:order:+1
      ~ pessimism += 1
      ~ order += 1
      Aristotle: Yếu đuối không phải là trung dung; nó là sự thiếu can đảm để hành động đúng. Sức mạnh kết hợp với sự thận trọng mới là chiến thắng thật sự. #speaker:aristotle
      -> civic_friendship

  * * [Hãy dạy ta trung dung] Hãy chỉ cho ta biết trung dung nằm ở đâu. #moral:idealism:+1 #moral:rationalism:+1
      ~ idealism += 1
      ~ rationalism += 1
      Aristotle: Quan sát, thực hành, sửa sai. Hãy tìm thầy dẫn đường, những người khinh thường phù hoa và tôn trọng sự kiên nhẫn. #speaker:aristotle
      -> civic_friendship

* [Ta tê liệt — ta né tránh tất cả] Ta trốn trong rỗng không để thế giới chẳng thể chạm tới. #moral:pessimism:+2 #moral:materialism:+1
  ~ pessimism += 2
  ~ materialism += 1
  Aristotle: Đó không phải sự khôn ngoan; đó là sự thoái lui. Trung dung đòi hỏi sự tham dự. Tê liệt chính là sự đối nghịch với dũng khí công dân. #speaker:aristotle

  * * [Nhưng tham dự giết chết ta] Tham dự khơi lại những vết thương cũ; ta không thể liều lĩnh. #moral:pessimism:+2 #moral:materialism:+1
      ~ pessimism += 2
      ~ materialism += 1
      Aristotle: Nỗi đau không phải là thầy duy nhất; nó chỉ là thầy khắt khe nhất. Hãy bắt đầu bằng những nghĩa vụ nhỏ, an toàn — một người hàng xóm, một lời hứa được giữ. Dần dần xây lại thước đo của ngươi. #speaker:aristotle
      -> civic_friendship

  * * [Ta sẽ tập lại sự tham dự] Ta sẽ thử những bổn phận nhỏ và xem liệu sức mạnh có trở lại. #moral:order:+1 #moral:idealism:+1
      ~ order += 1
      ~ idealism += 1
      Aristotle: Vậy thì hãy bắt đầu. Thói quen sẽ mài giũa nơi ý chí thô ráp bất lực. #speaker:aristotle
      -> civic_friendship


=== civic_friendship ===
Ngài dừng bước và nhìn chằm chằm vào ngươi bằng ánh mắt chẳng còn chút dịu dàng nào. #speaker:aristotle
Aristotle: Tình bạn là một tấm gương. Có gương làm đẹp; có gương lại dối trá. Hãy nói ta nghe — ngươi tìm gì ở bằng hữu? #speaker:aristotle

* [Những bạn bè giúp ta quên đi] Ta muốn những người làm mờ đi góc cạnh — tiếng cười, sự lãng quên. #moral:materialism:+1 #moral:chaos:+1
  ~ materialism += 1
  ~ chaos += 1
  Aristotle: Đó là tình bạn của khoái lạc: tạm bợ và nông cạn. Chúng tan biến khi khoái lạc tàn phai, kéo ngươi trôi theo chúng. #speaker:aristotle

  * * [Nhưng họ giữ ta khỏi tan vỡ] Họ khiến những đêm bớt nhọn nhói. #moral:pessimism:+1 #moral:materialism:+1
      ~ pessimism += 1
      ~ materialism += 1
      Aristotle: Một liều thuốc ngắn hạn có thể hữu ích, nhưng nếu ngươi sống chỉ để uống thuốc, ngươi sẽ chẳng bao giờ xây dựng được một đời sống. Hãy tìm bằng hữu biết sửa sai ngươi, không chỉ mua vui cho ngươi. #speaker:aristotle
      -> civic_polis

  * * [Ta muốn thứ gì sâu hơn] Ta muốn những neo bám — những người giữ ta hành động đúng hơn. #moral:idealism:+1 #moral:order:+1
      ~ idealism += 1
      ~ order += 1
      Aristotle: Vậy thì hãy trở thành người bạn như thế. Bằng hữu của đức hạnh đòi hỏi sự tương hỗ; ngươi phải cho đi điều ngươi mong nhận lại. #speaker:aristotle
      -> civic_polis

* [Những bạn bè làm ta sắc bén hơn — khiến ta dữ dội] Ta muốn đồng đội không nuông chiều ta. #moral:chaos:+1 #moral:order:+1
  ~ chaos += 1
  ~ order += 1
  Aristotle: Can đảm là quý giá — nhưng phải có dẫn dắt. Sự liều lĩnh không phán đoán sẽ hóa tàn nhẫn. Hãy thử xem đồng đội của ngươi ngưỡng mộ đức hạnh của ngươi, hay chỉ ngưỡng mộ bạo lực. #speaker:aristotle

  * * [Ta chỉ biết sự liều lĩnh] Liều lĩnh là tất cả những gì ta học được; đó là cách ta sống sót. #moral:pessimism:+1 #moral:materialism:+1
      ~ pessimism += 1
      ~ materialism += 1
      Aristotle: Thói quen sinh tồn có thể cần thiết, nhưng không đủ cho một đời sống ưu tú. Hãy rèn lại thói quen thành điều đáng tôn trọng. #speaker:aristotle
      -> civic_polis

  * * [Ta sẽ tìm kiếm dũng khí thật sự] Vậy hãy tìm đồng đội luyện tập dũng khí cùng trí tuệ. #moral:idealism:+1 #moral:rationalism:+1
      ~ idealism += 1
      ~ rationalism += 1
      Aristotle: Những tình bạn như thế hiếm lắm; chúng đòi hỏi trước tiên ngươi phải trở thành người hiếm có. #speaker:aristotle
      -> civic_polis


=== civic_polis ===
Từ xa, một thành phố thì thầm — chợ búa, pháp đình, và guồng máy thấp hèn của đời sống con người. Giọng Aristotle trở nên lạnh lùng. #speaker:aristotle
Aristotle: Thành phố định hình tính cách. Con người là động vật chính trị; ta chỉ trọn vẹn trong cộng đồng. Nói thẳng cho ta: ngươi thuộc về một thành phố, hay ngươi trôi nổi như món hàng vứt bỏ? #speaker:aristotle

* [Ta tách biệt — một kẻ ngoài cuộc] Ta chẳng còn thuộc về thành phố nào. Ta trôi dạt. #moral:pessimism:+1 #moral:materialism:+1
  ~ pessimism += 1
  ~ materialism += 1
  Aristotle: Cô lập là sự mục ruỗng chậm rãi. Văn minh cần công sức và rủi ro; rút lui mua lấy sự thoải mái riêng tư nhưng thường kết thúc trong sự diệt vong riêng tư. #speaker:aristotle

  * * [Ta nghi ngờ mình có thể quay lại] Ta không còn sức để trở về. #moral:pessimism:+2
      ~ pessimism += 2
      Aristotle: Sức mạnh được rèn, không phải triệu hồi. Hãy bắt đầu bằng những lời hứa có thể giữ và những nghĩa vụ có thể hoàn thành. Luyện sức bằng chính hành động. #speaker:aristotle
      -> aristotle_scene_end

  * * [Có lẽ ta có thể phục vụ] Có lẽ sự phục vụ sẽ neo giữ ta. #moral:idealism:+1 #moral:order:+1
      ~ idealism += 1
      ~ order += 1
      Aristotle: Vậy hãy phục vụ cho đúng mực và khiêm nhường. Sự sửa chữa vĩ đại là công việc chậm rãi của muôn vàn hành động nhỏ bé, thành thật. #speaker:aristotle
      -> aristotle_scene_end

* [Thành phố đã mục ruỗng] Thể chế đã thối nát — thành phố là một cái xác. #moral:pessimism:+2 #moral:chaos:+1
  ~ pessimism += 2
  ~ chaos += 1
  Aristotle: Hoài nghi là mốt thời thượng, nhưng nó cũng là sự dễ dãi. Có mục ruỗng, nhưng cũng có sửa chữa. Nếu ngươi chỉ chọn lên án, ngươi sẽ trở thành một kẻ bất mãn chuyên nghiệp. #speaker:aristotle

  * * [Tái thiết dường như bất khả] Tái thiết thật vô lý khi sự mục nát ăn sâu. #moral:pessimism:+2 #moral:materialism:+1
      ~ pessimism += 2
      ~ materialism += 1
      Aristotle: Vậy là ngươi đã cam chịu — trở thành khán giả của chính sự suy tàn của mình. Ngay cả cam chịu cũng là một sự lựa chọn; ít nhất hãy lựa chọn với sự tỉnh thức. #speaker:aristotle
      -> aristotle_scene_end

  * * [Có lẽ ta có thể gieo một hạt giống] Nếu một hạt giống có thể mọc, có lẽ ta có thể thử. #moral:order:+1 #moral:idealism:+1
      ~ order += 1
      ~ idealism += 1
      Aristotle: Một hành động khôn ngoan duy nhất có thể khởi đầu cho sự tháo gỡ lâu dài của mục ruỗng. Hãy gieo hạt ở nơi nó có thể bén rễ; đừng ném nó vào gió. #speaker:aristotle

      -> aristotle_scene_end

      Aristotle hạ ánh nhìn xuống nền đá như thất vọng vì sự chậm chạp của công cuộc sửa chữa con người, rồi lại nhìn vào ngươi với vẻ mặt có thể được đọc là hy vọng, hoặc chỉ là sự tính toán lạnh lùng. #speaker:aristotle

      Aristotle: Thực hành. Thói quen. Can đảm gắn liền với phán đoán. Nếu ngươi khinh thường những điều này, ngươi sẽ bị nhớ tới như một cơn bão — ồn ào, hủy diệt, và bị quên lãng. Nếu ngươi tiếp nhận chúng, ngươi sẽ chậm chạp và nhỏ bé — và có thể, theo thời gian, trở lại làm người. #speaker:aristotle


=== aristotle_scene_end ===
-> DONE
