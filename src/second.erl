-module(second).

-export([hypotenuse/2, perimeter/2]).

hypotenuse(A,B) ->
  C2 = first:square(A) + first:square(B),
  math:sqrt(C2).

perimeter(A,B) ->
  C = hypotenuse(A,B),
  A + B + C.
