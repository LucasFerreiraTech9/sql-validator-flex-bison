%{
#include "parser.tab.h"
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
%}

%%

"SELECT"        { return SELECT; }
"INSERT"        { return INSERT; }
"UPDATE"        { return UPDATE; }
"DELETE"        { return DELETE; }
"FROM"          { return FROM; }
"INTO"          { return INTO; }
"VALUES"        { return VALUES; }
"SET"           { return SET; }
"WHERE"         { return WHERE; }

","             { return COMMA; }
";"             { return SEMICOLON; }
"("             { return LPAREN; }
")"             { return RPAREN; }
"="             { return EQUALS; }
"*"             { return ASTERISK; }

[0-9]+          { yylval.str = strdup(yytext); return NUMBER; }
\'[^\']*\'      { yylval.str = strdup(yytext); return STRING; }
[a-zA-Z_][a-zA-Z0-9_]* { yylval.str = strdup(yytext); return IDENTIFIER; }

[ \t\r\n]+      { /* ignora espaços */ }

. {
    printf("Erro léxico: caractere inválido '%s'\n", yytext);
}

%%

int yywrap(void) {
    return 1;
}
