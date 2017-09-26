function [ J ] = JacoRRRRR( Q, L )
%JACORRRRRR Summary of this function goes here
%   Detailed explanation goes here

q1 = Q(1);
q2 = Q(2);
q3 = Q(3);
q4 = Q(4);
q5 = Q(5);

L1 = L(1);
L2 = L(2);
L3 = L(3);
L4 = L(4);
L5 = L(5);

J =[ - (cos(q3)*sin(q1)*sin(pi/2 + q2) + cos(pi/2 + q2)*sin(q1)*sin(q3))*(L3 + L4) - L5*sin(q5)*(cos(q3)*sin(q1)*sin(pi/2 + q2) + cos(pi/2 + q2)*sin(q1)*sin(q3)) - L2*cos(pi/2 + q2)*sin(q1) - L5*cos(q5)*(cos(q1)*sin(q4) + cos(q4)*(sin(q1)*sin(q3)*sin(pi/2 + q2) - cos(q3)*cos(pi/2 + q2)*sin(q1))), L5*cos(q4)*cos(q5)*(cos(q1)*cos(q3)*sin(pi/2 + q2) + cos(q1)*cos(pi/2 + q2)*sin(q3)) - L2*cos(q1)*sin(pi/2 + q2) - L5*sin(q5)*(cos(q1)*sin(q3)*sin(pi/2 + q2) - cos(q1)*cos(q3)*cos(pi/2 + q2)) - (cos(q1)*sin(q3)*sin(pi/2 + q2) - cos(q1)*cos(q3)*cos(pi/2 + q2))*(L3 + L4), L5*cos(q4)*cos(q5)*(cos(q1)*cos(q3)*sin(pi/2 + q2) + cos(q1)*cos(pi/2 + q2)*sin(q3)) - L5*sin(q5)*(cos(q1)*sin(q3)*sin(pi/2 + q2) - cos(q1)*cos(q3)*cos(pi/2 + q2)) - (cos(q1)*sin(q3)*sin(pi/2 + q2) - cos(q1)*cos(q3)*cos(pi/2 + q2))*(L3 + L4), -L5*cos(q5)*(cos(q4)*sin(q1) + sin(q4)*(cos(q1)*sin(q3)*sin(pi/2 + q2) - cos(q1)*cos(q3)*cos(pi/2 + q2))), L5*sin(q5)*(sin(q1)*sin(q4) - cos(q4)*(cos(q1)*sin(q3)*sin(pi/2 + q2) - cos(q1)*cos(q3)*cos(pi/2 + q2))) + L5*cos(q5)*(cos(q1)*cos(q3)*sin(pi/2 + q2) + cos(q1)*cos(pi/2 + q2)*sin(q3))
   (cos(q1)*cos(q3)*sin(pi/2 + q2) + cos(q1)*cos(pi/2 + q2)*sin(q3))*(L3 + L4) + L2*cos(q1)*cos(pi/2 + q2) - L5*cos(q5)*(sin(q1)*sin(q4) - cos(q4)*(cos(q1)*sin(q3)*sin(pi/2 + q2) - cos(q1)*cos(q3)*cos(pi/2 + q2))) + L5*sin(q5)*(cos(q1)*cos(q3)*sin(pi/2 + q2) + cos(q1)*cos(pi/2 + q2)*sin(q3)), L5*cos(q4)*cos(q5)*(cos(q3)*sin(q1)*sin(pi/2 + q2) + cos(pi/2 + q2)*sin(q1)*sin(q3)) - L5*sin(q5)*(sin(q1)*sin(q3)*sin(pi/2 + q2) - cos(q3)*cos(pi/2 + q2)*sin(q1)) - L2*sin(q1)*sin(pi/2 + q2) - (sin(q1)*sin(q3)*sin(pi/2 + q2) - cos(q3)*cos(pi/2 + q2)*sin(q1))*(L3 + L4), L5*cos(q4)*cos(q5)*(cos(q3)*sin(q1)*sin(pi/2 + q2) + cos(pi/2 + q2)*sin(q1)*sin(q3)) - L5*sin(q5)*(sin(q1)*sin(q3)*sin(pi/2 + q2) - cos(q3)*cos(pi/2 + q2)*sin(q1)) - (sin(q1)*sin(q3)*sin(pi/2 + q2) - cos(q3)*cos(pi/2 + q2)*sin(q1))*(L3 + L4),  L5*cos(q5)*(cos(q1)*cos(q4) - sin(q4)*(sin(q1)*sin(q3)*sin(pi/2 + q2) - cos(q3)*cos(pi/2 + q2)*sin(q1))), L5*cos(q5)*(cos(q3)*sin(q1)*sin(pi/2 + q2) + cos(pi/2 + q2)*sin(q1)*sin(q3)) - L5*sin(q5)*(cos(q1)*sin(q4) + cos(q4)*(sin(q1)*sin(q3)*sin(pi/2 + q2) - cos(q3)*cos(pi/2 + q2)*sin(q1)))
                                                                                                                                                                                                                                                                                                   0,                                                         (cos(q3)*sin(pi/2 + q2) + cos(pi/2 + q2)*sin(q3))*(L3 + L4) + L2*cos(pi/2 + q2) + L5*sin(q5)*(cos(q3)*sin(pi/2 + q2) + cos(pi/2 + q2)*sin(q3)) - L5*cos(q4)*cos(q5)*(cos(q3)*cos(pi/2 + q2) - sin(q3)*sin(pi/2 + q2)),                                                 (cos(q3)*sin(pi/2 + q2) + cos(pi/2 + q2)*sin(q3))*(L3 + L4) + L5*sin(q5)*(cos(q3)*sin(pi/2 + q2) + cos(pi/2 + q2)*sin(q3)) - L5*cos(q4)*cos(q5)*(cos(q3)*cos(pi/2 + q2) - sin(q3)*sin(pi/2 + q2)),                                      L5*cos(q5)*sin(q4)*(cos(q3)*sin(pi/2 + q2) + cos(pi/2 + q2)*sin(q3)),                                                     L5*cos(q4)*sin(q5)*(cos(q3)*sin(pi/2 + q2) + cos(pi/2 + q2)*sin(q3)) - L5*cos(q5)*(cos(q3)*cos(pi/2 + q2) - sin(q3)*sin(pi/2 + q2))];


end

