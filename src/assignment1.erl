-module(assignment1).
-export([perimeter/1, area/1, enclose/1, bits/1, bits_tail/1]).

perimeter({circle, R})
  -> 2 * math:pi() * R;
perimeter({rectangle, H, W})
  -> 2 * (H + W);
perimeter({triangle, A, B, C})
  -> A + B + C.

area({circle, R})
  -> math:pi() * R * R;
area({rectangle, H, W})
  -> H * W;
area({triangle, A, B, C})
  -> S = (A + B + C) / 2,
  math:sqrt(S * (S - A) * (S - B) * (S - C)).

%for a circle the smallest enclosing rectangle will be a square with a side equal to a circle diameter (2 * radius)
enclose({circle, R})
  -> {rectangle, 2 * R, 2 * R};
%for a rectangle the smallest enclosing rectangle will be the same rectangle itself ...
enclose({rectangle, H, W})
  -> {rectangle, H, W};

%for a triangle the smallest enclosing rectangle will be a rectangle with one side equal to one of the sides of a triangle,
%and a height (which has to be calculated - from the following formula:
% Area = 1/2 * Base * Height, so after some conversion it will be:
% Height = (2 * Area) / Base

enclose({triangle, A, B, C})
  -> Area = area({triangle, A, B, C}),
  H = (2 * Area) / A,
  {rectangle, A, H}.

% the calculation of bits set to 1 in a number is based on a remainder from a division by 2,
% as if the remainder of such division is equal to 1, then there is a bit set to 1.
% in next steps the initial number is divided by two, until it will be 0 (that's only possible if the initial number was 0)
% # or 1 - which is a base case.
bits(N) when N < 2 ->
  N;
bits(N) ->
  bits(N div 2) + bits(N rem 2).

% below, tail-recursive version for counting bits set in a number is heavily based on the above, direct recursive version.
% three parameters in a recursive version are:
% * Q & R - which contain (Q)uotient and (R)emainder from a previous call.
% * A - used to accumulate the number of bits set to 1.

bits_tail(N) ->
  bits_tail(N div 2, N rem 2, 0).
bits_tail(Q, R, A) when Q < 2 ->
  Q + R + A;
bits_tail(Q, R, A) ->
  bits_tail(Q div 2, Q rem 2, A + R).
