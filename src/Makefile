parser: y.tab.c lex.yy.c
	gcc -o parser y.tab.c
y.tab.c: CS315f22_team09.y lex.yy.c
	yacc CS315f22_team09.y
lex.yy.c: CS315f22_team09.l
	lex CS315f22_team09.l
clean:
	rm -f lex.yy.c y.tab.c y.output *~
