%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%union {
    char *str;
}

%token SELECT INSERT UPDATE DELETE FROM INTO VALUES SET WHERE
%token COMMA SEMICOLON LPAREN RPAREN EQUALS ASTERISK
%token <str> IDENTIFIER NUMBER STRING

%%

comando:
      select_stmt
    | insert_stmt
    | update_stmt
    | delete_stmt
    ;

select_stmt:
    SELECT lista_campos FROM IDENTIFIER SEMICOLON
    {
        printf("Comando SELECT válido.\n");
    }
    ;

lista_campos:
      ASTERISK
    | IDENTIFIER
    | lista_campos COMMA IDENTIFIER
    ;

insert_stmt:
    INSERT INTO IDENTIFIER VALUES LPAREN lista_valores RPAREN SEMICOLON
    {
        printf("Comando INSERT válido.\n");
    }
    ;

lista_valores:
      valor
    | lista_valores COMMA valor
    ;

valor:
      NUMBER
    | STRING
    | IDENTIFIER
    ;

update_stmt:
    UPDATE IDENTIFIER SET lista_atribuicoes SEMICOLON
    {
        printf("Comando UPDATE válido.\n");
    }
    ;

lista_atribuicoes:
      atribuicao
    | lista_atribuicoes COMMA atribuicao
    ;

atribuicao:
    IDENTIFIER EQUALS valor
    ;

delete_stmt:
    DELETE FROM IDENTIFIER SEMICOLON
    {
        printf("Comando DELETE válido.\n");
    }
    ;

%%

void yyerror(const char *s) {
    printf("Erro sintático: %s\n", s);
}

int main(void) {
    printf("Digite um comando SQL:\n");
    return yyparse();
}
