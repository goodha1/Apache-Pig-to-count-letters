A = LOAD './in/*.txt';
B = FOREACH A GENERATE FLATTEN(TOKENIZE(LOWER((chararray)$0))) AS word;
C = FOREACH B GENERATE FLATTEN(TOKENIZE(REPLACE(word,'','|'), '|')) AS letter;
F = FILTER C BY letter == 'a' OR letter == 'e' OR letter == 'i' OR letter == 'o' OR letter == 'u';
D = GROUP F BY letter;
E = FOREACH D GENERATE group, COUNT(F);
STORE E INTO './charcount_bonus';