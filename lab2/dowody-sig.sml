signature PART_ONE = 
sig
  exception NotImplemented

  datatype 'a tree= Leaf of 'a | Node of 'a tree * 'a * 'a tree
  datatype ('a, 'b) either = Left of 'a | Right of 'b
  datatype float = float
  
  (* (A -> B) -> (A -> C) -> A -> B -> C *)
  val impl_rozdz : (string -> bool)->(string -> int)->(string)->(bool)->(int)
 
  (* (A -> B) -> (B -> C) -> A -> C *)
  val impl_komp : (string -> bool)->(bool -> int)->(string)->(int)
 
  (* (A -> B -> C) -> B -> A -> C *)
  val impl_perm : (string -> bool -> int)->(bool)->(string)->(int)

  (* A -> B -> A /\ B *)
  val impl_conj : (string)->(bool)->(string*bool)

  (*  A /\ B -> A *) 
  val conj_elim : (string*bool)->(string)

  (* A -> A \/ B *)
  val disj_intro_l  : (string)->(string, bool) either
 
  (* A \/ B -> (A -> C) -> (B -> C) -> C *)
  val rozl_elim : (string, bool) either->(string -> int)->(bool->int)->int
 
  (* (A -> B) -> (A -> C) -> (B -> C -> D) -> A -> D *)
  val diamencik : (string -> bool)->(string -> int)->(bool -> int -> float)->(string)->(float)
  
(*   
  (* ((((A -> B) -> A) -> A) -> B) -> B *)
  val slaby_pierce :  ((((string -> bool) -> string)->string)->bool) ->bool

  (* (A \/ B -> C) -> (A -> C) /\ (B -> C) *)
  val rozl_impl_rozdz :  
  *)
  
  (* (A -> C) /\ (B -> C) -> A \/ B -> C *)
  val rozl_impl_rozdz_odw : ((string->int)*(bool->int))->((string, bool) either) -> (int)


  (* (A /\ B -> C) -> A -> B -> C *)
  val curry : ((string*bool)->(int))->(string)->(bool)->(int)

	
  (* (A -> B -> C) -> A /\ B -> C *)
  val uncurry : (string -> bool -> int)->(string * bool) -> int

  
end 
