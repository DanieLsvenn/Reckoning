/*VAR idealism = 0
VAR materialism = 0  
VAR rationalism = 0
VAR empiricism = 0
VAR order = 0
VAR chaos = 0
VAR pessimism = 0

-> confucius_scene

=== confucius_scene ===
A quiet courtyard shrouded in perpetual dusk. Stone lanterns burn with dull, red light. The air tastes of incense and damp paper. Confucius stands beside an ancient tree, hands folded neatly within his sleeves. His eyes are steady, but their warmth feels rehearsed — the gaze of a man who has already judged you. #speaker:confucius

Confucius: You come here, foreign son, carrying ruin in your wake. I will not ask what you have done. The rites are not for confession; they are for order. Tell me — what do you think the world owes to you? #speaker:confucius

* [Nothing. The world owes me nothing.] I deserve nothing. The world took its due. #moral:pessimism:+2 #moral:order:+1
  ~ pessimism += 2
  ~ order += 1
  Confucius: A humble answer, or perhaps a broken one. When a man forgets his place, chaos follows. When he denies his worth, decay follows faster. Which is yours — pride or neglect? #speaker:confucius

  * * [Neglect. I abandoned my duties.] I walked away from every role I had. #moral:pessimism:+1 #moral:order:+1
      ~ pessimism += 1
      ~ order += 1
      Confucius: The Way does not vanish when a man flees it. It waits. The shame you feel is the shadow of that waiting. But shame can temper — if you kneel long enough to learn why. #speaker:confucius
      -> confucius_ritual
  * * [Pride. I thought I could make my own path.] I thought I could walk outside the system, above it. #moral:chaos:+2 #moral:rationalism:+1
      ~ chaos += 2
      ~ rationalism += 1
      Confucius: A man who despises order soon becomes a ghost to all bonds — family, duty, heaven. Ghosts wander; they do not build. Do you still believe in building? #speaker:confucius
      -> confucius_ritual

* [The world owes me fairness.] It should have been fair. I gave and was left with nothing. #moral:materialism:+1 #moral:pessimism:+1
  ~ materialism += 1
  ~ pessimism += 1
  Confucius: Fairness is a fiction of rulers. What the world owes you is the shape of your own virtue. Heaven sees through balance, not bargains. You demand justice — but have you practiced it? #speaker:confucius

  * * [I tried, and it failed.] I tried to live by justice. It did not protect me. #moral:pessimism:+2 #moral:order:+1
      ~ pessimism += 2
      ~ order += 1
      Confucius: Then you misunderstood justice as a shield rather than a burden. The noble man holds the law even when it crushes him. #speaker:confucius
      -> confucius_ritual
  * * [No. I only demanded it.] I wanted others to be just, not myself. #moral:chaos:+1 #moral:materialism:+1
      ~ chaos += 1
      ~ materialism += 1
      Confucius: Then you are like the crooked magistrate who condemns thieves while pocketing their coins. Balance cannot be begged; it must be cultivated. #speaker:confucius
      -> confucius_ritual

* [The world owes me peace.] I only wanted quiet — no banners, no screaming. #moral:pessimism:+1 #moral:idealism:+1
  ~ pessimism += 1
  ~ idealism += 1
  Confucius: Peace is not quiet. It is order humming beneath the surface — harmony earned through restraint. You sought the stillness of death, not the order of life. Tell me, soldier, do you still crave silence more than meaning? #speaker:confucius
  * * [Yes. Meaning is a wound.] I prefer numbness to meaning; meaning always hurts. #moral:pessimism:+2 #moral:materialism:+1
      ~ pessimism += 2
      ~ materialism += 1
      Confucius: Then you are already among the unfilial dead — those who speak nothing, feel nothing, and leave nothing. The quiet you seek is not peace, but punishment. #speaker:confucius
      -> confucius_ritual
  * * [No. I want harmony.] Harmony, not silence. Balance, not oblivion. #moral:idealism:+1 #moral:order:+1
      ~ idealism += 1
      ~ order += 1
      Confucius: Then learn harmony by attending the smallest forms — greeting, courtesy, discipline. The Way begins in gesture before it ever reaches heaven. #speaker:confucius
      -> confucius_ritual

=== confucius_ritual ===
A faint sound of a drum echoes. Confucius gestures to the courtyard floor, where faint lines form a circle — the ritual boundary. #speaker:confucius
Confucius: Each man stands within a circle of duties — father, son, friend, subject. When one fails, the others sag. Tell me which circle you broke first. #speaker:confucius

* [The circle of family.] I failed my kin — stopped writing, stopped calling. #moral:pessimism:+1 #moral:order:+1
  ~ pessimism += 1
  ~ order += 1
  Confucius: To neglect the roots is to doom the tree. You sought freedom, and found hollowness. Return to the roots if you wish for fruit. #speaker:confucius

  * * [They would not forgive me.] They wouldn’t accept me back. #moral:pessimism:+2
      ~ pessimism += 2
      Confucius: Forgiveness is their duty, but repentance is yours. Write to them, even if the page burns before it’s sent. The ritual matters even if unseen. #speaker:confucius
      -> confucius_reflection
  * * [I might return someday.] I will try, someday. #moral:idealism:+1 #moral:order:+1
      ~ idealism += 1
      ~ order += 1
      Confucius: “Someday” is a word that rots deeds. Begin now, while your name can still be spoken without spitting. #speaker:confucius
      -> confucius_reflection

* [The circle of comrades.] I failed those beside me. I left them to rot. #moral:pessimism:+2 #moral:chaos:+1
  ~ pessimism += 2
  ~ chaos += 1
  Confucius: Loyalty is the spine of man. Without it, the body folds. You broke the spine and wonder why you crawl. #speaker:confucius

  * * [They deserved better than me.] I was not fit to lead or follow. #moral:pessimism:+2
      ~ pessimism += 2
      Confucius: Self-pity masks cowardice. The brave face guilt with action, not lament. Visit their graves if they still exist. Speak to the dead if the living will not listen. #speaker:confucius
      -> confucius_reflection
  * * [I could not bear their deaths.] I left because their deaths haunted me. #moral:pessimism:+1 #moral:idealism:+1
      ~ pessimism += 1
      ~ idealism += 1
      Confucius: A noble fear — but fear must not be the master. Honor their deaths by carrying their virtues, not their ghosts. #speaker:confucius
      -> confucius_reflection

* [The circle of heaven.] I broke faith with heaven itself. I stopped believing. #moral:pessimism:+2 #moral:rationalism:+1
  ~ pessimism += 2
  ~ rationalism += 1
  Confucius: Heaven does not demand belief. It demands alignment. You mistook faith for favor. The heavens are not sentimental — they mirror your conduct, not your prayers. #speaker:confucius
  * * [Then heaven is cruel.] Heaven is indifferent — why should I serve it? #moral:chaos:+1 #moral:pessimism:+1
      ~ chaos += 1
      ~ pessimism += 1
      Confucius: Cruel? No. Uncompromising. You call it cruelty because it refuses to flatter your pain. #speaker:confucius
      -> confucius_reflection
  * * [Then I will align again.] If belief is hollow, I will practice alignment. #moral:order:+1 #moral:idealism:+1
      ~ order += 1
      ~ idealism += 1
      Confucius: Practice, not feeling, restores the Way. Conduct is the only prayer heaven answers. #speaker:confucius
      -> confucius_reflection

=== confucius_reflection ===
The incense dims. The red lanterns flicker until only the outline of Confucius remains. His voice turns colder, quieter. #speaker:confucius

Confucius: Ritual without virtue is theater. Virtue without ritual is noise. You Westerners call it hypocrisy; I call it civilization. Do not ask heaven to forgive — act in a way that needs no forgiveness. #speaker:confucius

He pauses, head tilted slightly — not kindly.  
Confucius: If you truly wish for harmony, start where the smallest cracks form — the greeting, the promise, the tone. Civilization begins in the mouth before it ever reaches the soul. But perhaps it is too late for your mouth to speak decently. #speaker:confucius

* [I can still learn.] Then teach me. I can still learn the right words. #moral:idealism:+1 #moral:order:+1
  ~ idealism += 1
  ~ order += 1
  Confucius: Then bow. Practice without faith is still better than faith without practice. If you repeat the gesture enough, the heart might follow. #speaker:confucius
  -> confucius_scene_end

* [Words won’t fix rot.] Words mean nothing to a corpse. #moral:pessimism:+2 #moral:chaos:+1
  ~ pessimism += 2
  ~ chaos += 1
  Confucius: Then rot elegantly. Even a dying tree must fall in accordance with form. #speaker:confucius
  -> confucius_scene_end

* [I reject your order.] Rituals are lies for those afraid to think. #moral:chaos:+2 #moral:rationalism:+1
  ~ chaos += 2
  ~ rationalism += 1
  Confucius: Thought without ritual breeds monsters that reason their own decay. Perhaps that is what you are — the monster reason made when it lost shame. #speaker:confucius
  -> confucius_scene_end

=== confucius_scene_end ===
Confucius folds his hands once more. The lantern light dims until only his silhouette remains — rigid, unbending, eternal. #speaker:confucius
Confucius: Heaven does not forgive. It endures. If you wish to endure with it, discipline yourself until the body obeys the mind, and the mind obeys something higher. If not — the mud welcomes you. #speaker:confucius

-> DONE
*/

VAR idealism = 0
VAR materialism = 0  
VAR rationalism = 0
VAR empiricism = 0
VAR order = 0
VAR chaos = 0
VAR pessimism = 0

-> confucius_scene

=== confucius_scene ===
Một khu sân tĩnh mịch chìm trong bóng chiều vĩnh cửu.  
Những chiếc đèn đá hắt ra ánh sáng đỏ nhạt, mờ đục.  
Hương trầm phảng phất trong không khí, quyện cùng mùi giấy ẩm lâu năm.  
Khổng Tử đứng bên gốc cây cổ thụ, tay xếp gọn trong tay áo.  
Ánh mắt ông vững chãi, nhưng hơi ấm trong đó như được diễn lại vô số lần — ánh nhìn của một người đã phán xét ngươi từ trước khi ngươi mở lời. #speaker:confucius

Confucius: Ngươi đến đây, khách từ phương xa, mang theo tàn hoang sau bước chân mình.  
Ta sẽ không hỏi ngươi đã làm gì — bởi lễ không sinh ra để thú tội, mà để lập lại trật tự.  
Nói ta nghe... ngươi nghĩ thế giới này nợ ngươi điều chi? #speaker:confucius

* [Không gì cả. Thế giới chẳng nợ ta gì hết.] Ta chẳng xứng đáng điều gì. Thế giới đã lấy đủ phần của nó. #moral:pessimism:+2 #moral:order:+1
  ~ pessimism += 2
  ~ order += 1
  Confucius: Một câu trả lời khiêm nhường... hoặc là của một linh hồn đã gãy.  
Khi người quên vị trí của mình, hỗn loạn theo sau;  
khi hắn phủ nhận giá trị của mình, sự mục ruỗng đến nhanh hơn.  
Ngươi thuộc về đâu — kiêu ngạo hay lãng quên? #speaker:confucius

  * * [Lãng quên. Ta đã bỏ rơi bổn phận.] Ta đã rời bỏ mọi vai trò từng mang. #moral:pessimism:+1 #moral:order:+1
      ~ pessimism += 1
      ~ order += 1
      Confucius: Đạo không biến mất khi người ta quay lưng. Nó chỉ đứng yên mà đợi.  
Cảm giác hổ thẹn trong lòng ngươi chính là bóng của sự chờ đợi ấy.  
Nhưng hổ thẹn có thể rèn thành nhân, nếu ngươi quỳ đủ lâu để hiểu vì sao mình ngã. #speaker:confucius
      -> confucius_ritual
  * * [Kiêu ngạo. Ta tưởng mình có thể tự tạo con đường riêng.] Ta tưởng mình có thể đi ngoài hệ thống, vượt lên trên nó. #moral:chaos:+2 #moral:rationalism:+1
      ~ chaos += 2
      ~ rationalism += 1
      Confucius: Kẻ khinh miệt trật tự sớm thành bóng ma — xa rời gia đình, nghĩa vụ, và cả trời.  
Ma lang thang, chúng không dựng xây được gì.  
Ngươi còn tin vào việc dựng xây chăng? #speaker:confucius
      -> confucius_ritual

* [Thế giới nợ ta công bằng.] Nó lẽ ra phải công bằng. Ta đã cho đi, và chẳng nhận lại gì. #moral:materialism:+1 #moral:pessimism:+1
  ~ materialism += 1
  ~ pessimism += 1
  Confucius: “Công bằng” là lời nói của kẻ cầm quyền.  
Điều thế giới nợ ngươi — chính là hình dạng của đức hạnh trong ngươi.  
Trời nhìn qua cân bằng, không qua thương lượng.  
Ngươi đòi công lý... nhưng ngươi đã hành xử theo công lý chưa? #speaker:confucius

  * * [Ta đã cố, nhưng thất bại.] Ta từng sống theo lẽ công, nhưng nó chẳng bảo vệ ta. #moral:pessimism:+2 #moral:order:+1
      ~ pessimism += 2
      ~ order += 1
      Confucius: Vậy ngươi đã hiểu sai công lý — tưởng nó là tấm khiên, trong khi nó là gánh nặng.  
Người quân tử giữ đạo, dù đạo ấy có nghiền nát chính thân mình. #speaker:confucius
      -> confucius_ritual
  * * [Không. Ta chỉ đòi hỏi nó.] Ta muốn người khác công chính, chứ không phải chính ta. #moral:chaos:+1 #moral:materialism:+1
      ~ chaos += 1
      ~ materialism += 1
      Confucius: Vậy ngươi chẳng khác viên quan cong lưng, miệng kết án kẻ trộm trong khi tay vẫn giấu vàng.  
Cân bằng không thể cầu xin — nó phải được vun bồi. #speaker:confucius
      -> confucius_ritual

* [Thế giới nợ ta sự bình yên.] Ta chỉ muốn yên tĩnh — không cờ xí, không tiếng hét. #moral:pessimism:+1 #moral:idealism:+1
  ~ pessimism += 1
  ~ idealism += 1
  Confucius: Bình yên không phải là tĩnh lặng.  
Nó là trật tự ngân nga dưới bề mặt — là hòa điệu được rèn từ tiết chế.  
Ngươi tìm sự tĩnh lặng của cái chết, chứ không phải trật tự của sự sống.  
Nói ta nghe, người lính... ngươi vẫn khao khát im lặng hơn là ý nghĩa sao? #speaker:confucius

  * * [Phải. Ý nghĩa chỉ là vết thương.] Ta thà tê liệt còn hơn là hiểu, vì hiểu luôn đau. #moral:pessimism:+2 #moral:materialism:+1
      ~ pessimism += 2
      ~ materialism += 1
      Confucius: Thế thì ngươi đã ở giữa những kẻ bất hiếu chết rồi — những kẻ chẳng nói, chẳng cảm, chẳng để lại dấu gì.  
Sự tĩnh lặng ngươi tìm không phải là bình yên, mà là trừng phạt. #speaker:confucius
      -> confucius_ritual
  * * [Không. Ta muốn hòa điệu.] Hòa điệu, chứ không im lặng. Cân bằng, chứ không lãng quên. #moral:idealism:+1 #moral:order:+1
      ~ idealism += 1
      ~ order += 1
      Confucius: Vậy hãy học hòa điệu từ những điều nhỏ nhất — lời chào, lễ nghi, kỷ luật.  
Đạo bắt đầu từ cử chỉ, rồi mới tới thiên mệnh. #speaker:confucius
      -> confucius_ritual

=== confucius_ritual ===
Tiếng trống khẽ vang trong không khí.  
Khổng Tử ra hiệu nhìn xuống nền sân — nơi các đường mờ dần hiện lên thành một vòng tròn: giới hạn của nghi lễ. #speaker:confucius

Confucius: Mỗi người đều đứng trong một vòng tròn bổn phận — cha, con, bằng hữu, thần dân.  
Khi một vòng đổ, những vòng khác chùng xuống.  
Hãy nói ta nghe, ngươi đã làm gãy vòng nào trước tiên? #speaker:confucius

* [Vòng gia đình.] Ta phụ người thân — chẳng viết thư, chẳng hỏi han. #moral:pessimism:+1 #moral:order:+1
  ~ pessimism += 1
  ~ order += 1
  Confucius: Bỏ quên gốc là làm cây khô héo.  
Ngươi đi tìm tự do, và chỉ gặp rỗng không.  
Hãy trở về với gốc nếu còn muốn hái trái. #speaker:confucius

  * * [Họ sẽ không tha thứ cho ta.] Họ sẽ chẳng đón ta về. #moral:pessimism:+2
      ~ pessimism += 2
      Confucius: Tha thứ là bổn phận của họ, nhưng sám hối là của ngươi.  
Hãy viết thư, dù trang giấy cháy trước khi đến tay.  
Nghi lễ vẫn có nghĩa, ngay cả khi không ai nhìn thấy. #speaker:confucius
      -> confucius_reflection
  * * [Ta sẽ trở lại một ngày nào đó.] Ta sẽ thử, một ngày nào đó. #moral:idealism:+1 #moral:order:+1
      ~ idealism += 1
      ~ order += 1
      Confucius: “Một ngày nào đó” — đó là từ khiến hành động thối rữa.  
Hãy bắt đầu ngay khi tên ngươi còn được nói ra mà chưa kèm khinh miệt. #speaker:confucius
      -> confucius_reflection

* [Vòng bằng hữu.] Ta phụ những người ở cạnh ta. Ta bỏ mặc họ mục nát. #moral:pessimism:+2 #moral:chaos:+1
  ~ pessimism += 2
  ~ chaos += 1
  Confucius: Trung nghĩa là xương sống của con người.  
Mất nó, thân ngươi chỉ còn là thân gấp khúc.  
Ngươi bẻ gãy xương sống, rồi lại thắc mắc vì sao mình phải bò. #speaker:confucius

  * * [Họ xứng đáng hơn ta.] Ta chẳng xứng để dẫn hay theo. #moral:pessimism:+2
      ~ pessimism += 2
      Confucius: Tự thương mình là mặt nạ của hèn nhát.  
Kẻ dũng cảm đối diện tội lỗi bằng hành động, không bằng than thở.  
Nếu mồ họ còn, hãy đến viếng.  
Nếu họ chết rồi, nói chuyện với linh hồn cũng hơn im lặng. #speaker:confucius
      -> confucius_reflection
  * * [Ta không chịu nổi cái chết của họ.] Ta bỏ đi vì ám ảnh họ mãi. #moral:pessimism:+1 #moral:idealism:+1
      ~ pessimism += 1
      ~ idealism += 1
      Confucius: Một nỗi sợ cao quý — nhưng đừng để sợ hãi làm chủ.  
Tôn vinh cái chết của họ bằng cách mang theo đức hạnh, không phải bóng ma. #speaker:confucius
      -> confucius_reflection

* [Vòng trời.] Ta đã phản bội thiên đạo. Ta thôi tin. #moral:pessimism:+2 #moral:rationalism:+1
  ~ pessimism += 2
  ~ rationalism += 1
  Confucius: Trời không đòi lòng tin. Trời đòi sự hòa hợp.  
Ngươi đã nhầm niềm tin với sự ưu ái.  
Thiên đạo không cảm tính — nó phản chiếu hành vi, không nghe lời cầu nguyện. #speaker:confucius

  * * [Vậy thì trời tàn nhẫn.] Trời vô cảm — sao ta phải phục? #moral:chaos:+1 #moral:pessimism:+1
      ~ chaos += 1
      ~ pessimism += 1
      Confucius: Tàn nhẫn ư? Không. Chỉ là không thỏa hiệp.  
Ngươi gọi nó là tàn nhẫn vì nó từ chối nịnh bợ nỗi đau của ngươi. #speaker:confucius
      -> confucius_reflection
  * * [Vậy ta sẽ lại hòa hợp.] Nếu lòng tin rỗng, ta sẽ thực hành hòa hợp. #moral:order:+1 #moral:idealism:+1
      ~ order += 1
      ~ idealism += 1
      Confucius: Hành vi, không cảm xúc, mới khôi phục được Đạo.  
Thi hành chính là lời cầu nguyện duy nhất mà trời lắng nghe. #speaker:confucius
      -> confucius_reflection

=== confucius_reflection ===
Hương trầm nhạt dần. Đèn lồng đỏ chập chờn, cho đến khi chỉ còn đường nét mờ của Khổng Tử trong bóng tối. Giọng ông hạ thấp, lạnh hơn, như gió cuối thu. #speaker:confucius

Confucius: Nghi lễ không có đức hạnh chỉ là sân khấu.  
Đức hạnh không có nghi lễ chỉ là tiếng ồn.  
Các ngươi ở phương Tây gọi đó là giả hình;  
còn ta gọi nó là văn minh.  
Đừng cầu trời tha thứ — hãy sống sao cho không cần được tha thứ. #speaker:confucius

Ông dừng lại, hơi nghiêng đầu — không hẳn là nhân từ.  
Confucius: Nếu ngươi thật lòng muốn hòa điệu, hãy bắt đầu từ những vết nứt nhỏ nhất — lời chào, lời hứa, giọng nói.  
Văn minh khởi trong miệng trước khi bén rễ trong linh hồn.  
Nhưng có lẽ... miệng ngươi đã quá lâu không biết nói điều phải. #speaker:confucius

* [Ta vẫn có thể học.] Hãy dạy ta. Ta vẫn có thể học lời đúng. #moral:idealism:+1 #moral:order:+1
  ~ idealism += 1
  ~ order += 1
  Confucius: Vậy thì cúi đầu.  
Thực hành không cần niềm tin vẫn hơn niềm tin không hành động.  
Lặp đi lặp lại đủ lâu — trái tim có thể theo kịp hình thức. #speaker:confucius
  -> confucius_scene_end

* [Lời nói không cứu được mục ruỗng.] Lời lẽ chẳng nghĩa lý gì với xác chết. #moral:pessimism:+2 #moral:chaos:+1
  ~ pessimism += 2
  ~ chaos += 1
  Confucius: Vậy thì hãy mục ruỗng cho đúng lễ.  
Ngay cả cây sắp đổ cũng phải ngã trong khuôn phép. #speaker:confucius
  -> confucius_scene_end

* [Ta khước từ trật tự của ngươi.] Nghi lễ là dối trá của kẻ sợ tư duy. #moral:chaos:+2 #moral:rationalism:+1
  ~ chaos += 2
  ~ rationalism += 1
  Confucius: Tư duy không có nghi lễ sinh ra quái vật — những kẻ tự lý giải sự thối nát của chính mình.  
Có lẽ đó chính là ngươi — con quái vật do lý trí tạo ra khi nó đánh mất hổ thẹn. #speaker:confucius
  -> confucius_scene_end

=== confucius_scene_end ===
Khổng Tử lại chắp tay. Ánh sáng đèn dần tắt, chỉ còn bóng dáng ông — cứng rắn, bất động, bất diệt. #speaker:confucius
Confucius: Trời không tha thứ. Trời chỉ tồn tại.  
Nếu ngươi muốn cùng nó tồn tại, hãy rèn mình cho đến khi thân phục tâm, và tâm phục điều cao hơn.  
Nếu không... bùn đất vẫn luôn mở rộng vòng tay. #speaker:confucius

-> DONE
