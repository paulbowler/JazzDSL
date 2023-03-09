grammar Score;

score       : '{' title time_sig stave+ '}' ;

title       : '"'STRING'"';

time_sig    : INT '/' INT ;

key_sig     : KEY (major|minor);

tempo       : '('STRING')' ;

stave       : '<' instrument  (section | rep_section)+ '>' ;

instrument  : 'ElectricGrandPiano'
            | 'Piano' ;

section     : ('[' bar+ ']')+ ;
rep_section : ('[:' bar+ ':]')+ ;

bar         : label? (chord | symbol) ('|' bar )* ;

label       : '!'('A'|'B'|'C'|'D'|'1'|'2')'!';

chord       : NOTE ( minor | major | diminished | half_dim)? extension? (alteration)*;

minor       : ('-'|'m') ;
major       : ('+'|'M') ;
diminished  : ('dim'|'o') ;
half_dim    : '0' ;
extension   : ('6'|'7'|'9') ;

alteration  : (SHARP|FLAT)('5'|'9'|'11'|'13') ;

symbol      : ('%'|'=') ;

KEY         : NOTE (SHARP | FLAT) ;

NOTE        : [A-G] ;

SHARP       : '#' ;
FLAT        : 'b' ;

STRING      : [a-zA-Z.]+ ;
INT         : [0-9] ;
ALPHA       : [a-zA-Z]+ ;
WS          : [ \t\r\n]+ -> skip;
