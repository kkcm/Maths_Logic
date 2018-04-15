structure foo :> PART_ONE =
struct
  exception NotImplemented

  datatype 'a tree= Leaf of 'a | Node of 'a tree * 'a * 'a tree
  datatype ('a, 'b) either = Left of 'a | Right of 'b
  datatype float = float
  
  (* (A -> B) -> (A -> C) -> A -> B -> C *)
  fun impl_rozdz (a : string -> bool)(b : string -> int)(c : string)(d : bool) = b(c);
  
  (* (A -> B) -> (B -> C) -> A -> C *)
  fun impl_komp (a : string -> bool)(b : bool -> int)(c : string) = b(a(c));
  
  (* (A -> B -> C) -> B -> A -> C *)
  fun impl_perm (a : string -> bool -> int)(b : bool)(c : string) = a(c)(b);
  
  (* A -> B -> A /\ B *)
  fun impl_conj (a: string)(b : bool) = (a,b);
  
  (* A /\ B -> A *) 
  fun conj_elim (a : string, b : bool) = a;
  
  (* A -> A \/ B *)
  fun disj_intro_l (a : string) = Left a;
  
  (* A \/ B -> (A -> C) -> (B -> C) -> C *)
  fun rozl_elim (Left a)(b : string -> int)(c : bool->int) = b(a)
				| rozl_elim (Right a)(b : string -> int)(c : bool->int) = c(a)
  
  (* (A -> B) -> (A -> C) -> (B -> C -> D) -> A -> D *)
  fun diamencik (a : string -> bool)(b : string -> int)(c : bool -> int -> float)(d : string) = c(a(d))(b(d));
  
(* 
  (* ((((A -> B) -> A) -> A) -> B) -> B *)
  fun slaby_pierce (a : ( b : ( c: ( d : string->bool)->string)->string)-> bool) = a(b(c(d)));


  (* (A \/ B -> C) -> (A -> C) /\ (B -> C) *)
  fun rozl_impl_rozdz ( a : ) 
*)

  (* (A -> C) /\ (B -> C) -> A \/ B -> C *)
  fun rozl_impl_rozdz_odw ( a : string->int, b : bool->int)(Left c) = a(c)
				| rozl_impl_rozdz_odw ( a : string->int, b : bool->int)(Right c) = b(c);
				

  (* (A /\ B -> C) -> A -> B -> C *)
  fun curry (a : string*bool->int)(d : string)(e : bool) = a(d,e);


  
  (* (A -> B -> C) -> A /\ B -> C *)
  fun uncurry (a : string -> bool -> int)(b : string, c : bool) = a(b)(c);
  

 
 end
