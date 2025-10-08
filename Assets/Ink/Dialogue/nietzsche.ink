/*VAR idealism = 0
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
*/

VAR idealism = 0
VAR materialism = 0  
VAR rationalism = 0
VAR empiricism = 0
VAR order = 0
VAR chaos = 0
VAR pessimism = 0

-> nietzsche_scene

=== nietzsche_scene ===
Một đại sảnh trống trải.  
Những tấm gương biến mất. Nền đá cẩm thạch nứt toác, những mạch sáng đỏ len lỏi như máu động mạch của thế giới.  
Giữa trung tâm là Nietzsche — áo sơ mi mở tung, ngực đầy sẹo, tóc rối như bão.  
Hắn trông như một nhà tiên tri đã thức suốt ngàn năm mà vẫn chưa chịu chết.  
Phía sau, tiếng thét mờ xa cuộn lên như gió rít qua một thánh đường. #speaker:nietzsche

Nietzsche: Vậy là... con người cuối cùng cũng bò ra khỏi quan tài của mình.  
Nietzsche: Ngươi có thích khúc ru tử thi của Schopenhauer không? Hắn luôn thích dạy xác chết cách thì thầm.  
Nietzsche: Nói đi, chiến binh — ngươi quyết định làm hòa với sự mục rữa của chính mình từ bao giờ? #speaker:nietzsche

* [Tôi không hề.] Tôi chỉ... ngừng chống lại thôi. 
  ~ pessimism += 2
  Nietzsche: Ngừng chống lại ư?
  Nietzsche: Ngươi gọi đầu hàng là hòa bình — ta gọi đó là sự thối rữa biết nói.  
  Nietzsche: Thế giới không dung thứ cho sự trì trệ; nó chôn vùi nó. #speaker:nietzsche
  -> nietzsche_reflection

* [Sau khi giết chóc.] Tôi chẳng còn sức chiến đấu nữa. 
  ~ pessimism += 1
  ~ order += 1
  Nietzsche: À, đạo đức — liều thuốc phiện cuối cùng của kẻ tội lỗi. Ngươi giết, rồi sáng tạo ra cái gọi là hòa bình để ru ngủ nỗi nôn nao. Ngươi không đánh mất niềm tin — ngươi chỉ đổi nó lấy sự hổ thẹn. #speaker:nietzsche
  -> nietzsche_reflection

* [Khi Thượng Đế rời đi.] Không còn gì đáng để chiến đấu nữa. 
  ~ idealism += 1
  ~ pessimism += 1
  Nietzsche: Thượng Đế không rời đi. Ngươi đã đẩy Ngài khỏi tháp khi Ngài ngừng phục tùng ngươi. Đừng than khóc cho tên đầy tớ mà chính ngươi đã sa thải. #speaker:nietzsche
  -> nietzsche_reflection

* [Tôi chưa từng làm hòa.] Tôi chỉ... kiệt sức thôi. 
  ~ chaos += 1
  ~ materialism += 1
  Nietzsche: Thế thì ngươi chỉ nửa sống — loại tệ hại nhất.
  Nietzsche: Quá sợ chết, lại quá chai lì để sống. Những kẻ nửa vời — hâm hấp, nửa vỡ nửa nguyên — ta chẳng có đủ kiên nhẫn cho chúng. #speaker:nietzsche
  -> nietzsche_reflection

=== nietzsche_reflection ===
Hắn bắt đầu bước đi — mỗi bước vang như sấm rền. 
Hai bàn tay co giật khi hắn nói, như đang cố xé toạc thứ gì vô hình trong không khí. #speaker:nietzsche

Nietzsche: Ngươi nghĩ tuyệt vọng là cao quý sao?
Nietzsche: Không.
Nietzsche: Nietzsche: Đó chỉ là một cái cớ khác để trốn khỏi gánh nặng của sáng tạo.
Nietzsche: Ngươi thấy đau khổ và gọi nó là bằng chứng cho sự tàn nhẫn của thế giới.
Nietzsche: Còn ta nhìn thấy nó — và gọi đó là cái giá của việc tỉnh thức.
Nietzsche: Ngươi đau, bởi ngươi vẫn còn đủ hiện hữu để cảm nhận. #speaker:nietzsche

* [Tôi chẳng muốn hiện hữu nữa.] Tôi chỉ muốn nó dừng lại. 
  ~ pessimism += 3
  Nietzsche: Vậy thì hãy bò trở lại lòng đất, để giun dế hoàn tất những gì chiến tranh bỏ dở.
  Nietzsche: Ngươi muốn yên bình, không phải sự thật. Ngươi muốn chết mà không cần thừa nhận rằng chính mình đã chọn điều đó. #speaker:nietzsche
  -> nietzsche_will

* [Tôi muốn có ý nghĩa.] Nhưng tôi không tìm thấy nó.
  ~ idealism += 2
  ~ rationalism += 1
  Nietzsche: Ý nghĩa không phải thứ để tìm — nó là thứ để tạc ra, bằng máu, bằng sợ hãi, bằng ý chí.
  Nietzsche: Ngươi cầu xin thay vì tạo ra. Đó là lý do ngươi gãy. #speaker:nietzsche
  -> nietzsche_will

* [Đau đớn không phải ý nghĩa.] Nó chỉ là đau đớn thôi. 
  ~ rationalism += 1
  ~ materialism += 1
  Nietzsche: Sai. Đau đớn chính là ý nghĩa, khi bị lột trần.
  Nietzsche: Ngươi nghĩ niềm vui tạo nên thần linh sao? Không. 
  Nietzsche: Chỉ những kẻ chảy máu mà không xin lỗi mới trở nên thật. #speaker:nietzsche
  -> nietzsche_will

* [Tôi chẳng quan trọng với ai cả.] Vì thế mà đau. 
  ~ pessimism += 2
  ~ idealism += 1
  Nietzsche: Dối trá. Ngươi chỉ chưa bao giờ quan trọng với chính mình.
  Nietzsche: Và ngươi ngu ngốc khi nghĩ rằng tình yêu của kẻ khác có thể sửa điều đó. #speaker:nietzsche
  -> nietzsche_will

=== nietzsche_will ===
Hắn bật cười — trầm, khàn, thật đến mức nghe như ký ức đang tự cào lên từ đáy tim. #speaker:nietzsche

Nietzsche: Kẻ yếu tôn thờ vết thương của mình.  
Nietzsche: Chúng nâng niu, đánh bóng, khoe khoang, rồi gọi đó là khiêm nhường.
Nietzsche: Ngươi cũng thế. Ngươi gọi khổ đau là trí tuệ — vì đứng dậy còn khó hơn gục xuống.
Nietzsche: Lửa của ngươi đâu rồi, chiến binh? Thế giới cướp nó ư, hay ngươi tự dâng lên? #speaker:nietzsche

* [Thế giới cướp nó.] Nó đã lột trần tôi. 
  ~ pessimism += 2
  Nietzsche: Thế giới chẳng cướp được gì cả. Ngươi tự dâng nó đi.
  Nietzsche: Ngươi cho phép điều đó. Và đó chính là tội lỗi ngươi không dám nhận. #speaker:nietzsche
  -> nietzsche_power

* [Tôi buông nó.] Tôi chẳng còn tin vào nó nữa. 
  ~ idealism += 1
  ~ pessimism += 1
  Nietzsche: Vậy thì hãy tin vào thứ khác.
  Nietzsche: Tin vào chính mình.
  Nietzsche: Nếu không thể thờ phụng Thượng Đế — hãy tạo ra một vị thần mang gương mặt của chính mình. #speaker:nietzsche
  -> nietzsche_power

* [Tôi chưa từng có lửa.] Chỉ có mệnh lệnh. Và tiếng ồn. 
  ~ order += 1
  ~ pessimism += 1
  Nietzsche: Thế thì ngươi đã sống như một cỗ máy — giờ hãy thử chết như một con người. Hơi thở đầu tiên của tự do luôn mang mùi máu. #speaker:nietzsche
  -> nietzsche_power

* [Nó vẫn còn.] Chôn sâu, nhưng đang đợi. 
  ~ chaos += 2
  ~ idealism += 1
  Nietzsche: Tốt. Đó là sự sống — đang cào lên từ dưới lớp đất, gào đòi được sinh ra.
  Nietzsche: Đừng giết nó. Hãy giải phóng nó. #speaker:nietzsche
  -> nietzsche_power

=== nietzsche_power ===
Nietzsche bước lại gần, giọng hắn nóng rát như hơi thở phả lên da.  
Tiếng thét trong đại sảnh lớn dần — không còn là kinh hoàng, mà là tiếng cười, như niềm vui đã quên mất lý do của mình. #speaker:nietzsche

Nietzsche: Ngươi gọi mình là kẻ bị nguyền vì đã yêu, đã giết, đã nghi ngờ.
Nietzsche: Nhưng đó chính là con người.
Nietzsche: Những linh hồn sạch sẽ nấp sau luật lệ và đức tin — chúng chỉ thối rữa chậm hơn thôi.
Nietzsche: Ngươi đã thấy những gì chúng trốn. Ngươi đã nhìn thẳng xuống vực.
Nietzsche: Vậy sao lại bò đi, thay vì dựng ngai giữa hố sâu? #speaker:nietzsche

* [Vì đó là địa ngục.] Tôi không muốn sống trong đó. 
  ~ idealism += 1
  ~ pessimism += 2
  Nietzsche: Thế thì ngươi vẫn còn là tín đồ — đứa trẻ sợ cái bóng của chính mình.
  Nietzsche: Địa ngục không phải trừng phạt. Nó là mái nhà của những kẻ ngừng giả vờ. #speaker:nietzsche
  -> nietzsche_final

* [Vì tôi không xứng đáng có quyền lực đó.] Không sau những gì tôi đã làm. 
  ~ order += 2
  ~ idealism += 1
  Nietzsche: “Xứng đáng”?
  Nietzsche: Sư tử có hỏi xem nó có xứng với mặt trời không?
  Nietzsche: Ngươi vẫn đang van xin được phép tồn tại. Thật đáng thương. #speaker:nietzsche
  -> nietzsche_final

* [Vì tôi thích nó.] Quyền lực... thành thật. 
  ~ chaos += 2
  ~ materialism += 1
  Nietzsche: Cuối cùng — thành thật.
  Nietzsche: Ngươi chưa bao giờ là thánh. Ngươi chỉ quá hèn để thừa nhận rằng mình tận hưởng ngọn lửa. #speaker:nietzsche
  -> nietzsche_final

* [Vì tôi có thể tạo ra điều gì từ đó.] Có lẽ vẫn chưa muộn. 
  ~ idealism += 2
  ~ rationalism += 1
  Nietzsche: Sáng tạo qua đổ nát — kiểu sáng tạo duy nhất đáng có.  
  Nietzsche: Đau khổ là nguyên liệu thô của ngươi. Hãy dùng nó, hoặc bị nó nuốt. #speaker:nietzsche
  -> nietzsche_final

=== nietzsche_final ===
Hắn dang rộng hai tay — bóng hắn in lên vệt lửa rò rỉ qua những khe nứt của thế giớii.  
Trong khoảnh khắc đó, hắn vừa thần thánh vừa quỷ dữ — và tự hào vì là cả hai. #speaker:nietzsche

Nietzsche: Schopenhauer muốn ngươi im lặng. Còn ta muốn ngươi gào lên.
Nietzsche: Nếu chẳng còn Thượng Đế — thì mọi hành động đều là thiêng liêng, bởi ngươi đã chọn nó.  
Nietzsche: Đó là gánh nặng. Và đó cũng là vinh quang. #speaker:nietzsche

Hắn lại cười — không phải cười vào mặt ngươi, mà cùng thứ gì đó trong ngươi vừa bắt đầu chuyển động.

Nietzsche: Không có chuộc tội. Không có tha thứ.
Nietzsche: Chỉ có ý chí — thô ráp, vô tận, khát khao.
Nietzsche: Hãy nuôi nó, chiến binh.
Nietzsche: Nếu không, nó sẽ nuốt lấy ngươi. #speaker:nietzsche

* [Vậy tôi sẽ trỗi dậy.] Tôi sẽ đứng bằng chính đôi chân mình. 
  ~ idealism += 2
  ~ order += 1
  Nietzsche: Tốt. Hãy trỗi dậy, dù dơ bẩn, dù gãy nát — cứ trỗi dậy.
  Nietzsche: Thế là đủ để trở thành thần. #speaker:nietzsche
  -> nietzsche_scene_end

* [Vậy tôi sẽ cháy.] Nếu đó là sống, tôi sẽ cháy. 
  ~ chaos += 2
  ~ pessimism += 1
  Nietzsche: Cháy đi, rực rỡ. Những vị thần ngươi giết sẽ ganh tị với ngọn lửa đó. #speaker:nietzsche
  -> nietzsche_scene_end

* [Vậy tôi sẽ khước từ tất cả.] Tôi không cần ngai, không cần vương miện. 
  ~ order += 2
  ~ idealism += 1
  Nietzsche: Khước từ quyền lực vẫn là một hành động của quyền lực.
  Nietzsche: Chỉ đừng giả vờ rằng nó khiến ngươi thuần khiết hơn. #speaker:nietzsche
  -> nietzsche_scene_end

* [Vậy tôi sẽ để thế giới chết cùng tôi.] Để nó nghẹn trong im lặng. 
  ~ pessimism += 3
  Nietzsche: Kẻ hư vô thuần túy nhất.
  Nietzsche: Ngay cả cái chết cũng chẳng nhớ nổi tên ngươi — và đó là chiến thắng của ngươi. #speaker:nietzsche
  -> nietzsche_scene_end

=== nietzsche_scene_end ===
Ánh sáng đỏ bùng nổ. Đá cẩm thạch vỡ tung. Đại sảnh gào thét.  
Khi âm thanh tắt, Nietzsche đã biến mất. Chỉ còn vọng âm — nghe giống nhịp tim của chính ngươi. #speaker:nietzsche

Nietzsche (từ xa): Ngươi cứ hỏi mình là gì.
...
Nietzsche: Hãy là nó.
Nietzsche: Đó là câu trả lời duy nhất đáng giá. #speaker:nietzsche

-> DONE
