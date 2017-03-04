-module(second).

-export([hypotenuse/2, perimeter/2, area/2, xOr/2, xOr2/2, xOr3/2, maxThree/3, howManyEqual/3]).

hypotenuse(A, B) ->
  C2 = first:square(A) + first:square(B),
  math:sqrt(C2).

perimeter(A, B) ->
  C = hypotenuse(A,B),
  A + B + C.

area(A, B) ->
  C = hypotenuse(A, B),
  first:area(A, B, C).

xOr(A, B) ->
  A =/= B.

xOr2(A, B) ->
  not(A == B).

xOr3(A, B) ->
  A and not(B) or not(A) and B.

maxThree(A, B, C) ->
  MaxAB = max(A, B),
  max(MaxAB, C).

howManyEqual(A, A, A) ->
  3;
howManyEqual(A, A, _) ->
  2;
howManyEqual(A, _, A) ->
  2;
howManyEqual(_, A, A) ->
  2;
howManyEqual(_, _, _) ->
  0.
