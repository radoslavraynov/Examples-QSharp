operation IsConstant(qa : Qubit[], n : Int) : Bool {
    Body {
        X(q)
    }
    Adjoint auto
    Controlled auto
    Controlled Adjoint auto
}
