namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation Solve (N : Int, Uf : ((Qubit[], Qubit) => ())) : Int[]
    {
        body
        {
            mutable res = new Int[N];
            using( qs = Qubit[N+1] ) {
                let y = qs[N];
                Uf(qs[0..(N-1)], y);
                if N%2==1 { X(y); }
                if M(y)==One { set res[0]=1; }
                ResetAll(qs);
            }
            return res;
        }
    }
}
