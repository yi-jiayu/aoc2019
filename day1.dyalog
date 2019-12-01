fuel←{(⌊⍵÷3)-2}
+/(fuel∘⍎)¨⊃⎕NGET'input.txt'1
fuel2←{⍺←0 ⋄ addn←fuel ⍵ ⋄ addn≤0:⍺ ⋄ (⍺+addn)∇ addn}
+/(fuel2∘⍎)¨⊃⎕NGET'input.txt'1
