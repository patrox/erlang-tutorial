-module(recursion).
-export([factorial/1, factorialSafe/1, fib/1, pieces/1, factorial_tail/1, sum/2, max2/2, perfect/1]).

factorial(0) ->
  1;
factorial(N) ->
  N * factorial(N - 1).

factorialSafe(N) when N >= 0 ->
  factorial(N).

fib(0) ->
  0;
fib(1) ->
  1;
fib(N) when N > 0 ->
  fib(N - 2) + fib(N - 1).

pieces(0) ->
  1;
pieces(N) when N > 0 ->
  N + pieces(N - 1).

factorial_tail(N) ->
  factorial_tail(N, 1).

factorial_tail(0, A) ->
  A;
factorial_tail(N, A) when N > 0 ->
  factorial_tail(N - 1, A * N).

perfect(N) ->
  perfect(N, N div 2, 0).
perfect(N, 0, A) ->
  N == A;
perfect(N, D, A) ->
  case N rem D of
    0 -> perfect(N, D - 1, A + D);
    _ -> perfect(N, D - 1, A)
  end.

sum(F, N) when N >= 0 ->
  sum(F, N, 0).

sum(_, 0, A) ->
  A;
sum(F, N, A) ->
  sum(F, N - 1, A + F(N)).

max2(F, N) when N >= 0 ->
  max2(F, N, F(N)).

max2(_, 0, M) ->
  M;
max2(F, N, M) ->
  max2(F, N - 1, max(M, F(N))).

%%pieces3d(0) ->
%%  1;
%%pieces3d(N) when N > 0 ->

%%  fib(4) ->
%%  fib(2) + fib(3) ->
%%  fib(0) + fib(1) + fib(1) + fib(2) ->
%%  0 + 1 + 1 + fib(0) + fib(1) ->
%%  0 + 1 + 1 + 0 + 1 ->
%%  3
