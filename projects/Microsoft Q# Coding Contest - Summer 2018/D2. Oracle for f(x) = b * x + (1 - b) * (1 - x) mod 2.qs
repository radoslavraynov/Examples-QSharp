namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation Solve (x : Qubit[], y : Qubit, b : Int[]) : ()
    {
        body
        {
            mutable ones = 0;
            for(i in 0 .. Length(b)-1) {
                set ones = ones + b[i] + 1;
                CNOT(x[i], y);
            }
            if(ones % 2 == 1) {
                X(y);
            }
        }
    }
}
