⎕IO←0
data←⍎¨,⎕CSV'data/day2.txt'
data[1]←12
data[2]←2
op1←{a b c←⍺⋄data←⍵⋄data[c]←data[a]+data[b]⋄data}
op2←{a b c←⍺⋄data←⍵⋄data[c]←data[a]×data[b]⋄data}
∇ step←{
    pc data←⍺ ⍵
    op a b c←data[pc+⍳4]
    op=99:1 pc data
    pc←pc+4
    op=1:0 pc(a b c op1 data)
    op=2:0 pc(a b c op2 data)
}
∇
 run←{⍺←0 ⋄ pc data←⍺ ⍵ ⋄ stop pc data1←pc step data ⋄ stop:data1 ⋄ pc ∇ data1}
⊃ run data
