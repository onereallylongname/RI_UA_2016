function [obj] = makeobjcell(MM)
%=============================================================================%
%  makeobjcell(MM) - Cria os objectos e os robos
%  MM - matriz de configuração
%  obj - estrutura de dados com robos e objetos
%   Tipos de objectos - .tp
%   '-> 0 - Nao se move;
%   '-> 1 - Move-se, peça a maquinar
%   '-> 2 - Scara
%   '-> 3 - Antropomórfico.
%=============================================================================%
global GCONFIG
if GCONFIG(1); pre = 0; disp('>>> Creating OBJECTS ... 0%');end
%=============================================================================%
%> Objeto 1 x2
%=============================================================================%
obj = struct;
for n = 1:2
    [obj(n).P, obj(n).f, obj(n).fc, obj(n).P0] = makeobj(1); 
    obj(n).tp = 0;
    obj(n).T  = []; 
    obj(n).TP = []; 
    if GCONFIG(1); pre = pre+ 7.7; str = sprintf('>>> Obj %d created ... %0.1f%%',n, pre); disp(str);end
end

%=============================================================================%
%> Objeto 2 x1
%=============================================================================%
[obj(3).P, obj(3).f, obj(3).fc, obj(3).P0] = makeobj(2,MM(3,1)); 
obj(3).tp = 0;
obj(3).T  = [];
obj(3).TP = []; 
if GCONFIG(1);pre = pre + 7.7;  disp('>>> Obj 3 created ... 23.1%');end
%=============================================================================%
%> Objeto 3 x6
%=============================================================================%
for n = 4:9
    [obj(n).P, obj(n).f, obj(n).fc, obj(n).P0] = makeobj(3,MM(3,2:3)); 
    obj(n).tp = 1;
    obj(n).T  = [];
    obj(n).TP = []; 
    if GCONFIG(1); pre = pre+ 7.7; str = sprintf('>>> Obj %d created ... %0.1f%%',n, pre); disp(str);end
end

%=============================================================================%
%> Scara x2
%=============================================================================%
for n = 10:11
    obj(n).DH = makeDHScara(MM(1,:)); 
    obj(n).tp = 2;
    obj(n).j = [0 0 0 0 1 1]';
    obj(n).T  = [];
    obj(n).TP = [];
    obj(n).P = [MM(1,2)+MM(1,3), 0, MM(1,1)-MM(1,4)];
    obj(n).P0 = [0,0,0];
    obj(n).xyz = [];
    obj(n).AAA = [];
    if GCONFIG(1); pre = pre+ 7.7; str = sprintf('>>> Obj %d created ... %0.1f%%',n, pre); disp(str);end
end
%=============================================================================%
%> RRR+RR x1
%=============================================================================%
    obj(12).DH = makeDHRRRRR(MM(2,:)); 
    obj(12).tp = 3;
    obj(12).j = [0 0 0 0 0 0]';
    obj(12).T  = [];
    obj(12).TP = []; 
    obj(12).P = [MM(1,3), 0, MM(1,1)+MM(1,2)]; 
    obj(12).P0 = [0,0,0];
    obj(n).AAA = [];
    obj(12).xyz = [];
    if GCONFIG(1);pre = pre +7.7; disp('>>> Obj 12 created ... 100%');end

end

