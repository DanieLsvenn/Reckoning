/*VAR idealism = 0
VAR materialism = 0  
VAR rationalism = 0
VAR empiricism = 0
VAR order = 0
VAR chaos = 0
VAR pessimism = 0

-> opening_scene

=== opening_scene ===
The Agora fades into mist. The crowd disperses, leaving only us sitting face to face. The space feels both dreamlike and heavy, each word anchoring itself to the soul. #speaker:socrates
Socrates: Dark friend, I see regrets in those eyes. Hard not to ask what those eyes have seen, have lived for - Tell me, what was the purpose of your existence? #speaker:socrates

* [There's no other choice] I live because there's no other choice. Like a mangy dog on a chain, breathing means being dragged along. Purpose? I'm just waiting for the rope to rot and break. #moral:pessimism:+2 #moral:materialism:+1 #moral:chaos:+1
    ~ pessimism += 2
    ~ materialism += 1
    ~ chaos += 1
    Socrates: If living is just waiting for the chain to decay, then you're no different from a caged beast. But you're not an animal, are you? Or have you convinced yourself that you are? #speaker:socrates
    * * [Yes, I'm an animal] Yes, I am an animal. Humans are just beasts that can speak, nothing more. #moral:materialism:+2 #moral:pessimism:+1
        ~ materialism += 2
        ~ pessimism += 1
        Socrates: If you are merely an animal, then why do you suffer when you betray yourself? Animals don't feel shame about their nature. #speaker:socrates
        * * * [Just reflex, no soul] That's just reflex. Like a beaten dog flinching. There's no soul here. #moral:materialism:+2 #moral:pessimism:+3 #moral:chaos:+1
            ~ materialism += 2
            ~ pessimism += 3
            ~ chaos += 1
            Socrates: You have chosen the path of complete denial. The world holds no meaning beyond material existence, and even suffering is just biological response. #speaker:socrates #sticker:materialism_void
            -> story_end
        * * * [I judge myself] Perhaps... I fear shame because I judge myself. But that doesn't prove a soul exists. #moral:rationalism:+1 #moral:materialism:+1
            ~ rationalism += 1
            ~ materialism += 1
            Socrates: Self-judgment without an eternal judge... interesting. You become both prisoner and warden of yourself. #speaker:socrates #sticker:rationalism_mirror
            -> story_end
    * * [I want to believe I'm different] No... I want to believe I'm different, but that faith is so tattered I dare not look in the mirror. #moral:pessimism:+1 #moral:empiricism:+1
        ~ pessimism += 1
        ~ empiricism += 1
        Socrates: Self-doubt can destroy, but it can also cleanse. Tell me, what would you see if you dared to look? #speaker:socrates
        -> justice_scene

* [I live out of habit] Perhaps I live out of habit. I eat, sleep, wake, write a few lines, and continue. I'm not sure if that's called 'purpose' or just a broken machine. #moral:pessimism:+1 #moral:empiricism:+1
    ~ pessimism += 1
    ~ empiricism += 1
    Socrates: Habit can save a person, but it can also imprison them. Do you think living like a machine has any more value than living like a stone? #speaker:socrates
    * * [Yes, I still leave traces] Yes. Even if I'm a broken machine, at least I still move, still leave some trace. #moral:idealism:+1 #moral:order:+1
        ~ idealism += 1
        ~ order += 1
        Socrates: Small actions can build great things. But tell me, are your traces leading somewhere, or are they just random marks in the sand? #speaker:socrates #sticker:order_path
        -> justice_scene
    * * [No, I'm like a stone] No. I'm no different from a stone beaten by waves, except I know I'm useless. #moral:pessimism:+2 #moral:materialism:+1
        ~ pessimism += 2
        ~ materialism += 1
        Socrates: Knowing your condition is the first step to changing it. But do you truly want to change, or do you find comfort in despair? #speaker:socrates #sticker:pessimism_stone
        -> justice_scene

* [To patch the hollow in my heart] I don't know. But sometimes... I write, I read, I see fragments of philosophy scattered about, and I think: if I'm lucky, they might patch the hollow in my heart. Perhaps that's the only reason. #moral:idealism:+1 #moral:rationalism:+1
    ~ idealism += 1
    ~ rationalism += 1
    Socrates: So you seek knowledge to mend your heart? But be careful: knowledge can also be a knife that cuts deeper. I ask you: do you learn to understand, or do you learn only to forget the pain? #speaker:socrates
    * * [I learn to forget] I learn to forget. Books are like wine - the more you drink, the more intoxicated you become, the further from reality. #moral:pessimism:+1 #moral:chaos:+1
        ~ pessimism += 1
        ~ chaos += 1
        Socrates: Escaping reality through knowledge is like drinking seawater for thirst. It may feel good momentarily, but it will destroy you. What reality are you running from? #speaker:socrates #sticker:chaos_wine
        -> justice_scene
    * * [I learn to understand] I learn to understand. Even if truth is cruel, at least it's more real than the garbage in my head. #moral:rationalism:+2 #moral:idealism:+1
        ~ rationalism += 2
        ~ idealism += 1
        Socrates: Truth can hurt, but it can also free. Are you prepared for where this truth might lead you? #speaker:socrates #sticker:rationalism_light
        -> justice_scene

=== justice_scene ===
The evening light slants across the broken stones of the Agora. We walk slowly through the emptying marketplace. #speaker:socrates
Socrates: You've spoken of living - some as animals, some as machines, some patching themselves with knowledge. But I ask you this: if life is a game, what are its rules? #speaker:socrates
Socrates: Should one live according to justice and virtue, or ignore them and live by the law of the strong? #speaker:socrates

* [Justice is a toy of the powerful] Justice? Virtue? Ha! They're just toys of the powerful. A king's justice differs from a slave's justice. A rich man's virtue differs from a hungry man's virtue. I'm poor, I'm rotten, I need no virtue. #moral:pessimism:+2 #moral:materialism:+1 #moral:chaos:+1
    ~ pessimism += 2
    ~ materialism += 1
    ~ chaos += 1
    Socrates: You say justice is a tool of the strong. So when the strong change, does justice change too? Or is justice just an empty name to paint makeup on violence? #speaker:socrates
    * * [Justice is paint on shackles] Exactly. Justice is just paint on shackles. Don't fool me with word games. #moral:materialism:+2 #moral:chaos:+1
        ~ materialism += 2
        ~ chaos += 1
        Socrates: If justice is merely disguised violence, then why do even tyrants feel the need to justify their actions? Why not simply embrace pure power? #speaker:socrates #sticker:chaos_chains
        -> death_scene
    * * [Justice exists but hates me] Perhaps... true justice exists, but it never stands on my side. It hates me. #moral:pessimism:+1 #moral:idealism:+1
        ~ pessimism += 1
        ~ idealism += 1
        Socrates: Justice neither hates nor loves - it simply exists. The question is whether you can align yourself with it, not whether it favors you. #speaker:socrates #sticker:idealism_scales
        -> death_scene

* [I want to believe in justice] I want to believe in justice... but every time I do the 'right' thing, life slaps me in the face. I live well, I suffer. The wicked prosper. So how can you tell me to believe in justice? #moral:pessimism:+1 #moral:empiricism:+1
    ~ pessimism += 1
    ~ empiricism += 1
    Socrates: You say the wicked are rich and the good suffer. But looking deeper, does gold truly make them happy? Or are they just wearing masks, laughing outside while rotting within? #speaker:socrates
    * * [I don't believe it] I don't believe it. I see them eating well, sleeping well, living happily. While I struggle like a dying dog. Don't tell me they suffer more. #moral:pessimism:+1 #moral:empiricism:+1
        ~ pessimism += 1
        ~ empiricism += 1
        Socrates: Visible happiness and true contentment are different things. But tell me, what would true happiness look like to you? #speaker:socrates #sticker:empiricism_mask
        -> death_scene
    * * [Their smiles are hollow] Maybe you're right. Maybe their smiles are hollow. But knowing that doesn't make me suffer any less. #moral:rationalism:+1 #moral:pessimism:+1
        ~ rationalism += 1
        ~ pessimism += 1
        Socrates: Understanding justice isn't about reducing suffering - it's about living true to your soul, regardless of external pain. #speaker:socrates #sticker:rationalism_soul
        -> death_scene

* [Justice must exist somewhere] Perhaps... I still want to believe in justice. If not, this world is just a giant garbage pit. Though I can't see it, I still cling to the idea that somewhere, justice exists. Otherwise, what's the point of living? #moral:idealism:+2 #moral:rationalism:+1
    ~ idealism += 2
    ~ rationalism += 1
    Socrates: You cling to justice like a drowning man clings to a branch. But remember: clinging to illusions only makes you drown faster. So I ask: what is justice? #speaker:socrates
    Socrates: Is it the will of the gods, of humans, or of the soul within? #speaker:socrates
    * * [Justice is the law of gods] Justice is the law of the gods. Only they have the right to establish it. #moral:idealism:+2 #moral:order:+1
        ~ idealism += 2
        ~ order += 1
        Socrates: If the gods disagree among themselves, where does justice lie? And can you truly know the will of the gods? #speaker:socrates #sticker:order_temple
        -> death_scene
    * * [Justice is a social contract] Justice is an agreement between people. Nothing more, just a social contract. #moral:rationalism:+1 #moral:order:+1
        ~ rationalism += 1
        ~ order += 1
        Socrates: If justice is merely human agreement, what happens when humans disagree? Does justice disappear with the contract? #speaker:socrates #sticker:rationalism_contract
        -> death_scene
    * * [Justice is inner righteousness] Justice is righteousness within the soul itself. Even if the world is chaotic, if I remain righteous within, I preserve justice. #moral:idealism:+2 #moral:rationalism:+1 #moral:order:+1
        ~ idealism += 2
        ~ rationalism += 1
        ~ order += 1
        Socrates: Now you speak wisdom. If justice lives in the soul, then we must ask: what happens to the soul when the body dies? #speaker:socrates #sticker:idealism_inner_light
        -> death_scene

=== death_scene ===
Night falls over the Agora. No human figures remain, only flickering torchlight illuminating his face. He look directly at you - His gaze seeming to pierce through flesh, touching the part you most want to hide. #speaker:socrates
Socrates: We've spoken of living, of justice. But the final question, which no one escapes: what do you think of death? #speaker:socrates
Socrates: Your soul - will it dissolve into dust, or is there something immortal? #speaker:socrates

* [The soul is just a joke] Soul? Ha! Just a joke for those afraid of death. I am flesh, blood, rotting bones. When I die, I become maggots and worms. Nothing more. The immortal soul is just opium for cowards. #moral:materialism:+2 #moral:pessimism:+2
    ~ materialism += 2
    ~ pessimism += 2
    Socrates: You say the soul is fiction. So I ask: why do you suffer when you betray yourself, if there's nothing beyond flesh? Why do you feel shame, if there's no one to judge? #speaker:socrates
    * * [Just reflex, no soul] That's just reflex. Like a beaten dog flinching. There's no soul here. #moral:materialism:+2 #moral:pessimism:+3 #moral:chaos:+1
        ~ materialism += 2
        ~ pessimism += 3
        ~ chaos += 1
        You fall into silence. Socrates shakes his head, your shadow dissolving into the night, leaving you alone in the void. #speaker:socrates
        Socrates: You have chosen the path of complete denial. You walk alone into darkness. #speaker:socrates #sticker:materialism_void
        -> story_end
    * * [I judge myself] Perhaps... I fear shame because I judge myself. But that doesn't prove a soul exists. #moral:rationalism:+1 #moral:materialism:+1
        ~ rationalism += 1
        ~ materialism += 1
        Socrates: Self-judgment without an eternal judge... interesting. You become both prisoner and warden of yourself. #speaker:socrates
        Socrates nod and accept your position. You walk away alone, becoming your own eternal judge and jury. #speaker:socrates #sticker:rationalism_judge
        -> story_end

* [I don't know for sure] I... don't know for sure. Maybe when I die there's nothing left. But that thought terrifies me. So I nurture a fragile hope that perhaps something waits for me beyond the darkness. #moral:empiricism:+1 #moral:pessimism:+1
    ~ empiricism += 1
    ~ pessimism += 1
    Socrates: You doubt, yet hope. I ask: if death is the end, why live righteously? If death is not the end and the soul must pay, how dare you live? #speaker:socrates
    * * [To not disgust myself] If death is the end, then living righteously is so I don't disgust myself while I still breathe. #moral:order:+2 #moral:rationalism:+1
        ~ order += 2
        ~ rationalism += 1
        Socrates: A noble reason. To live well for its own sake, regardless of reward or punishment. #speaker:socrates
        Socrates smiled sadly and accept your courage. You step into darkness, but your heart is lighter. #speaker:socrates #sticker:order_courage
        -> story_end
    * * [I'm stuck between two shores] If the soul must pay, then I'm terrified. But I still don't dare believe completely. I'm stuck between two shores. #moral:empiricism:+1 #moral:pessimism:+1
        ~ empiricism += 1
        ~ pessimism += 1
        Socrates: Some questions have no final answers. Perhaps living the question is enough. #speaker:socrates
        Socrates fall silent, leaving you lost between two worlds, without final answers. #speaker:socrates #sticker:empiricism_doubt
        -> story_end

* [The soul remains] Perhaps... the soul remains. Not because I have proof, but because if I don't believe, I'll go insane. I need to believe there's something beyond this rotting flesh. #moral:idealism:+1 #moral:rationalism:+1
    ~ idealism += 1
    ~ rationalism += 1
    Socrates: You believe without evidence. So is that faith a lifeline, or just new chains? Answer me. #speaker:socrates
    * * [It's a lifeline] It's a lifeline. Without it, I would have buried myself long ago. Even if it's an illusion, it still keeps me alive. #moral:idealism:+2 #moral:order:+1
        ~ idealism += 2
        ~ order += 1
        Socrates: Sometimes illusions serve truth better than facts. If faith keeps you walking the right path, perhaps its truth lies in its effects. #speaker:socrates
        Socrates sigh and smiled kindly. You leave the Agora carrying a fragile faith in your heart, knowing it might be false but choosing to believe anyway. #speaker:socrates #sticker:idealism_faith
        -> story_end
    * * [It's chains from fear] It's chains. I believe because I'm afraid. But can fear ever give birth to truth? #moral:rationalism:+2 #moral:pessimism:+1
        ~ rationalism += 2
        ~ pessimism += 1
        Socrates: Recognizing the chains is the first step to freedom. Fear-based belief may be false, but courage to question is always true. #speaker:socrates
        Socrates placed his hand on my shoulder and nod. You leave with your soul unresolved, but at least brave enough to face your fears. #speaker:socrates #sticker:rationalism_courage
        -> story_end
    * * [Righteousness is immortality] It doesn't matter if it's real or fake. As long as I maintain righteousness within myself, that's already immortality. #moral:idealism:+3 #moral:order:+2 #moral:rationalism:+1
        ~ idealism += 3
        ~ order += 2
        ~ rationalism += 1
        Socrates: Now you understand. The soul's immortality lies not in duration, but in virtue. You have found what many seek their whole lives. #speaker:socrates
        Socrates smile brilliantly, his eyes bright as stars. For the first time, you feel lightness, as if the darkness no longer devours you completely. #speaker:socrates #sticker:idealism_enlightenment
        -> story_end

=== story_end ===
-> DONE
*/
VAR idealism = 0
VAR materialism = 0  
VAR rationalism = 0
VAR empiricism = 0
VAR order = 0
VAR chaos = 0
VAR pessimism = 0

-> opening_scene

=== opening_scene ===
Agora (Quảng trường Hy Lạp) dần tan vào sương mờ. Đám đông tản đi, chỉ còn ta và ông ngồi đối diện nhau. Không gian vừa như mơ, vừa như đè nặng — mỗi lời nói như khắc sâu vào linh hồn. #speaker:socrates
Socrates: Người bạn u tối của ta, ta thấy trong mắt ngươi có những vết hối hận. Khó mà không hỏi — những đôi mắt ấy đã chứng kiến điều gì, đã sống vì điều gì? Hãy nói ta nghe... mục đích của sự tồn tại của ngươi là gì? #speaker:socrates

- [Không còn lựa chọn nào khác] Ta sống vì chẳng còn cách nào khác. Như con chó ghẻ bị xích, hít thở chỉ là bị kéo lê theo. Mục đích ư? Ta chỉ chờ sợi dây mục ra và đứt. #moral:pessimism:+2 #moral:materialism:+1 #moral:chaos:+1
  ~ pessimism += 2
  ~ materialism += 1
  ~ chaos += 1
  Socrates: Nếu sống chỉ là chờ sợi xích gãy, thì ngươi đâu khác gì thú bị nhốt. Nhưng ngươi không phải thú vật — hay ngươi đã tự thuyết phục mình rằng mình là thế? #speaker:socrates

  - - [Phải, ta là thú vật] Đúng vậy. Con người chỉ là loài thú biết nói, không hơn. #moral:materialism:+2 #moral:pessimism:+1
      ~ materialism += 2
      ~ pessimism += 1
      Socrates: Nếu ngươi chỉ là thú vật, sao ngươi lại đau khổ khi phản bội chính mình? Thú vật chẳng thấy xấu hổ vì bản tính của chúng. #speaker:socrates
      - - - [Chỉ là phản xạ, không có linh hồn] Đó chỉ là phản xạ thôi. Như con chó bị đánh mà co rúm lại. Không có linh hồn nào ở đây cả. #moral:materialism:+2 #moral:pessimism:+3 #moral:chaos:+1
            ~ materialism += 2
            ~ pessimism += 3
            ~ chaos += 1
            Socrates: Ngươi đã chọn con đường của sự phủ nhận tuyệt đối. Với ngươi, thế giới chẳng có ý nghĩa nào ngoài vật chất, và ngay cả nỗi đau cũng chỉ là phản ứng sinh học. #speaker:socrates #sticker:materialism_void
            -> story_end
      - - - [Ta tự phán xét chính mình] Có lẽ... ta sợ hổ thẹn vì ta tự phán xét chính mình. Nhưng điều đó chẳng chứng minh linh hồn tồn tại. #moral:rationalism:+1 #moral:materialism:+1
            ~ rationalism += 1
            ~ materialism += 1
            Socrates: Tự phán xét mà không có quan tòa vĩnh cửu... thú vị đấy. Ngươi vừa là tù nhân, vừa là cai ngục của chính mình. #speaker:socrates #sticker:rationalism_mirror
            -> story_end
  - - [Ta muốn tin mình khác biệt] Không... ta muốn tin mình khác biệt. Nhưng đức tin đó đã rách nát đến mức ta chẳng dám soi gương nữa. #moral:pessimism:+1 #moral:empiricism:+1
      ~ pessimism += 1
      ~ empiricism += 1
      Socrates: Nghi ngờ bản thân có thể hủy hoại con người, nhưng cũng có thể thanh lọc nó. Hãy nói ta nghe — nếu ngươi dám nhìn vào gương, ngươi sẽ thấy gì? #speaker:socrates
      -> justice_scene

- [Ta sống theo thói quen] Có lẽ ta sống chỉ vì thói quen. Ăn, ngủ, tỉnh dậy, viết vài dòng, rồi lại tiếp tục. Ta chẳng biết đó gọi là “mục đích” hay chỉ là cỗ máy hỏng còn hoạt động. #moral:pessimism:+1 #moral:empiricism:+1
  ~ pessimism += 1
  ~ empiricism += 1
  Socrates: Thói quen có thể cứu một con người, nhưng cũng có thể giam hãm họ. Ngươi nghĩ sống như một cỗ máy có giá trị hơn hòn đá không? #speaker:socrates

  - - [Có, ta vẫn để lại dấu vết] Có. Dù là cỗ máy hỏng, ít nhất ta vẫn còn chuyển động, vẫn để lại vài dấu vết. #moral:idealism:+1 #moral:order:+1
      ~ idealism += 1
      ~ order += 1
      Socrates: Những hành động nhỏ có thể xây nên điều vĩ đại. Nhưng nói ta nghe, dấu vết của ngươi đang dẫn đến đâu? Hay chỉ là những vết xước ngẫu nhiên trên cát? #speaker:socrates #sticker:order_path
      -> justice_scene
  - - [Không, ta như hòn đá] Không. Ta chẳng khác gì hòn đá bị sóng vùi dập — chỉ khác là ta biết mình vô dụng. #moral:pessimism:+2 #moral:materialism:+1
      ~ pessimism += 2
      ~ materialism += 1
      Socrates: Biết rõ tình trạng của mình là bước đầu để thay đổi. Nhưng ngươi có thật sự muốn thay đổi, hay thấy an toàn trong tuyệt vọng? #speaker:socrates #sticker:pessimism_stone
      -> justice_scene

- [Để vá lỗ hổng trong tim] Ta không biết. Nhưng đôi khi... ta đọc, ta viết, ta thấy những mảnh triết lý vụn vỡ — và ta nghĩ: nếu may mắn, chúng có thể vá lại lỗ hổng trong tim ta. Có lẽ, đó là lý do duy nhất. #moral:idealism:+1 #moral:rationalism:+1
  ~ idealism += 1
  ~ rationalism += 1
  Socrates: Vậy là ngươi tìm đến tri thức để chữa lành trái tim? Cẩn thận nhé: tri thức cũng có thể là con dao cắt sâu hơn. Ta hỏi ngươi: ngươi học để hiểu, hay học để quên nỗi đau? #speaker:socrates
  - - [Ta học để quên] Ta học để quên. Sách như rượu — càng uống càng say, càng xa rời hiện thực. #moral:pessimism:+1 #moral:chaos:+1
      ~ pessimism += 1
      ~ chaos += 1
      Socrates: Trốn chạy hiện thực bằng tri thức chẳng khác gì uống nước biển khi khát. Ban đầu tưởng đã giải thoát, nhưng sẽ tự hủy chính mình. Ngươi đang chạy trốn khỏi điều gì? #speaker:socrates #sticker:chaos_wine
      -> justice_scene
  - - [Ta học để hiểu] Ta học để hiểu. Dù sự thật tàn nhẫn, ít ra nó thật hơn những rác rưởi trong đầu ta. #moral:rationalism:+2 #moral:idealism:+1
      ~ rationalism += 2
      ~ idealism += 1
      Socrates: Sự thật có thể khiến người ta đau, nhưng cũng có thể giải thoát họ. Ngươi có sẵn sàng đi đến tận cùng nơi nó dẫn không? #speaker:socrates #sticker:rationalism_light
      -> justice_scene

=== justice_scene ===
Ánh hoàng hôn nghiêng trên những phiến đá vỡ của Agora. Chúng ta bước chậm qua khu chợ đang dần vắng. #speaker:socrates
Socrates: Ngươi đã nói về sự sống — kẻ sống như thú, kẻ sống như máy, kẻ vá mình bằng tri thức. Nhưng ta hỏi: nếu đời là một trò chơi, luật của nó là gì? #speaker:socrates
Socrates: Con người nên sống theo công lý và đức hạnh, hay nên bỏ qua chúng để sống theo luật của kẻ mạnh? #speaker:socrates

- [Công lý là món đồ chơi của kẻ mạnh] Công lý ư? Đức hạnh ư? Ha! Chúng chỉ là món đồ của kẻ có quyền. Công lý của vua khác công lý của nô lệ. Đức hạnh của kẻ giàu khác đức hạnh của kẻ đói. Ta nghèo, ta thối rữa, ta chẳng cần đức hạnh. #moral:pessimism:+2 #moral:materialism:+1 #moral:chaos:+1
  ~ pessimism += 2
  ~ materialism += 1
  ~ chaos += 1
  Socrates: Ngươi nói công lý là công cụ của kẻ mạnh. Vậy khi kẻ mạnh đổi thay, công lý có đổi thay theo không? Hay nó chỉ là cái tên trống rỗng dùng để tô son cho bạo lực? #speaker:socrates

  - - [Công lý chỉ là lớp sơn trên xiềng xích] Chính xác. Công lý chỉ là lớp sơn trên xiềng xích. Đừng chơi chữ với ta. #moral:materialism:+2 #moral:chaos:+1
      ~ materialism += 2
      ~ chaos += 1
      Socrates: Nếu công lý chỉ là bạo lực được ngụy trang, vậy tại sao ngay cả bạo chúa cũng cần biện minh cho hành động của mình? Sao họ không đơn giản ôm lấy quyền lực trần trụi? #speaker:socrates #sticker:chaos_chains
      -> death_scene
  - - [Công lý tồn tại nhưng ghét ta] Có lẽ... công lý thật sự tồn tại, nhưng nó chưa bao giờ đứng về phía ta. Nó ghét ta. #moral:pessimism:+1 #moral:idealism:+1
      ~ pessimism += 1
      ~ idealism += 1
      Socrates: Công lý không ghét cũng chẳng yêu — nó chỉ tồn tại. Vấn đề không phải là nó đứng về phía ai, mà là ngươi có sống phù hợp với nó hay không. #speaker:socrates #sticker:idealism_scales
      -> death_scene

- [Ta muốn tin vào công lý] Ta muốn tin vào công lý... nhưng mỗi lần làm điều “đúng đắn”, đời lại tát ta một cái. Ta sống tốt, ta chịu khổ; kẻ ác lại sung sướng. Thế ngươi bảo ta tin vào công lý kiểu gì? #moral:pessimism:+1 #moral:empiricism:+1
  ~ pessimism += 1
  ~ empiricism += 1
  Socrates: Ngươi nói kẻ ác thì giàu, người tốt thì khổ. Nhưng thử nhìn kỹ hơn — vàng có thực sự khiến họ hạnh phúc không? Hay họ chỉ đang đeo mặt nạ, cười bên ngoài trong khi thối rữa bên trong? #speaker:socrates

  - - [Ta không tin] Ta không tin. Ta thấy họ ăn ngon, ngủ yên, sống vui. Còn ta vật vã như con chó hấp hối. Đừng nói họ khổ hơn ta. #moral:pessimism:+1 #moral:empiricism:+1
      ~ pessimism += 1
      ~ empiricism += 1
      Socrates: Niềm vui nhìn thấy và sự thanh thản thật sự là hai điều khác nhau. Nhưng hãy nói ta nghe, hạnh phúc thật sự trông như thế nào với ngươi? #speaker:socrates #sticker:empiricism_mask
      -> death_scene
  - - [Nụ cười của họ rỗng tuếch] Có lẽ ngươi đúng. Có lẽ nụ cười của họ rỗng tuếch. Nhưng biết vậy chẳng khiến ta đau ít hơn. #moral:rationalism:+1 #moral:pessimism:+1
      ~ rationalism += 1
      ~ pessimism += 1
      Socrates: Hiểu công lý không phải để bớt khổ, mà để sống thật với linh hồn mình — dù ngoài kia đầy đau đớn. #speaker:socrates #sticker:rationalism_soul
      -> death_scene

- [Công lý hẳn phải tồn tại ở đâu đó] Có lẽ... ta vẫn muốn tin rằng công lý tồn tại. Nếu không, thế giới này chỉ là hố rác khổng lồ. Dù ta không thấy nó, ta vẫn bám lấy ý niệm rằng đâu đó, công lý có thật. Nếu không, sống còn nghĩa gì? #moral:idealism:+2 #moral:rationalism:+1
  ~ idealism += 2
  ~ rationalism += 1
  Socrates: Ngươi bám lấy công lý như kẻ chết đuối bám vào cành cây. Nhưng nhớ rằng — càng bám vào ảo tưởng, càng dễ chìm nhanh hơn. Vậy ta hỏi: công lý là gì? #speaker:socrates
  Socrates: Nó là ý muốn của thần linh, của con người, hay của linh hồn trong chính ngươi? #speaker:socrates
  - - [Công lý là luật của các vị thần] Công lý là luật của thần linh. Chỉ họ mới có quyền định ra nó. #moral:idealism:+2 #moral:order:+1
      ~ idealism += 2
      ~ order += 1
      Socrates: Nếu các vị thần bất đồng với nhau, vậy công lý nằm ở đâu? Và liệu ngươi có thật sự hiểu được ý chí của họ không? #speaker:socrates #sticker:order_temple
      -> death_scene
  - - [Công lý là khế ước xã hội] Công lý chỉ là thỏa thuận giữa người với người, không hơn. Một khế ước xã hội. #moral:rationalism:+1 #moral:order:+1
      ~ rationalism += 1
      ~ order += 1
      Socrates: Nếu công lý chỉ là thỏa thuận của con người, thì khi con người bất đồng, công lý cũng biến mất sao? #speaker:socrates #sticker:rationalism_contract
      -> death_scene
  - - [Công lý là chính nghĩa trong tâm hồn] Công lý là chính nghĩa nằm trong linh hồn. Dù thế giới hỗn loạn, chỉ cần ta giữ được chính nghĩa trong mình — ta vẫn gìn giữ được công lý. #moral:idealism:+2 #moral:rationalism:+1 #moral:order:+1
      ~ idealism += 2
      ~ rationalism += 1
      ~ order += 1
      Socrates: Giờ thì ngươi đã nói điều khôn ngoan. Nếu công lý sống trong linh hồn, vậy linh hồn sẽ ra sao khi thân xác chết đi? #speaker:socrates #sticker:idealism_inner_light
      -> death_scene

=== death_scene ===
Đêm buông xuống Agora. Không còn bóng người, chỉ còn ánh đuốc chập chờn soi gương mặt ông. Ông nhìn thẳng vào ngươi — ánh nhìn xuyên qua xác thịt, chạm đến phần sâu nhất mà ngươi cố giấu. #speaker:socrates
Socrates: Ta và ngươi đã nói về sống, về công lý. Nhưng câu hỏi cuối cùng — không ai tránh khỏi: ngươi nghĩ gì về cái chết? #speaker:socrates
Socrates: Linh hồn ngươi — sẽ tan thành bụi, hay vẫn còn điều gì bất tử? #speaker:socrates

- [Linh hồn chỉ là trò đùa] Linh hồn ư? Ha! Trò đùa cho kẻ sợ chết. Ta là xác thịt, là máu, là xương mục. Khi ta chết, ta thành giòi bọ. Không hơn. Linh hồn bất tử chỉ là thuốc phiện cho kẻ hèn nhát. #moral:materialism:+2 #moral:pessimism:+2
  ~ materialism += 2
  ~ pessimism += 2
  Socrates: Ngươi nói linh hồn là hư cấu. Vậy ta hỏi: nếu chỉ có xác thịt, sao ngươi lại đau đớn khi phản bội chính mình? Sao ngươi lại thấy xấu hổ, nếu chẳng có ai để phán xét? #speaker:socrates

  - - [Chỉ là phản xạ, không có linh hồn] Đó chỉ là phản xạ thôi. Như con chó bị đánh mà co rúm lại. Không có linh hồn nào ở đây cả. #moral:materialism:+2 #moral:pessimism:+3 #moral:chaos:+1
      ~ materialism += 2
      ~ pessimism += 3
      ~ chaos += 1
      Ngươi im lặng. Socrates khẽ lắc đầu — bóng ngươi tan dần vào đêm, chỉ còn lại khoảng trống cô độc. #speaker:socrates
      Socrates: Ngươi đã chọn con đường phủ nhận hoàn toàn. Ngươi bước một mình vào bóng tối. #speaker:socrates #sticker:materialism_void
      -> story_end
  - - [Ta tự phán xét mình] Có lẽ... ta sợ hổ thẹn vì chính ta tự phán xét mình. Nhưng điều đó chẳng chứng minh linh hồn tồn tại. #moral:rationalism:+1 #moral:materialism:+1
      ~ rationalism += 1
      ~ materialism += 1
      Socrates: Tự phán xét mà không có vị thẩm phán vĩnh cửu... thú vị đấy. Ngươi là tù nhân và là quan tòa của chính mình. #speaker:socrates
      Socrates khẽ gật đầu, chấp nhận câu trả lời của ngươi. Ngươi rời đi một mình, trở thành quan tòa vĩnh cửu của chính bản thân. #speaker:socrates #sticker:rationalism_judge
      -> story_end

- [Ta không chắc chắn] Ta... không biết chắc. Có thể khi chết đi, chẳng còn gì cả. Nhưng ý nghĩ đó khiến ta sợ hãi. Vậy nên ta nuôi chút hy vọng mong manh — rằng biết đâu, vẫn có gì đó chờ ta bên kia bóng tối. #moral:empiricism:+1 #moral:pessimism:+1
  ~ empiricism += 1
  ~ pessimism += 1
  Socrates: Ngươi hoài nghi, nhưng vẫn hy vọng. Ta hỏi: nếu cái chết là hết, sao phải sống lương thiện? Còn nếu linh hồn phải trả giá, sao dám sống cẩu thả? #speaker:socrates

  - - [Để không ghê tởm chính mình] Nếu cái chết là hết, thì ta sống lương thiện chỉ để không thấy ghê tởm bản thân khi còn thở. #moral:order:+2 #moral:rationalism:+1
      ~ order += 2
      ~ rationalism += 1
      Socrates: Một lý do cao quý. Sống đúng đắn vì chính bản thân mình, không vì phần thưởng hay trừng phạt. #speaker:socrates
      Socrates mỉm cười buồn, chấp nhận lòng can đảm của ngươi. Ngươi bước vào bóng tối, nhưng trái tim nhẹ đi. #speaker:socrates #sticker:order_courage
      -> story_end
  - - [Mắc kẹt giữa hai bờ] Nếu linh hồn phải trả giá, ta sợ hãi. Nhưng ta vẫn chẳng dám tin hoàn toàn. Ta mắc kẹt giữa hai bờ. #moral:empiricism:+1 #moral:pessimism:+1
      ~ empiricism += 1
      ~ pessimism += 1
      Socrates: Có những câu hỏi không có đáp án cuối cùng. Có lẽ, chỉ cần sống cùng câu hỏi đã là đủ. #speaker:socrates
      Socrates im lặng, để ngươi lạc giữa hai thế giới — chẳng có kết thúc rõ ràng. #speaker:socrates #sticker:empiricism_doubt
      -> story_end

- [Linh hồn còn mãi] Có lẽ... linh hồn vẫn còn. Không phải vì ta có bằng chứng, mà vì nếu không tin, ta sẽ phát điên mất. Ta cần tin rằng có gì đó vượt lên trên xác thịt đang mục rữa này. #moral:idealism:+1 #moral:rationalism:+1
  ~ idealism += 1
  ~ rationalism += 1
  Socrates: Ngươi tin mà không có chứng cứ. Vậy niềm tin đó là dây cứu sinh, hay là xiềng xích mới? #speaker:socrates
  - - [Là dây cứu sinh] Là dây cứu sinh. Nếu không có nó, ta đã tự chôn mình từ lâu. Dù là ảo tưởng, nó vẫn giữ ta sống. #moral:idealism:+2 #moral:order:+1
      ~ idealism += 2
      ~ order += 1
      Socrates: Đôi khi ảo tưởng phục vụ cho sự thật tốt hơn sự kiện. Nếu đức tin giúp ngươi bước đi đúng đường, thì có lẽ sự thật nằm trong chính tác động của nó. #speaker:socrates
      Socrates thở dài, mỉm cười hiền hậu. Ngươi rời Agora, mang theo đức tin mong manh — biết rằng nó có thể là giả, nhưng vẫn chọn tin. #speaker:socrates #sticker:idealism_faith
      -> story_end
  - - [Là xiềng xích của sợ hãi] Là xiềng xích. Ta tin vì ta sợ. Nhưng liệu nỗi sợ có thể sinh ra chân lý không? #moral:rationalism:+2 #moral:pessimism:+1
      ~ rationalism += 2
      ~ pessimism += 1
      Socrates: Nhận ra xiềng xích là bước đầu của tự do. Niềm tin sinh từ sợ hãi có thể sai, nhưng dũng khí để hoài nghi luôn là thật. #speaker:socrates
      Socrates đặt tay lên vai ngươi, gật đầu. Ngươi rời đi với linh hồn chưa được giải thoát, nhưng ít ra đủ can đảm để đối diện nỗi sợ. #speaker:socrates #sticker:rationalism_courage
      -> story_end
  - - [Chính nghĩa là sự bất tử] Dù linh hồn có thật hay không, chỉ cần ta giữ chính nghĩa trong tim — đó đã là sự bất tử. #moral:idealism:+3 #moral:order:+2 #moral:rationalism:+1
      ~ idealism += 3
      ~ order += 2
      ~ rationalism += 1
      Socrates: Giờ thì ngươi đã hiểu. Sự bất tử của linh hồn không nằm ở thời gian, mà ở đức hạnh. Ngươi đã tìm thấy điều mà nhiều người đi cả đời vẫn chưa chạm tới. #speaker:socrates
      Socrates mỉm cười rạng rỡ, ánh mắt ông sáng như sao. Lần đầu tiên, ngươi thấy lòng nhẹ nhõm — như thể bóng tối không còn nuốt chửng ngươi nữa. #speaker:socrates #sticker:idealism_enlightenment
      -> story_end

=== story_end ===
-> DONE