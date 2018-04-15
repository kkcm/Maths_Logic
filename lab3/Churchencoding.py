# coding: utf-8

def toInteger(f):
      return f(lambda n:n+1)(0)
      
def toBool(f):
      return f(True)(False)
      
def toIntegerArray(f):
	array = []
	while True:
		array.append(HEAD(f))
		array[len(array)-1] = toInteger(array[len(array)-1])
		f = NEXT(f)
		if toBool(ISEMPTY(f)):
			break
	return array
      
#zdefiniowanie liczebników Churcha
ZERO = lambda f : lambda x : x
ONE = lambda f : lambda x : f(x)
TWO = lambda f : lambda x : f(f(x))
THREE = lambda f : lambda x : f(f(f(x)))
FOUR = lambda f : lambda x : f(f(f(f(x))))
FIVE = lambda f : lambda x : f(f(f(f(f(x)))))

print ("example number ->", toInteger(ZERO))
print ("example number ->", toInteger(ONE))
print ("example number ->", toInteger(TWO))
print ("example number ->", toInteger(THREE))
print ("example number ->", toInteger(FOUR))
print ("example number ->", toInteger(FIVE))

#działania na liczebnikach
SUCC = lambda n : lambda f : lambda x : f(n(f)(x))
print ( "0 ++ = ", toInteger(SUCC(ZERO)))

ADD = lambda m : lambda n : lambda f : lambda x : m (f)(n(f)(x))
print ("3 + 4 = ", toInteger(ADD(THREE)(FOUR)))

MULT = lambda m : lambda n : lambda f : m (n(f))
print ("4 * 5 =", toInteger(MULT(FOUR)(FIVE)))

EXP = lambda m : lambda n : n (m)
print ("2 ^ 5 =", toInteger(EXP(TWO)(FIVE)))

PRED = lambda n : lambda f : lambda x : n(lambda g : lambda h : h (g (f)))(lambda u : x)(lambda u : u)
print ("5 -- =", toInteger(PRED(FIVE)))

SUB = lambda m : lambda n : n(PRED)(m)
print ("5 - 3 =", toInteger(SUB(FIVE)(THREE)))

#wartości logiczne
TRUE = lambda x : lambda y : x
FALSE = lambda x : lambda y : y
print ("example ->", toBool(TRUE))
print ("example ->", toBool(FALSE))

NOT = lambda x : x (FALSE)(TRUE)
print ("~true ->", toBool(NOT(TRUE)))
print ("~false ->", toBool(NOT(FALSE)))

AND = lambda x : lambda y : x(y)(x)
print ("true and true ->", toBool(AND(TRUE)(TRUE)))
print ("true and false ->", toBool(AND(TRUE)(FALSE)))

OR = lambda x : lambda y : x(x)(y)
print ("true or true ->", toBool(OR(TRUE)(TRUE)))
print ("true or false ->", toBool(OR(TRUE)(FALSE)))
print ("false or false ->", toBool(OR(FALSE)(FALSE)))

XOR = lambda x : lambda y : x (NOT(y))(y)
print ("true xor true ->", toBool(XOR(TRUE)(TRUE)))
print ("true xor false ->", toBool(XOR(TRUE)(FALSE)))
print ("false xor false ->", toBool(XOR(FALSE)(FALSE)))

IF = lambda x : lambda y : lambda z : x (y)(z)
print ("if true then true or false ->", toBool(IF(TRUE)(TRUE)(FALSE)))
print ("if false then true or false ->", toBool(IF(FALSE)(TRUE)(FALSE)))

ISZERO = lambda n : n (lambda x : FALSE)(TRUE)
print ("0 is zero? ->", toBool(ISZERO(ZERO)))
print ("4 is zero? ->", toBool(ISZERO(FOUR)))

LEQ = lambda m : lambda n : ISZERO (SUB (m)(n))
print ("2 <= 5 ->", toBool(LEQ(TWO)(FIVE)))
print ("4 <= 2 ->", toBool(LEQ(FOUR)(TWO)))
print ("4 <= 4 ->", toBool(LEQ(FOUR)(FOUR)))

LT = lambda m : lambda n : NOT(ISZERO (SUB (n)(m)))
print ("2 < 5 ->", toBool(LT(TWO)(FIVE)))
print ("4 < 2 ->", toBool(LT(FOUR)(TWO)))
print ("4 < 4 ->", toBool(LT(FOUR)(FOUR)))

EQ = lambda m : lambda n : AND(LEQ(m)(n))(LEQ(n)(m))
print ("5 = 5 ->", toBool(EQ(FIVE)(FIVE)))
print ("4 = 2 ->", toBool(EQ(FOUR)(TWO)))

GT = lambda m : lambda n : NOT(ISZERO (SUB (m)(n)))
print ("2 > 5 ->", toBool(GT(TWO)(FIVE)))
print ("4 > 2 ->", toBool(GT(FOUR)(TWO)))
print ("4 > 4 ->", toBool(GT(FOUR)(FOUR)))

GEQ = lambda m : lambda n : ISZERO (SUB (n)(m))
print ("2 >= 5 ->", toBool(GEQ(TWO)(FIVE)))
print ("4 >= 2 ->", toBool(GEQ(FOUR)(TWO)))
print ("4 >= 4 ->", toBool(GEQ(FOUR)(FOUR)))

#funkcje z artykułu

#pomocnicze przy rekursji
Y = lambda f : lambda x : f(x(x))(lambda x : f(x(x)))
Z = lambda f : (lambda x : f (lambda y : x(x)(y)))(lambda x : f (lambda y : x(x)(y)))

#operacja modulo
MOD = Z (lambda f : lambda m : lambda n : IF(LEQ(n)(m))(lambda x : f(SUB(m)(n))(n)(x))(m))
print ("3 % 2 = ", toInteger(MOD(THREE)(TWO)))

#przykład przechowywania danych
PAIR = lambda x : lambda y : lambda z : z (x)(y)
FIRST = lambda p : p (lambda x : lambda y : x)
SECOND = lambda p : p (lambda x : lambda y : y)

print ("first of pair ->", toInteger(FIRST(PAIR(ONE)(TWO))))
print ("second of pair ->", toInteger(SECOND(PAIR(ONE)(TWO))))

#lista
EMPTY = PAIR(TRUE)(TRUE)
UNSHIFT = lambda l : lambda x : PAIR(FALSE)(PAIR(x)(l))
ISEMPTY = FIRST
HEAD = lambda l : FIRST(SECOND(l))
NEXT = lambda l : SECOND(SECOND(l))

myfirstlist = UNSHIFT(UNSHIFT(UNSHIFT(EMPTY)(THREE))(TWO))(ONE)
print("my first list ->", toIntegerArray(myfirstlist))


RANGE = Z (lambda f : lambda m : lambda n : IF(LEQ(m)(n))(lambda x : UNSHIFT(f(SUCC(m))(n))(m)(x))(EMPTY))
TWENTY = MULT(FOUR)(FIVE)
mysecondlist = RANGE(ZERO)(TWENTY)
print("my second list ->", toIntegerArray(mysecondlist))

FOLD = Z( lambda f : lambda l : lambda x : lambda g : IF(ISEMPTY(l))(x)(lambda y : g(f(NEXT(l))(x)(g))(HEAD(l))(y)))
print("sum from 0 to 20 =", toInteger(FOLD(RANGE(ZERO)(TWENTY))(ZERO)(ADD)))
print("product from 1 to 10 =", toInteger(FOLD(RANGE(ONE)(MULT(TWO)(FIVE)))(ONE)(MULT)))

MAP = lambda k : lambda f : FOLD(k)(EMPTY)(lambda l : lambda x : UNSHIFT(l)(f(x)))
mythirdlist = MAP(mysecondlist)(SUCC)
print("my third list ->", toIntegerArray(mythirdlist))


FIFTEEN = MULT(THREE)(FIVE)
FIZZBUZZ = lambda n : (IF(ISZERO(MOD(n)(FIFTEEN)))("FIZZBUZZ")((IF(ISZERO(MOD(n)(FIVE)))("BUZZ")((IF(ISZERO(MOD(n)(THREE)))("FIZZ")(toInteger(n)))))))

print("FB 3 ->", FIZZBUZZ(THREE))
print("FB 5 ->", FIZZBUZZ(FIVE))
print("FB 15 ->", FIZZBUZZ(FIFTEEN))
print("FB 4 ->", FIZZBUZZ(FOUR))