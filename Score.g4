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

chord       : STRING ;

symbol      : STRING ;

KEY         : NOTE (SHARP | FLAT) ;

NOTE        : [A-G] ;

SHARP       : '#' ;
FLAT        : 'b' ;

STRING      : [0-9a-zA-Z]+ ;
NUMB        : [0-9] ;
ALPHA       : [a-zA-Z]+ ;
WS          : [ \t\r\n]+ -> skip;
