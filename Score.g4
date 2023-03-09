grammar Score;

score       : { title time? key_sig? tempo? stave+ };

title       : '/"' STRING  '/"';

time        : NUMB '//' NUMB ;

key_sig     : KEY ;

tempo       : '('STRING')' ;

stave       : '<' instrument  (section | rep_section)+ '>' ;

instrument  : 'ElectricGrandPiano'
            | 'Piano' ;

section     : ('[' ('!'label)? bar ']')+ ;
rep_section : ('[' ('!'label)? ':' bar ':]')+ ;

label       : ALPHA ;

bar         : entry ('|' entry )* ;

entry       : (chord | NOTE | symbol) ;

chord       : NOTE ( minor | major | diminished | half_dim) extension? (alteration)*;

minor       : ('-'|'m') ;
major       : ('+'|'M') ;
diminished  : ('dim'|'o') ;
half_dim    : '0' ;
extension   : ('6'|'7'|'9') ;

alteration  : (SHARP|FLAT) ('5'|'9'|'11'|'13') ;

symbol      : ('%'|'-') ;

KEY         : NOTE (SHARP | FLAT) ;

NOTE        : [A-G] ;

SHARP       : '#' ;
FLAT        : 'b' ;

STRING      : [0-9a-zA-Z]+ ;
NUMB        : [0-9] ;
ALPHA       : [a-zA-Z]+ ;
WS          : [ \t\r\n]+ -> skip;
