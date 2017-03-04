-module(first).
-export([mult/2, double/1, area/3]).

mult(X,Y) ->
  X*Y.

double(X) ->
  mult(X, 2).

area(A,B,C) ->
  S = (A+B+C)/2,
  math:sqrt(S*(S-A)*(S-B)*(S-C)).

