
% Category 1: Neurodevelopmental Disorders

% Subcategory 2: Communication Disorders

% Section 2.1: Language Disorder

% Four basic conditions must be met to diagnose a language disorder.

diagnosis(X, 'Language Disorder') :- condition(X, compProdDeficiency), condition(X, langAbilitiesBelowAge), condition(X, onsetdevelopmentalperiod), not condition(X, sensoryImpairment).

condition(X, compProdDeficiency) :- condition(X, limitedVocab), condition(X, limitedSentenceStruct), condition(X, impairDiscourse).

condition(X, sensoryImpairment) :- condition(X, hearingLoss), condition(X, motorDysfunction).

% Condition keys for this section
% The condition keys correspond to strings that represent what the actual condition is. 

conditionKey(compProdDeficiency, 'Difficulty comprehending and producing language').
conditionKey(hearingLoss, 'Hearing loss is present').
conditionKey(langAbilitiesBelowAge, 'Language abilities are significantly below those of age level').
conditionKey(sensoryImpairment, 'Individual has other form of sensory impairment that impacts language abilities').
conditionKey(limitedVocab, 'Reduced vocabulary').
conditionKey(limitedSentenceStruct, 'Limited sentence structure').
conditionKey(impairDiscourse, 'Impairments in discourse').
conditionKey(motorDysfunction, 'Motor dysfunction').


% Section 2.2: Speech Sound Disorder

diagnosis(X, 'Speech Sound Disorder') :- condition(X, difficultySoundProd), condition(X, limitEffectiveComm), condition(X, onsetdevelopmentalperiod), not condition(X, acquiredConditions).

condition(X, acquiredConditions) :- condition(X, cerebralPalsy).
condition(X, acquiredConditions) :- condition(X, cleftPalate).
condition(X, acquiredConditions) :- condition(X, hearingLoss).
condition(X, acquiredConditions) :- condition(X, brainInjury).

% Condition Keys 

conditionKey(difficultySoundProd, 'Persistent difficulty with speech sound production that intereferes with speech intelligibility').
conditionKey(limitEffectiveComm, 'Disturbance causes limitations in effective communication').
conditionKey(cerebralPalsy, 'Cerebral Palsy').
conditionKey(cleftPalate, 'Cleft Palate').
conditionKey(brainInjury, 'Brain injury').

% Section 2.3: Childhood-Onset Fluency Disorder (Stuttering)

diagnosis(X, 'Childhood-onset Fluency Disorder') :- condition(X, disturbanceCauseAnxiety), condition(X, onsetdevelopmentalperiod), condition(X, notAttributableOther).

condition(X, disturbanceNormFluency):- condition(X, soundSyllableRep), condition(X, soundProlong), condition(X, brokenWords), condition(X, blocking), condition(X, circumlocutions), condition(X, excessPhysicalTension), condition(X, monoRep).

condition(X, notAttributableOther) :- not condition(X, speechMotorDeficit), not condition(X, sensoryDeficit), not condition(X, neurologicalInsult). 

% Condition keys for this section

conditionKey(disturbanceNormFluency, 'Disturbances in the normal fluency and time patterning of speech').

conditionKey(disturbanceCauseAnxiety, 'The disturbance causes anxiety about speaking or limitations in effective communication,
social participation, or academic or occupational performance').

conditionKey(soundSyllableRep, 'Sound and syllable repetitions').
conditionKey(soundProlong, 'Sound prolongations of consonants as well as vowels').
conditionKey(brokenWords, 'Broken words').
conditionKey(blocking, 'Audible or silent blocking').
conditionKey(circumlocutions, 'Circumlocutions').
conditionKey(excessPhysicalTension, 'Words produced with an excess of physical tension').
conditionKey(monoRep, 'Mono-syllabic whole-word repetitions').


% Section 2.4 Social Communication Disorder

diagnosis(X, 'Social Communication Disorder') :- condition(X, difficultySocialUse), condition(X, limitEffectiveComm), condition(X, onsetdevelopmentalperiod), condition(X, notAttributableOther).

condition(X, difficultySocialUse) :- condition(X, deficitCommSocial), condition(X, impairAbilityChange), condition(X, difficultyRulesConverse), condition(X, difficultyNotExplicitStated).

conditionKey(deficitCommSocial, 'Deficits in using communication for social purposes, such as greeting and sharing
information, in a manner that is appropriate for the social context'). 
conditionKey(impairAbilityChange, 'Impairment of the ability to change communication to match context or the needs of
the listener').
conditionKey(difficultyRulesConverse, 'Difficulties following rules for conversation and storytelling, such as taking turns in
conversation, rephrasing when misunderstood, and knowing how to use verbal and
nonverbal signals to regulate interaction').
conditionKey(difficultyNotExplicitStated, 'Difficulties understanding what is not explicitly stated').

conditionKey(limitEffectiveComm, 'The deficits result in functional limitations in effective communication, social participation,
social relationships, academic achievement, or occupational performance').

% condition(X, notAttributableOther) :- not iddBase(X), not diagnosis(X, 'Global Developmental Decay'), not diagnosis(X, 'Autism Spectrum Disorder').


% Section 2.4: Unspecified Communication Disorder

% If we fail to prove that an individual has a specified communication disorder
% but the individual still has communication difficulty, we diagnosis Unspecified
% Communication Disorder. 

condition(X, 'Specified Communication Disorder') :- diagnosis(X, 'Childhood-onset Fluency Disorder').
condition(X, 'Specified Communication Disorder') :- diagnosis(X, 'Speech Sound Disorder').
condition(X, 'Specified Communication Disorder') :- diagnosis(X, 'Childhood-onset Fluency Disorder').
condition(X, 'Specified Communication Disorder') :- diagnosis(X, 'Social Communication Disorder').

diagnosis(X, 'Unspecified Communication Disorder') :- condition(X, 'Communication Difficulty'), not condition(X, 'Specified Communication Disorder').

% Section 2.5: Autism Spectrum Disorder

diagnosis(X, 'Autism Spectrum Disorder') :- condition(X, deficitCommSocial), condition(X, repetitivePatternBehavior), condition(X, presentEarlyDevelopmentalPeriod).

% Condition Keys

conditionKey(deficitCommSocial, 'Persistent deficits in social communication and social interaction').

conditionKey(repetitivePatternBehavior, 'Restricted, repetitive patterns of behavior, interests, or activities').

conditionKey(presentEarlyDevelopmentalPeriod, 'Onset of symptoms during early developmental period').

% Section 2.6: Attention Deficit Hyperactivity Disorder (ADHD)

diagnosis(X, 'Attention-Deficit Hyperactivity Disorder') :- condition(X, innattention), condition(X, hyperactivityImpulsivity), condition(X, symptomsInterfere).

% At least six symptoms of innattention must be present for ADHD

% Checks to see if the patient has at least six symptoms from the list for innattention.

condition(X, innattention) :- numCharacteristicSymptoms(X, [failsCloseAttentionDetails, difficultySustainAttention, doesNotList, doesNotFollowThrough, difficultyOrganizing, avoidsTaskMentalEffort, losesThingsNecessary, distractedStimuli, forgetfulDaily], Y), Y >= 6.

hasSomeConditions(X, innatention) :- numCharacteristicSymptoms(X, [failsCloseAttentionDetails, difficultySustainAttention, doesNotList, doesNotFollowThrough, difficultyOrganizing, avoidsTaskMentalEffort, losesThingsNecessary, distractedStimuli, forgetfulDaily], Y), Y >= 1.

conditionKey(failsCloseAttentionDetails, 'Often fails to give close attention to details or makes careless mistakes in
schoolwork, at work, or during other activities').
conditionKey(difficultySustainAttention, 'Often has difficulty sustaining attention in tasks or play activities').
conditionKey(doesNotListen, 'Often does not seem to listen when spoken to directly').
conditionKey(doesNotFollowThrough, 'Often does not follow through on instructions and fails to finish schoolwork,
chores, or duties in the workplace').
conditionKey(difficultyOrganizing, 'Often has difficulty organizing tasks and activities').
conditionKey(avoidsTaskMentalEffort, 'Often avoids, dislikes, or is reluctant to engage in tasks that require sustained
mental effort').
conditionKey(losesThingsNecessary, 'Often loses things necessary for tasks or activities').
conditionKey(distractedStimuli, 'Is often easily distracted by extraneous stimuli').
conditionKey(forgetfulDaily, 'Is often forgetful in daily activities').

% At least six symptoms of hyperactivity must be present for ADHD.

condition(X, hyperactivityImpulse) :- numCharacteristicSymptoms(X, [fidgest, leavesSeat, runsClimbs, unableQuietly, onTheGo, talkExcessive, doesNotWaitAnswer, difficultyWaitTurn, interruptsIntrudes], Y), Y >= 6.

hasSomeConditions(X, hyperactivityImpulse) :-  numCharacteristicSymptoms(X, [fidgest, leavesSeat, runsClimbs, unableQuietly, onTheGo, talkExcessive, doesNotWaitAnswer, difficultyWaitTurn, interruptsIntrudes], Y), Y >= 1.

conditionKey(fidgets, 'Often fidgets with or taps hands or feet or squirms in seat').
conditionKey(leavesSeat, 'Often leaves seat in situations when remaining seated is expected').
conditionKey(runsClimbs, 'Often runs about or climbs in situations where it is inappropriate').
conditionKey(unableQuietly, 'Often unable to play or engage in leisure activities quietly').
conditionKey(onTheGo, 'Is often on the go, acting as if driven by a motor').
conditionKey(talkExcessive, 'Often talks excessively').
conditionKey(doesNotWaitAnswer, 'Often blurts out an answer before a question has been completed').
conditionKey(difficultyWaitTurn, 'Often has difficulty waiting his or her turn').
conditionKey(interruptsIntrudes, 'Often interrupts or intrudes on others').

% Code below is for determining if an item is in a list

on(Item,[Item|Rest]).  
on(Item,[DisregardHead|Tail]):-
          on(Item,Tail).


% Code for determining if a X has a condition in the list.
% If X has the condition in the head of the list, we are done.

% Otherwise we go through the the list recursively until it is empty.

-hasCondition(X, []).
hasCondition(X, [H|T]) :- condition(X, H).
hasCondition(X, [H|T]) :- -condition(X, H), hasCondition(X, T).

% This code is necessary for counting the number of characteristic symptoms.

conditionTruthValue(X, C, 1) :- condition(X, C).
conditionTruthValue(X, C, 0) :- not conditionTruthValue(X, C, 1).

% Code for counting the number of characteristic symptoms of innattention that the patient has.
% If the list is empty, the number of characteristic symptoms is obviously 0, otherwise we recursively traverse list.

numCharacteristicSymptoms(X, [], 0).
numCharacteristicSymptoms(X, [H|T], N) :- conditionTruthValue(X, H, N1), numCharacteristicSymptoms(X, T, N2), N is N1+N2.


% Code for counting the number of elements in a list
count([],0).
count([H|T],N) :- count(T,N1) , N is N1+1.

% Unspecified Attention-Deficit Hyperacitivity Disorder

diagnosis(X, 'Unspecified Attention-Deficit Hyperactivity Disorder') :- not diagnosis(X, 'Attention-Deficit Hyperactivity Disorder'), hasSomeConditions(X, innattention).
diagnosis(X, 'Unspecified Attention-Deficit Hyperactivity Disorder') :- not diagnosis(X, 'Attention-Deficit Hyperactivity Disorder'), hasSomeConditions(X, hyperactivityImpulse).

% Specific Learning Disorder

diagnosis(X, 'Specific Learning Disorder') :- condition(X, difficultyLearningUsingAcademic), condition(X, academicSkillsBelowAge), condition(X, learningDifficultiesSchoolAgeYears), not condition(X, otherIntellectualDisabilities).

condition(X, difficultyLearningUsingAcademic) :- numCharacteristicSymptoms(X, [innaccurateReading, difficultyUnderstandingReading, difficultySpelling, difficultyWrittenExpr, difficultyNumbers, difficultyMath], Y), Y >= 1.

conditionKey(innaccurateReading, 'Inaccurate or slow and effortful word reading').
conditionKey(difficultyUnderstandingReading, 'Difficulty understanding the meaning of what is read').
conditionKey(difficultySpelling, 'Difficulties with spelling').
conditionKey(difficultyWrittenExpr, 'Difficulties with written expression').
conditionKey(difficultyNumbers, 'Difficulties mastering number sense, number facts, or calculation').
conditionKey(difficultyMath, 'Difficulties with mathematical reasoning').

conditionKey(academicSkillsBelowAge, 'The affected academic skills are substantially and quantifiably below those expected
for the individual’s chronological age, and cause significant interference with academic
or occupational performance, or with activities of daily living').
conditionKey(learningDifficultiesSchoolAgeYears, 'The learning difficulties begin during school-age years').

condition(X, otherIntellectualDisabilities) :- condition(X, visualAuditoryAcuity).
condition(X, otherIntellectualDisabilities) :- condition(X, sensoryImpairment).
condition(X, otherIntellectualDisabilities) :- iddBase(X).


% Motor Disorders

% diagnosis(X, 'Developmental Coordination Disorder') :- condition(X, motorSkillsBelowAge), condition(X, motorSkillsInterfere), condition(X, onsetdevelopmentalperiod), not condition(X, otherIntellectualDisabilities).
