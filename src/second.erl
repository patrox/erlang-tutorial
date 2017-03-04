-module(second).

-export([hypotenuse/2, perimeter/2, area/2, xOr/2, xOr2/2, xOr3/2]).

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
