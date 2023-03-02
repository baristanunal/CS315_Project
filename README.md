# CS315 Project
CS315 Programming Languages course assignment of Lex &amp; Yacc project "BAM" programming language design.

*****************************

TEAM #09 

CS 315 Programming Languages

BAM PROGRAMMING LANGUAGE

*****************************

It is possible to test the BAM programming language by typing:

make

./parser < CS315f22_team09.txt

consecutively.

*****************************

The given txt file contains 3 intentional errors at lines 34, 69 and 124.

The following output shows the execution of "CS315f22_team09.txt":

[tan.unal@dijkstra ~]$ ./parser < CS315f22_team09.txt
Syntax error on line 34 !
Syntax error on line 69 !
Syntax error on line 124 !

The solution to all of those errors are given with comments just below the line of each error.

*****************************

Also, there is a txt file called "CS315f22_team09_valid.txt" which has no errors and produces the output:

[tan.unal@dijkstra ~]$ ./parser < CS315f22_team09_valid.txt
Input program is valid.

The only difference between those txt files are the three intentional syntax errors.

*****************************


