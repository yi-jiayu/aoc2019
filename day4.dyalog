notdec←{^/(¯1↓⍵)≤1↓⍵} ⍝ not decreasing
adjsame←{∨/(¯1↓⍵)=1↓⍵} ⍝ at least once adjacent digit same
incrange←{⍺←0⋄⍺+⍳1+⍵-⍺} ⍝ inclusive range
valid←{(notdec ⍵)∧adjsame ⍵}
digits←⍎¨⍕
+/(valid∘digits)¨183564 incrange 657474
∇ lonepair←{
    a b c d e f←⍵
    (a=b)∧b≠c:1
    ∧/(a≠b)(b=c)(c≠d):1
    ∧/(b≠c)(c=d)(d≠e):1
    ∧/(c≠d)(d=e)(e≠f):1
    (d≠e)∧e=f:1
    0
}
∇
valid2←{(notdec ⍵)∧lonepair ⍵}
+/(valid2∘digits)¨183564 incrange 657474
