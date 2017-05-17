A = LOAD './in/*.txt';
B = FOREACH A GENERATE  FLATTEN(TOKENIZE(LOWER((chararray)$0))) AS word;
C = FOREACH B GENERATE FLATTEN(TOKENIZE(REPLACE(word,'','|'), '|')) AS letter;
D = GROUP C BY letter;
E = FOREACH D GENERATE group, COUNT(C);
STORE E INTO './charcount';
