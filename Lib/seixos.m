function P = seixos(f)
%% Objectos para representar sistemas de coordenadas
%% de forma não ambígua. Possibilidade de usar um 
%% objecto único para os 3 eixos.  V. Santos, Oct 2007, 2010.
if nargin < 1
    f =0.5;
end
%% Definicao parcial de cada sub-objecto (eixo)
Xpart = [
 0  0.05   0.5   0.4  0.5  0.6   0.7  0.8  0.7   1     1    1.5 1   1     0.7  0.8  0.7  0.6  0.5  0.4  0.5  0.05
 0 -0.05  -0.05 -0.2 -0.2 -0.05 -0.2 -0.2 -0.05 -0.05 -0.2  0   0.2 0.05  0.05 0.2  0.2  0.05 0.2  0.2  0.05 0.05
 0  0      0     0    0    0     0     0   0     0      0   0   0   0     0      0    0    0   0    0    0    0
 ];

Ypart = [
0 0.05 0.05 0.2 0.2 0.05 0.05 0.2 0   -0.2 -0.05 -0.05 -0.2 -0.2 -0.05 -0.05
0 0.05 0.6  0.7 0.8 0.7  1    1   1.5 1     1     0.7   0.8  0.7  0.6   0.05
0 0    0    0   0   0    0    0   0   0     0     0     0    0    0     0 
 ];

Zpart = [
     0   0     0      0     0    0    0     0     0     0   0   0   0    0    0   0    0    0    0     0    0
     0  -0.05 -0.05  -0.2  -0.2 -0.1 -0.1  -0.05 -0.05 -0.2 0   0.2 0.05 0.05 0.2 0.2  0.1  0.1  0.05  0.05 0.05
     0   0.05  0.55   0.45  0.8  0.8  0.62  0.66  1     1   1.5 1   1    0.7  0.8 0.45 0.45 0.62 0.58  0.5  0.05
]; 
 
%% Concatenacao dos tres objectos num so'
X = [ Xpart(1,:) Ypart(1,:) Zpart(1,:) ];
Y = [ Xpart(2,:) Ypart(2,:) Zpart(2,:) ];
Z = [ Xpart(3,:) Ypart(3,:) Zpart(3,:) ];

%%Para operar com transformações homogéneas deve-se concatenar tudo e homogeneizar
P=[ f*X; f*Y; f*Z; ones(1,size(X,2))];


