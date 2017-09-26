function [Jinv] = jacoinvRRRRR(Q, L)

J = JacoRRRRR( Q, L );

Jinv = pinv(J);

end