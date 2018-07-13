namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation Solve (q : Qubit) : Int
    {
        // from the solutions
        body
        {
            mutable output = 0;
            let basis = RandomInt(2);
            if(basis == 0) {
                let r = M(q);
                if(r == One) { set output = 1; }
                else { set output = -1; }
            }
            else {
                H(q);
                let r = M(q);
                if(r == One) { set output = 0; }
                else { set output = -1; }
            }
            return output;
        }
    }
}
