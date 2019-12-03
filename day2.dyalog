⎕IO←0
data←⍎¨,⎕CSV'data/day2.txt'
op1←{a b c←⍺ ⋄ d⊣d[c]←d[a]+d[b]⊣d⊣d←⍵}
op2←{a b c←⍺ ⋄ d⊣d[c]←d[a]×d[b]⊣d⊣d←⍵}
∇ step←{
    pc data←⍺ ⍵
    op a b c←data[pc+⍳4]
    op=99:1 pc data
    pc+←4
    op=1:0 pc(a b c op1 data)
    op=2:0 pc(a b c op2 data)
}
∇
run←{⍺←0 ⋄ pc data←⍺ ⍵ ⋄ stop pc data←pc step data ⋄ stop:⊃data ⋄ pc ∇ data}
run2←{n v←⍺⋄data←⍵⋄data[1 2]←n v⋄run data}
12 2 run2 data
target←19690720
run3←{target data←⍺ ⋄ h t←(⊃⍵)(1↓⍵) ⋄ target=h run2 data:h ⋄ 0=⍴t:'not found' ⋄ target data ∇ t}
v+100×n⊣n v←target data run3 ,(⍳100)∘.,⍳100
