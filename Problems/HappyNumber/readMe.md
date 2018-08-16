# Happy number Problem

## What is a Happy Number?

A number is happy when in an iterative process of summing of the squares of contituants digits results in 1.

for example: 19

19   =>  1 & 9   => 1^2 + 9^2   => 1 + 81   => 82

82   =>  8 & 2   => 8^2 + 2^2   => 64 + 4   => 68

68   =>  6 & 8   => 6^2 + 8 ^2   => 36 + 64   => 100

100   =>  1 & 0 & 0   => 1^2 + 0^2 + 0^2   => 1 + 0 + 0   => 1

so 19 is happy.


Some propertie of happy numbers are.

1. If a number is happy its always is happy. (determinisitic and cachable)
2. All the intermediates which are generated as part of caluculation (82, 68, 100) are also happy.


