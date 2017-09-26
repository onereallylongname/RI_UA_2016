function [obj ] = makecell1(obj, MM)
%=============================================================================%
%MAKECESLL1(obj, MM) Constroi a celula
%   obj - Estrutura de dados dos objetos
%   MM - matriz de configuração
%=============================================================================%
global GCONFIG
if GCONFIG(1); pre = 0; disp('>>> Creating Cell ... 0%');end
L1  = MM(1,1:4);
L2  = MM(2,:);
HS  = MM(3,1);
L   = MM(3,2);
H   = MM(3,3);
DSC = MM(4,1);
DSP = MM(4,2);
DSS = MM(4,3);
DAS = MM(4,4);
OX = 100;
OY = 100;
%=============================================================================%
%> fazer chão - obj(13)
%=============================================================================%
dimflr(1) = DSC+2*96+2*DSP+200;
dimflr(2) = 48+DSS+DAS+sum(L2())+100;
dimflr(3) = sum(L2)+40;
obj(13).tp = 0;
[obj(13).TP, obj(13).f, obj(13).fc, dummy] = makeobj(0,dimflr);

%> Coord 1-9
x = zeros(1,9);
y = zeros(1,9);
z = zeros(1,9);
teta = zeros(1,9);
%=============================================================================%
%> fazer Obj 1-9
%=============================================================================%
%Obj 1
x(1) = OX;
y(1) = OY;
z(1) = 0;
teta(1) = 0;
    if GCONFIG(1); str = sprintf('>>> Obj 1 created ... 7.7%%'); disp(str);end
%Obj 2
x(2) = OX + 96 + DSP*2 + DSC;
y(2) = OY;
z(2) = 0;
teta(2) = 0;
    if GCONFIG(1); str = sprintf('>>> Obj 2 created ... 15.4%%'); disp(str);end
%Obj 3
x(3) = OX + 96 + DSP + DSC/2 - 45/2;
y(3) = OY + 45 + DSS - 15;
z(3) = 0;
teta(2) = 0;
    if GCONFIG(1); str = sprintf('>>> Obj 3 created ... 23.1%%'); disp(str);end
%Obj 4
x(4) = OX + 96 + DSP*2 + DSC - 5 + 30;
y(4) = OY + 45/2;
z(4) = 10 + H;
teta(4) = pi;
xf(4) = OX + 96 + 5 - 30;
yf(4) = OY + 45/2;
zf(4) = 10 + H;
tetaf(4) = 0;
    if GCONFIG(1); str = sprintf('>>> Obj 4 created ... 30.5%%'); disp(str);end
%Obj 5
x(5) = OX + 96 + DSP*2 + DSC - 5 + 30;
y(5) = OY + 45/2 + 45 + 3;
z(5) = 10 + H;
teta(5) = pi;
xf(5) = OX + 96 + 5 - 30;
yf(5) = OY + 45/2 + 45 + 3;
zf(5) = 10 + H;
tetaf(5) = 0;
    if GCONFIG(1); str = sprintf('>>> Obj 5 created ... 38.5%%'); disp(str);end
%Obj 6
x(6) = OX + 96 + DSP*2 + DSC - 5 + 30 + 1.5 + 30;
y(6) = OY + 45/2;
z(6) = 10 + H;
teta(6) = pi;
xf(6) = OX + 96 + 5 - 30 - 1.5 - 30;
yf(6) = OY + 45/2;
zf(6) = 10 + H;
tetaf(6) = 0;
    if GCONFIG(1); str = sprintf('>>> Obj 6 created ... 46.2%%'); disp(str);end
%Obj 7
x(7) = OX + 96 + DSP*2 + DSC - 5 + 30 + 1.5 + 30;
y(7) = OY + 45/2 + 45 + 3;
z(7) = 10 + H;
teta(7) = pi;
xf(7) = OX + 96 + 5 - 30 - 1.5 - 30;
yf(7) = OY + 45/2 + 45 + 3;
zf(7) = 10 + H;
tetaf(7) = 0;
    if GCONFIG(1); str = sprintf('>>> Obj 7 created ... 53.9%%'); disp(str);end
%Obj 8
x(8) = OX + 96 + DSP*2 + DSC - 5 + 30 + 1.5 + 30 + 1.5 + 30 + 1.5;
y(8) = OY + 45/2;
z(8) = 10 + H;
teta(8) = pi;
xf(8) = OX + 96 + 5 - 30 - 1.5 - 30 - 1.5 - 30 - 1.5;
yf(8) = OY + 45/2;
zf(8) = 10 + H;
tetaf(8) = 0;
    if GCONFIG(1); str = sprintf('>>> Obj 8 created ... 61.6%%'); disp(str);end
%Obj 9
x(9) = OX + 96 + DSP*2 + DSC - 5 + 30 + 1.5 + 30 + 1.5 + 30 + 1.5;
y(9) = OY + 45/2 + 45 + 3;
z(9) = 10 + H;
teta(9) = pi;
xf(9) = OX + 96 + 5 - 30 - 1.5 - 30 - 1.5 - 30 - 1.5;
yf(9) = OY + 45/2 + 45 + 3;
zf(9) = 10 + H;
tetaf(9) = 0;
    if GCONFIG(1); str = sprintf('>>> Obj 9 created ... 69.3%%'); disp(str);end
%> Obj(1:9)
for n = 1:9
    [obj(n).TP, obj(n).T(:,:,1)] = transformobj(obj(n).P, x(n), y(n), z(n), teta(n));
    if n >= 4
       obj(n).Pf =  transformobj(obj(n).P0, xf(n), yf(n), zf(n), tetaf(n));
    end 
    obj(n).P0 =  transformobj(obj(n).P0, x(n), y(n), z(n), teta(n));
end
%=============================================================================%
%> Fazer Scara - obj 10-11
%=============================================================================%
%> Obj 10 - SCARA1
x(10) = OX + 96 + DSP + DSC;
y(10) = OY + 45;
z(10) = 0;
teta(10) = pi/2;
    if GCONFIG(1); str = sprintf('>>> Obj 10 created ... 77.0%%'); disp(str);end
%> Obj 11 - SCARA1
x(11) = OX + 96 + DSP;
y(11) = OY + 45;
z(11) = 0;
teta(11) = pi/2;
    if GCONFIG(1); str = sprintf('>>> Obj 11 created ... 84.7%%'); disp(str);end
%=============================================================================%
%> Fazer RRR+RR - obj(12)
%=============================================================================%
%> Obj 12 - RRR+RR
x(12) = OX + 96 + DSP + DSC/2;
y(12) = OY + 45 + DSS + DAS;
z(12) = 0;
teta(12) = 0;

%> Obj - 10-12
for n = 10:12
    T = rotz(teta(n));
    T(1:3,4) = [x(n), y(n), z(n)]';
    obj(n).T(:,:,1) = T;
    obj(n).TP = transformobj(obj(n).P, x(n), y(n), z(n), teta(n));
    AA = Tlinks(obj(n).DH);
    obj(n).Org = LinkOrigins(AA,T);
    obj(n).P0 =  transformobj(obj(n).P0, x(n), y(n), z(n), teta(n));
end
    if GCONFIG(1); str = sprintf('>>> Obj 12 created ... 100%%'); disp(str);end

  
end

