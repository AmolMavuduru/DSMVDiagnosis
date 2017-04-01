
#include 'section1.1IDD.lp'.
#include 'communicationdisorders.lp'.

% Program file for running main query for diagnosis.
% This is the file where the user can input conditions and find out the diagnosis.

condition(patient, compProdDeficiency).
condition(patient, langAbilitiesBelowAge).
condition(patient, onsetdevelopmentalperiod).

condition(X, Z) :- conditionStr(X, Y), conditionKey(Z, Y).


 get_diagnosis(X) :- diagnosis(X, Y),
 write('The patient was diagnosed with the following: '),
 write(Y), nl.

 ?- get_diagnosis(patient).

 
 


