grammar Ada;

program: statement+ EOF;

declaration: var_declaration | import_declaration;

import_declaration: 'with' name ';' | 'use' name ';';

var_declaration:
	identifier_list ':' ('constant')? type (':=' expression)? ';';

identifier_list: Identifier (',' Identifier)*;

type: Identifier | array | range;

primary: Identifier | num | STRING | function_call;

factor: primary (('**' | 'abs' | 'not') primary)?;

term: factor (multiplying factor)*;

simple_expression: unary_adding? term (binary_adding term)*;

relation:
	simple_expression (relational_operator simple_expression)?
	| simple_expression 'not'? 'in' range
	| simple_expression 'not'? 'in' Identifier;

expression:
	relation (
		('and' | 'and then' | 'or' | 'or else' | 'xor') relation
	)?;

relational_operator: '=' | '/=' | '<' | '<=' | '>' | '>=';

unary_adding: '+' | '-';

binary_adding: '+' | '-' | '&';

multiplying: '*' | '/' | 'mod' | 'rem';

statement:
	declaration
	| procedure
	| assignment
	| loop
	| if_block
	| case_block
	| block
	| exit
	| return_stat
	| function_call;

procedure: 'procedure' Identifier 'is' statement+;

assignment: Identifier ':=' expression ';';

loop: iteration_scheme? 'loop' statement+ 'end loop;';

iteration_scheme: 'for' loop_param | 'while' expression;

loop_param: Identifier 'in' ('reverse')? range;

if_block:
	'if' expression 'then' statement+ (
		'elsif' expression 'then' statement+
	)* ('else' statement+)? 'end if;';

case_block:
	'case' expression 'is' alternative+ (
		'when others' '=>' statement+
	)? 'end case;';

alternative: 'when' expression '=>' statement+;

block: ('declare' declaration+)? 'begin' statement+ 'end' Identifier? ';';

exit: 'exit' ('when' expression)? ';';

return_stat: 'return' expression? ';';

function_call:
	Identifier (
		'(' param_association? (',' param_association)* ')'
	)? ';'?;

param_association: (name '=>')? expression;

name: NAME;

array: 'array' '(' num '..' num ')' ('of' Identifier)?;

range: 'range ' num '..' num;

num: NUM;

fragment HASH: '#';

Identifier: LETTER (LETTER | DIGIT | '_')*;

NUM: DECIMAL | BASED;

DECIMAL: INT ('.' INT)? EXP?;

fragment INT: DIGIT+ ('_' DIGIT+)?;

fragment EXP: 'E' ('+' | '-') INT;

BASED: INT '#' BASED_INT ('.' BASED_INT)? '#' EXP;

NAME: NAME_NODE ('.' NAME_NODE)*;

fragment NAME_NODE: [A-Za-z0-9_]+;

BASED_INT: [0-9a-fA-F] ('_' [0-9a-fA-F]+)?;

fragment LETTER: [a-zA-Z];

fragment DIGIT: [0-9];

CHAR: '\'' ~['\\\r\n] '\'';

STRING: '"' ~["\\\r\n]* '"';

Comment: '--' ~[\\\r\n]* -> skip;

WS: [ \t\n\r]+ -> skip;