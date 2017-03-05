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
%assuming that triangle is a right angle triangle and A & B are his cathetuses
area({triangle, A, B, _})
  -> (A * B) / 2.

%for a circle the smallest enclosing rectangle will be a square with a side equal to a circle diameter (2 * radius)
enclose({circle, R})
  -> {rectangle, 2 * R, 2 * R};
%for a rectangle the smallest enclosing rectangle will be the same rectangle itself ...
enclose({rectangle, H, W})
  -> {rectangle, H, W};
%assuming that triangle is a right angle triangle and A & B are his cathetuses
enclose({triangle, A, B, _})
  -> {rectangle, A, B}.

bits(N) when N < 2 ->
  N;
bits(N) ->
  bits(N div 2) + bits(N rem 2).

bits_tail(N) ->
  bits_tail(N div 2, N rem 2, 0).
bits_tail(D, R, A) when D < 2 ->
  D + R + A;
bits_tail(D, R, A) ->
  bits_tail(D div 2, D rem 2, A + R).
