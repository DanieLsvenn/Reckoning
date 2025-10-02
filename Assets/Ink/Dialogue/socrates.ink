VAR idealism = 0
VAR materialism = 0  
VAR rationalism = 0
VAR empiricism = 0
VAR order = 0
VAR chaos = 0
VAR pessimism = 0

-> opening_scene

=== opening_scene ===
The Agora fades into mist. The crowd disperses, leaving only us sitting face to face. The space feels both dreamlike and heavy, each word anchoring itself to the soul. #speaker:socrates
Socrates: Dark friend, I see you sitting like a rotting stone. So tell me, what do you live for? What is the purpose of your existence? #speaker:socrates

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