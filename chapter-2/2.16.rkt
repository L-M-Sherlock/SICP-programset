#lang racket

;;We should deal with the dependent interval. A/A must equal 1.

;;Method 1: Give every interval an "indentity". But it is still hard to design. For example, if (A+B)/(B+A) appear in the calculation,
;;our function should give every interval in progress an "indentity" and make sure A+B and B+A are the same!(in addition, if A+B = A+C,
;;the function should distinguish them.

;;Method 2: Avoid repeating the same interval. It means we should use Taylor's expansion. But it just throws the problem to users.

;;Method 3: Use a list of random number in interval to instead interval. It is similar to Monte-Carlo Simulation.