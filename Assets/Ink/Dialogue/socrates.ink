VAR rationalism = 0
VAR order = 0
VAR chaos = 0
VAR pessimism = 0

-> socrates_intro

=== socrates_intro ===
Socrates: Ah, another soul seeking wisdom! Welcome to the agora, where minds meet and clash like bronze upon bronze. #speaker:socrates
Socrates: I have spent my life as Athens' gadfly, stinging the lazy horse of convention into wakefulness. #speaker:socrates
Socrates: Now tell me, dear friend, what do you believe makes for a good life? #speaker:socrates
* To question everything. #moral:rationalism:+1 #moral:chaos:+1
    ~ rationalism += 1
    ~ chaos += 1
    Socrates: Excellent! Only by doubt do we grow, as a sword grows sharp upon the whetstone. #speaker:socrates #sticker:rationalism_question
    Socrates: Yet I wonder—do you see how questioning can become its own trap? #speaker:socrates
    Socrates: For if we doubt all things, must we not also doubt our doubting? #speaker:socrates
    Socrates: Tell me, do you question even your own doubts? #speaker:socrates
    * * Yes, I must doubt even doubt itself. #moral:rationalism:+1
        ~ rationalism += 1
        Socrates: A true philosopher! To doubt doubt is to search for certainty beneath the shifting sands. #speaker:socrates
        Socrates: Perhaps you understand that some knowledge transcends mere opinion—that which cannot be doubted even by the most relentless skeptic. #speaker:socrates
        Socrates: And perhaps, in that search, you will discover what cannot be doubted. #speaker:socrates
        -> story_end
    * * No, doubt is my guiding light. #moral:chaos:+1
        ~ chaos += 1
        Socrates: Then beware, young wanderer! For endless doubt may lead to despair rather than wisdom. #speaker:socrates
        Socrates: I have seen many souls lost in the labyrinth of perpetual questioning, never finding the thread that leads them home. #speaker:socrates
        Socrates: Still, you are brave to walk a path with no firm ground beneath your feet. #speaker:socrates
        -> story_end

* To obey tradition. #moral:order:+1
    ~ order += 1
    Socrates: Ah, tradition! The wisdom of our fathers, passed down like precious gold through generations. #speaker:socrates #sticker:order_chain
    Socrates: Yet I must ask—does tradition serve truth, or does truth sometimes require us to break tradition? #speaker:socrates
    Socrates: Consider the laws of Athens that condemned me to drink hemlock—were they just because they were traditional? #speaker:socrates
    Socrates: Tell me, do you obey tradition because it is good, or because it is old? #speaker:socrates
    * * Because it is good. #moral:order:+1
        ~ order += 1
        Socrates: Then you are wiser than you know! For if tradition is good, you must have some standard of goodness by which you judge it. #speaker:socrates
        Socrates: This means you must measure goodness for yourself, not merely inherit it like a family heirloom. #speaker:socrates
        Socrates: Perhaps you are more independent than you think, more willing to examine life than many who call themselves philosophers. #speaker:socrates
        -> story_end
    * * Because it is old. #moral:order:+1 #moral:pessimism:+1
        ~ order += 1
        ~ pessimism += 1
        Socrates: Ah! Then you fear the chaos of change more than you love the good—I understand this fear well. #speaker:socrates
        Socrates: Change is the one constant in this world, as Heraclitus taught us—we cannot step into the same river twice. #speaker:socrates
        Socrates: Yet the world changes whether we will it or not, and perhaps wisdom lies in learning to dance with change rather than flee from it. #speaker:socrates
        -> story_end

* Life is suffering. #moral:pessimism:+1
    ~ pessimism += 1
    Socrates: A dark truth, yet perhaps a profound one—the Buddha himself taught this, though in distant lands. #speaker:socrates #sticker:pessimism_cloud
    Socrates: I have felt suffering's sting: the loss of friends, the mockery of my fellow citizens, the chill of approaching death. #speaker:socrates
    Socrates: Yet I wonder—is suffering our teacher or our destroyer? Does it purify the soul like fire purifies gold? #speaker:socrates
    Socrates: But tell me, does suffering teach us, or only break us? #speaker:socrates
    * * It teaches us. #moral:rationalism:+1
        ~ rationalism += 1
        Socrates: Then you have found meaning even in pain—that is no small achievement, worthy of the greatest heroes. #speaker:socrates
        Socrates: Perhaps suffering is the price we pay for deeper understanding, the tuition fee for wisdom's harsh school. #speaker:socrates
        Socrates: Perhaps a good life is not one without suffering, but one where we learn to suffer well. #speaker:socrates
        -> story_end
    * * It breaks us. #moral:pessimism:+1
        ~ pessimism += 1
        Socrates: A tragic view, yet honest—sometimes the most honest vision is the darkest one. #speaker:socrates
        Socrates: If a good life is impossible, then perhaps knowing this impossibility is itself a form of wisdom. #speaker:socrates
        Socrates: Still, if life is tragic, perhaps we must laugh at the tragedy—for what else can mortals do against the gods? #speaker:socrates
        -> story_end

* To seek pleasure and avoid pain. #moral:chaos:+1
    ~ chaos += 1
    Socrates: Ah, the path of sweet Hedon! Many young Athenians follow this road, drawn like moths to honey. #speaker:socrates #sticker:chaos_mask
    Socrates: Yet I wonder—if we live only for pleasure, do we become slaves to our appetites? #speaker:socrates
    Socrates: I have seen wealthy men who could afford any pleasure grow miserable, and poor men who savored simple joys remain content. #speaker:socrates
    Socrates: Tell me, do you believe all pleasures are equal, or might some be higher than others? #speaker:socrates
    * * Yes, all pleasure is good. #moral:chaos:+1
        ~ chaos += 1
        Socrates: Then beware of false pleasures that promise sweetness but deliver bitterness—like wine that tastes divine but brings a terrible morning. #speaker:socrates
        Socrates: For even a life devoted to pleasure must choose wisely among pleasures, lest it become a life of misery. #speaker:socrates
        Socrates: A wise person must choose pleasures carefully, as a gardener chooses which flowers to cultivate. #speaker:socrates
        -> story_end
    * * No, some pleasures are higher. #moral:rationalism:+1
        ~ rationalism += 1
        Socrates: Ah! Then you are already on the path to virtue, for you weigh pleasure with the scales of reason. #speaker:socrates
        Socrates: If some pleasures are higher, then you must use your mind to distinguish gold from fool's gold. #speaker:socrates
        Socrates: Perhaps this discrimination between pleasures is the beginning of wisdom itself. #speaker:socrates
        -> story_end

* To live justly, regardless of consequence. #moral:order:+1 #moral:rationalism:+1
    ~ order += 1
    ~ rationalism += 1
    Socrates: Noble words! Justice has always been dear to my heart, though it led me to this prison cell. #speaker:socrates #sticker:order_balance
    Socrates: Yet justice is a word spoken by many but understood by few—what does it truly mean? #speaker:socrates
    Socrates: I have spent my life searching for its definition, yet it remains as elusive as morning mist. #speaker:socrates
    Socrates: Tell me—is justice to obey the laws of men, or to follow a higher truth that dwells in the heavens? #speaker:socrates
    * * To obey the laws. #moral:order:+1
        ~ order += 1
        Socrates: A difficult path you choose! Then even if the law is unjust, even if it condemns innocence, you would obey? #speaker:socrates
        Socrates: That is a heavy burden to bear—heavier than the chains they bind prisoners with. #speaker:socrates
        Socrates: I wonder if I could do the same, or if my love of truth would overrule my respect for law. #speaker:socrates
        -> story_end
    * * To follow a higher truth. #moral:rationalism:+1 #moral:chaos:+1
        ~ rationalism += 1
        ~ chaos += 1
        Socrates: Then you are like me, a gadfly to the sleeping city! Ready to sting the horse of convention into wakefulness. #speaker:socrates
        Socrates: Yet beware, my friend—this road is lonely and dangerous, leading often to exile or worse. #speaker:socrates
        Socrates: Still, perhaps it is better to suffer for truth than to live comfortably in falsehood. #speaker:socrates
        -> story_end

=== story_end ===
-> DONE