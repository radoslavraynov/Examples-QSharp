namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation Solve (qs : Qubit[]) : Int
    {
        body
        {
            CNOT(qs[0], qs[1]);
            let a = M(qs[1]);
            H(qs[0]);
            let b = M(qs[0]);
            return ResultAsInt([b;a]);
        }
    }
}
