namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation Solve (qs : Qubit[]) : Int
    {
        body
        {
            CNOT(qs[0], qs[1]);
            H(qs[0]);
            let a=0;
            let b=0;
            if(M(qs[0]) == One) { a=1; }
            if(M(qs[1]) == One) { b=1; }
            return 2*a+b;
        }
    }
}
