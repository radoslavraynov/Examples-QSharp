namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation Solve (qs : Qubit[]) : Int
    {
        body
        {
            H(qs[0]);
            CNOT(qs[1], qs[0]);
            H(qs[1]);
            let r0 = M(qs[0]);
            let r1 = M(qs[1]);
            if(r0 == One) {
                if(r1 == One) { return 0; }
                else { return 2; }
            }
            else {
                if(r1 == One) { return 1; }
                else { return 3; }
            }
        }
    }
}
