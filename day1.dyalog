fuel←{(⌊⍵÷3)-2}
+/(fuel∘⍎)¨⊃⎕NGET'data/day1.txt'1
fuel2←{⍺←0 ⋄ addn←fuel ⍵ ⋄ addn≤0:⍺ ⋄ (⍺+addn)∇ addn}
+/(fuel2∘⍎)¨⊃⎕NGET'data/day1.txt'1
