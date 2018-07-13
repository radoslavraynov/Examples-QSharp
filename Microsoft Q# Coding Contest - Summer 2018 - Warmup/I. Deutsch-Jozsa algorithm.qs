namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation Solve (N : Int, Uf : ((Qubit[], Qubit) => ())) : Bool
    {
        body
        {
            mutable res = new Result[N];
            using (qs = Qubit[N+1]) {
                X(qs[N]);
                ApplyToEach(H, qs);
                Uf(qs[0..(N-1)], qs[N]);
                ApplyToEach(H, qs[0..(N-1)]);

                for (i in 0..(N-1)) {
                    set res[i] = MResetZ(qs[i]);
                }
                Reset(qs[N]);
            }
            return ForAll(IsResultZero, res);
        }
    }
}
