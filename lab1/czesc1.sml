(*
 * Jakub Kołoczek
 * Zadanie domowe 1, czesc 1
 *  structure file
 * wersja uzupełniona o brakujące dwa zadania
 *)
structure id282969 :> PART_ONE =
struct
  exception NotImplemented

  
  datatype 'a tree= Leaf of 'a | Node of 'a tree * 'a * 'a tree

  
  fun sum x = 
	if x = 1 then 1
	else x + sum (x-1);
	
	
  fun fac x = 
	if x = 1 then 1
	else x * fac (x-1);
	
	
  fun fib x = 
	if x < 2 then 1
	else fib (x-1) + fib(x-2);
	
	
  fun gcd (x, y) =
	if x = 0 then y
	else if y = 0 then x
	else if x = y then x
	else if x > y then gcd (x mod y, y)
	else gcd (y mod x, x);
	
	
  fun max (l : int list) = 
	case l of
		nil => 0
		| head :: nil => head
		| head :: tail => if head > max tail then head
		else max tail;
	
  
  fun sumTree (t : int tree) =
	case t of
		Leaf l => 0
		| Node (left, x, right) => sumTree(left) + x + sumTree(right);
  
  
  fun depth (t : 'a tree) =
	case t of
		Leaf l => 0
		| Node (left,x,right) => if depth(right) > depth(left) then depth(right) + 1
							else depth(left) + 1;
	
	
  fun binSearch (t : int tree) (n : int) = 
	case t of
		Leaf l => if l = n then true
							else false
		| Node(left,x,right) => if x = n then true
					else if x > n then binSearch left n
						else binSearch right n;
		
		
  fun preorder (t : 'a tree) = 
	case t of
		Leaf l => [l]
		| Node(left,x,right) => [x] @ preorder left @ preorder right; 

		
  fun listAdd ( l : int list) [] = l
		| listAdd [] ( k : int list ) = k
		| listAdd ( lhead::ltail : int list ) ( khead::ktail : int list) = (lhead + khead) :: (listAdd ltail ktail);

  
  fun insert (x : int) ( l : int list) = 
	case l of
		nil => [x]
		| head :: tail => if x < head then x :: head :: tail 
								else head :: insert x tail;
		
		
  fun insort ( l : int list) = 
	case l of
		nil => []
		| head :: tail => insert head (insort tail);


  

  fun compose f g  = fn x => g (f x);


  fun curry f m n = f (m,n);

  
  fun uncurry f (m,n) = f m n;
  
  
  fun multifun f n = 
	if n=1 then fn x => f x
					else compose f (multifun f (n-1));
					

  fun ltake ( l : 'a list ) ( n : int) = 
	case l of
		nil => []
		| head :: tail => if n = 0 then []
					else head :: (ltake tail (n-1));
	
  
  fun lall f [] = true
	| lall f (head::tail) = if (f head) then lall f tail
						else false;
	
	
  fun lmap f [] = []
	| lmap f (head::tail) = (f head)::(lmap f tail);
 
  
  fun lrev (l : 'a list) =
	case l of
		nil => []
		| head::nil => [head]
		| head::tail => lrev tail @[head];
 
 
  fun lzip (l,[]) = []
	| lzip ([],k) = []
	| lzip ((lhead::ltail),(khead::ktail)) = (lhead,khead)::(lzip(ltail,ktail));
  
  
  fun split [] = ([],[]) 
				| split [x] = ([x],[]) 
				| split (oddh ::evenh :: tail) =
						let val (odd,even) =
							split tail in ((oddh::odd), (evenh::even)) end
  
  
  fun cartprod l [] = []
	| cartprod [] k = []
	| cartprod (lhead::ltail) (khead::ktail) = (lhead,khead)::(cartprod [lhead] ktail) @ (cartprod ltail (khead::ktail));
	

end