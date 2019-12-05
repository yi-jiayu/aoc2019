notdec←{^/(¯1↓⍵)≤1↓⍵} ⍝ not decreasing
adjsame←{∨/(¯1↓⍵)=1↓⍵} ⍝ at least once adjacent digit same
incrange←{⍺←0⋄⍺+⍳1+⍵-⍺} ⍝ inclusive range
valid←{(notdec ⍵)∧adjsame ⍵}
digits←⍎¨⍕
+/(valid∘digits)¨183564 incrange 657474
