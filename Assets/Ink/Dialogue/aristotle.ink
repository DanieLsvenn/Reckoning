VAR rationalism = 0
VAR empiricism = 0

-> aristotle_intro

=== aristotle_intro ===
Aristotle: Welcome, traveler, to the Lyceum. #speaker:aristotle
Aristotle: I have spent my life walking the gardens of thought, asking: what is the foundation of knowledge? #speaker:aristotle
Aristotle: Tell me—do you place your trust in the senses, which reveal the world, or in the mind, which interprets it? #speaker:aristotle

* The senses—observation first, then reason. #moral:empiricism:+1
    ~ empiricism += 1
    Aristotle: Indeed! Nothing enters the mind without first passing through the senses. #speaker:aristotle #sticker:empiricism_eye
    Aristotle: Yet tell me—are the senses always trustworthy, or do they sometimes mislead us? #speaker:aristotle
    * * They are trustworthy. #moral:empiricism:+1
        ~ empiricism += 1
        Aristotle: Then you honor the natural sciences, grounding knowledge in what is seen and touched. #speaker:aristotle
        Aristotle: You will find truth in the cataloging of plants, the charting of stars, the study of animals. #speaker:aristotle
        -> story_end
    * * They can deceive us. #moral:rationalism:+1
        ~ rationalism += 1
        Aristotle: Ah, then reason must refine what the senses give, as the sculptor refines the marble. #speaker:aristotle
        Aristotle: We must weigh appearances carefully, separating truth from illusion. #speaker:aristotle
        -> story_end

* Pure reason—the mind shapes reality. #moral:rationalism:+1
    ~ rationalism += 1
    Aristotle: Then you walk the path of logic and deduction, seeking principles that underlie the chaos of experience. #speaker:aristotle #sticker:rationalism_brain
    Aristotle: But tell me, can reason stand without the senses, or must it always be rooted in the world we perceive? #speaker:aristotle
    * * Reason alone is enough. #moral:rationalism:+1
        ~ rationalism += 1
        Aristotle: Then you are like the mathematician, who builds entire worlds from axioms and proofs. #speaker:aristotle
        Aristotle: But beware—reason cut off from reality may soar too high, and lose sight of the earth. #speaker:aristotle
        -> story_end
    * * Reason must begin from the senses. #moral:empiricism:+1 #moral:rationalism:+1
        ~ empiricism += 1
        ~ rationalism += 1
        Aristotle: Ah, the true middle path! The senses provide the raw material, and reason shapes it into knowledge. #speaker:aristotle
        Aristotle: Thus does wisdom emerge—not from one alone, but from their union. #speaker:aristotle
        -> story_end

=== story_end ===
-> DONE
