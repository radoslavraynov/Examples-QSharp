namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation Solve (qs : Qubit[]) : Int
    {
        body
        {
            let n = Length(qs);
            if(n%2 == 1) {
                CCNOT(qs[n-2], qs[n-1], qs[0]);
            }
            for(i in 1 .. n-1) {
                CNOT(qs[i], qs[0]);
            }
            if(M(qs[0]) == One) { return 1; }
            else { return 0; }
        }
    }
}
