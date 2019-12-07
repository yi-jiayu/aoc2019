⎕IO←0

get←{mode val←⍺ ⋄ mode=1:val ⋄ mem[val]⊣mem←⍵}
op1←{am a bm b _ c←⍺ ⋄ (p+4) m i o⊣m[c]←(am a get m)+(bm b get m)⊣p m i o←⍵}
op2←{am a bm b _ c←⍺ ⋄ (p+4) m i o⊣m[c]←(am a get m)×(bm b get m)⊣p m i o←⍵}
op3←{__ a __ _ _ _←⍺ ⋄ (p+2) m i o⊣i←1↓i⊣m[a]←⊃i⊣p m i o←⍵}
op4←{am a __ _ _ _←⍺ ⋄ (p+2) m i o⊣o,←(am a get m)⊣p m i o←⍵}
op5←{am a bm b _ _←⍺ ⋄ p m i o⊣p←test⊃(p+3)(bm b get m)⊣test←0≠am a get m⊣p m i o←⍵}
op6←{am a bm b _ _←⍺ ⋄ p m i o⊣p←test⊃(p+3)(bm b get m)⊣test←0=am a get m⊣p m i o←⍵}
op7←{am a bm b _ c←⍺ ⋄ (p+4)m i o⊣m[c]←test⊣test←(am a get m)<(bm b get m)⊣p m i o←⍵}
op8←{am a bm b _ c←⍺ ⋄ (p+4)m i o⊣m[c]←test⊣test←(am a get m)=(bm b get m)⊣p m i o←⍵}

di←{10|⌊⍵÷10*⍺} ⍝ ⍺-th digit of ⍵
∇ step←{
    p m _ _←vm⊣vm←⍵
    modeop a b c←m[p+⍳4]
    op←100|modeop
    modes←2 3 4 di modeop
    pmodes←modes(,,⍤0)a b c

    op=99:1 vm ⍝ check if we should halt

    op=1:0(pmodes op1 vm)
    op=2:0(pmodes op2 vm)
    op=3:0(pmodes op3 vm)
    op=4:0(pmodes op4 vm)
    op=5:0(pmodes op5 vm)
    op=6:0(pmodes op6 vm)
    op=7:0(pmodes op7 vm)
    op=8:0(pmodes op8 vm)
}
∇

run←{vm←⍵ ⋄ stop vm←step vm ⋄ stop:vm ⋄ ∇ vm}

data←⍎¨,⎕CSV'data/day5.txt'
data,←0 0 0

pc←0
memory←data
input←1
output←⍬
vm←pc memory input output

⊢/output⊣_ _ _ output←run vm

pc←0
memory←data
input←5
output←⍬
vm←pc memory input output

output⊣_ _ _ output←run vm
