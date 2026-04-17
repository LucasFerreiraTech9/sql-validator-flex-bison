# Validador de Comandos SQL com Flex e Bison

Projeto acadêmico desenvolvido em C utilizando **Flex** e **Bison** para realizar análise léxica e sintática de comandos SQL básicos.

## Objetivo

O projeto tem como objetivo validar a estrutura de comandos SQL simples, identificando comandos válidos e apontando erros léxicos ou sintáticos.

## Tecnologias utilizadas

- C
- Flex
- Bison
- GCC

## Comandos suportados

- SELECT
- INSERT
- UPDATE
- DELETE

## Estrutura do projeto

- `lexer.l` → analisador léxico
- `parser.y` → analisador sintático
- `exemplos/validos.txt` → exemplos de entradas válidas
- `exemplos/invalidos.txt` → exemplos de entradas inválidas

## Como compilar

```bash
bison -d parser.y
flex lexer.l
gcc parser.tab.c lex.yy.c -o sqlparser -lfl

## Como executar

```bash
./sqlparser

## Exemplos válidos 

SELECT nome FROM clientes;
INSERT INTO clientes VALUES (1, 'Lucas');
UPDATE clientes SET nome = 'Ana';
DELETE FROM clientes;


## Exemplos inválidos 

SELECT FROM clientes;
INSERT clientes VALUES (1, 'Lucas');
UPDATE clientes nome = 'Ana';
DELETE clientes;


# Arquivos de exemplo

 'exemplos/validos.txt'
 'exemplos/invalidos.txt'


## Autor

Lucas Ferreira Eiras  
GitHub: https://github.com/LucasFerreiraTech9