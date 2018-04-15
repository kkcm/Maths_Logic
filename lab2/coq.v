Section ZadanieOne.

Variables A B C D : Prop. 

Theorem impl_rozdz : (A -> B) -> (A -> C) -> A -> B -> C.
Proof.
intros.
apply H0.
exact H1.
Qed.

Theorem impl_komp : (A -> B) -> (B -> C) -> A -> C.
Proof.
intros.
apply H0.
apply H.
exact H1.
Qed.

Theorem impl_perm : (A -> B -> C) -> B -> A -> C. 
Proof.
intros.
apply H.
exact H1.
exact H0.
Qed.

Theorem impl_conj : A -> B -> A /\ B. 
Proof.
intros.
split.
exact H.
exact H0.
Qed.

Theorem conj_elim_l : A /\ B -> A. 
Proof.
intros.
elim H.
intros.
exact H0.
Qed.

Theorem disj_intro_l : A -> A \/ B.
Proof.
intros.
left.
exact H.
Qed.

Theorem rozl_elim : A \/ B -> (A -> C) -> (B -> C) -> C. 
Proof.
intros.
elim H.
exact H0.
exact H1.
Qed.

Theorem diamencik : (A -> B) -> (A -> C) -> (B -> C -> D) -> A -> D.
Proof.
intros.
apply H1.
apply H.
apply H2.
apply H0.
apply H2.
Qed.

Theorem slaby_peirce : ((((A -> B) -> A) -> A) -> B) -> B.
Proof.
intros.
apply H.
intros.
apply H0.
intros.
apply H.
intros.
exact H1.
Qed.

Theorem rozl_impl_rozdz : (A \/ B -> C) -> (A -> C) /\ (B -> C).
Proof.
intros.
split.
intros.
apply H.
left.
apply H0.
intros.
apply H.
right.
apply H0.
Qed.
 
Theorem rozl_impl_rozdz_odw : (A -> C) /\ (B -> C) -> A \/ B -> C.
Proof.
intros.
elim H.
intros.
elim H0.
intros.
apply H1.
exact H3.
intros.
apply H2.
exact H3.
Qed.

Theorem curry : (A /\ B -> C) -> A -> B -> C.
Proof.
intros.
apply H.
split.
exact H0.
exact H1.
Qed.

Theorem uncurry : (A -> B -> C) -> A /\ B -> C.
Proof.
intros.
apply H.
elim H0.
intros.
exact H1.
elim H0.
intros.
exact H2.
Qed.

End ZadanieOne.apply