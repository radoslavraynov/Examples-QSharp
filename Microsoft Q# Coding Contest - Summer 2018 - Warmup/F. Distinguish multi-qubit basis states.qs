namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation Solve (qs : Qubit[], bits0 : Bool[], bits1 : Bool[]) : Int
    {
        body
        {
            mutable last_idx = -1;
            for(i in 0 .. Length(qs)-1) {
                if bits0[i] != bits1[i] {
                    set last_idx = i;
                }
            }
            if BoolFromResult(M(qs[last_idx])) == bits1[last_idx] {
                return 1;
            }
            return 0;
        }
    }
}
