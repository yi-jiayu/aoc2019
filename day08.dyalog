w h←25 6
img←⍎¨¯1↓⊃⎕NGET'data/day08.txt'
reshape←{w h←⍺ ⋄ z(w×h)⍴⍵⊣z←÷⍨/w h,(⍴⍵)}
layers←↓w h reshape img
argmin←⊃⍋{+/0=⍵}¨layers
min←argmin⊃layers
n1s←+/1=min
n2s←+/2=min
n1s×n2s
h w⍴{⊃(⍵≠2)/⍵}¨↓[1]w h reshape img
