namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    function FindFirstDiff (bits0 : Bool[], bits1 : Bool[]) : Int
    {
        for (i in 0 .. Length(bits1)-1) {
            if (bits0[i] != bits1[i]) {
                return i;
            }
        }
        return -1;
    }

    operation Solve (qs : Qubit[], bits0 : Bool[], bits1 : Bool[]) : ()
    {
        body
        {
            let control = FindFirstDiff(bits0, bits1);
            H(qs[control]);

            for(i in 0 .. Length(qs)-1) {
                if(i != control) {
                    if(bits0[i] == bits1[i]) {
                        if(bits0[i] == true) {
                            X(qs[i]);
                        }
                        // else do nothing
                    }
                    else {
                        CNOT(qs[control], qs[i]);
                        if(bits1[control] == true) {
                            if(bits1[i] == false) {
                                X(qs[i]);
                            }
                        }
                        else {
                            if(bits0[i] == false) {
                                X(qs[i]);
                            }
                        }
                    }
                }
            }
        }
    }
}
