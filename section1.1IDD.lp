
% Programmer: Amol Mavuduru
% Psychological Disorder Diagnosis system.
% The DSM V does not have a multi-axis system like the previous versions but instead a set of specific categories.

% Category 1: Neurodevelopmental Disorders

% Section 1.1 Intellectual Development Disorder (IDD)

iddBase(X) :- condition(X, deficitintellectual), condition(X, deficitadapt), condition(X, onsetdevelopmentalperiod).

% There are different levels of severity for IDD: mild, moderate, severe, and profound.

diagnosis(X, 'Intellectual Development Disorder (Mild)') :- iddBase(X), conceptualdomainmild(X), socialdomainmild(X).
diagnosis(X, 'Intellectual Development Disorder (Moderate)') :- iddBase(X), conceptualdomainmod(X), socialdomainmod(X).
diagnosis(X, 'Intellectual Development Disorder (Severe)') :- iddBase(X), conceptualdomainSevere(X), socialdomainSevere(X).
diagnosis(X, 'Intellectual Development Disorder (Profound)') :- iddBase(X), conceptualdomainProfound(X), socialdomainProfound(X).



% If we fail to prove that the base conditions are thoroughly satisfied, then we assume the individual does not have IDD.
-diagnosis(X, 'Intellectual Development Disorder (Mild)') :- not iddBase(X).
-diagnosis(X, 'Intellectual Development Disorder (Moderate)') :- not iddBase(X).
-diagnosis(X, 'Intellectual Development Disorder (Severe)') :- not iddBase(X).
-diagnosis(X, 'Intellectual Development Disorder (Profound)') :- not iddBase(X).

% Condition Keys for this section

conditionKey(deficitintellectual, 'Deficits in intellectual functions, such as reasoning, problem solving, planning, abstract
thinking, judgment, academic learning, and learning from experience').
conditionKey(deficitadapt, 'Deficits in adaptive functioning that result in failure to meet developmental and sociocultural
standards for personal independence and social responsibility').
conditionKey(onsetdevelopmentalperiod, 'Onset of symptoms is during developmental period').



% If the individual has some intellectual disability but does not meet the criteria for IDD, then they have an unspecified intellectual disability (must be at least age 5).

diagnosis(X, 'Unspecified Intellectual Disability') :- ageOverFive(X), condition(X, deficitintellectual), not iddBase(X).
ageOverFive(X) :- age(X, Y), Y >= 5.

% If the individual is under the age of five, but meet the other criteria for an unspecified intellectual disability, then they have Global Developmental Delay.

diagnosis(X, 'Global Developmental Decay') :- ageUnderFive(X), condition(X, deficitintellectual), not iddBase(X).
ageUnderFive(X) :- age(X, Y), Y < 5.

% The conditions below define the criteria for meeting the different levels of severity for IDD within each domain:

conceptualdomainmild(X) :- condition(X, difficultyAcademicSkills), condition(X, shortTermMemory).
socialdomainmild(X) :- condition(X, socialInteractionImmature), condition(X, limitedUnderstandingRisk), condition(X, difficultyRegulatingEmotion).
practicaldomainmild(X) :- condition(X, judgementSupport).

conceptualdomainmod(X) :- condition(X, languageDevelopsSlowly), condition(X, ongoingAssistanceDailyBasis), condition(X, elementaryLevelAcademic).
socialdomainmod(X) :- condition(X, limitedSocialJudgement), condition(X, spokenLanguageLessComplex).
practicaldomainmod(X) :- condition(X, extendedPeriodTeaching).

conceptualdomainSevere(X) :- condition(X, limitedConceptualSkills), condition(X, littleUnderstandingWrittenLanguage). 
socialdomainSevere(X) :- condition(X, limitedSpokenLanguage).

conceptualdomainProfound(X) :- condition(X, conceptPhysical). 
socialdomainProfound(X) :- condition(X, limitedUnderstandingSymComm), condition(X, nonverbalComm).

conditionKey(difficultyAcademicSkills, 'difficulties in learning academic skills involving reading, writing, arithmetic, time or money').
conditionKey(shortTermMemory, 'short term memory is impaired').
conditionKey(socialInteractionImmature, 'Compared with typically developing adults, the individual is immature in social interactions').
conditionKey(limitedUnderstandingRisk, 'There is limited understanding of risk in social situations').

conditionKey(languageDevelopsSlowly, 'Language development is slow for age').
conditionKey(ongoingAssistanceDailyBasis, 'Ongoing assistance needed for tasks on a daily basis').
conditionKey(elementaryLevelAcademic, 'As individual approaches adulthood academic skill development is typically at an elementary level').



% Code below used for testing and running queries.

condition(john, deficitintellectual).
condition(john, deficitadapt).
conceptualdomainmild(john).
socialdomainmild(john).
practicaldomainmild(john).




