-module(assignment1).
-export([perimeter/1, area/1]).

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
area({triangle, A, B, _}) %assuming that triangle is a right angle triangle and A & B are his cathetuses
  -> (A * B) / 2.

