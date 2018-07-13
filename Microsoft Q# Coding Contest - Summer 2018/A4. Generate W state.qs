namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation Solve (qs : Qubit[]) : ()
    {
        body
        {
            let N = Length(qs);
            if N == 1 {
                X(qs[0]);
            }
            else {
                let n = N/2;
                Solve(qs[0..(n-1)]);
                H(qs[n]);
                for(i in 1 .. (n-1)) {
                    CCNOT(qs[i], qs[n], qs[n+i]);
                }
                for(i in 1 .. (n-1)) {
                    CNOT(qs[n+i], qs[n]);
                    CNOT(qs[n+i], qs[i]);
                }
                CNOT(qs[n], qs[0]);
            }
        }
    }
}
