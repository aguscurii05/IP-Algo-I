--problema estanRelacionados (a:Z, b:Z) : Bool {
--requiere: {a ̸= 0 ∧ b ̸= 0}
--asegura: {(res = true) ↔ a ∗ a + a ∗ b ∗ k = 0 para alg´un k ∈ Z con k ̸= 0)}

estanRelacionados:: Int->Int->Bool
estanRelacionados a b|a/=0 && b/=0 && (mod (a*a) (a*b))==0 = True
                     |otherwise = False

--si el resto es 0 significa que a*b es multiplo de a*a, por lo tanto existe un k/asegura