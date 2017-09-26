function [obj, QA, QB, QC, Jt1, Jt2, F1, F2] = makecellpath_a(obj, MM, dt)
%=============================================================================%        
%MAKECELLPATH Calcula os movimentos dos robos e cria vetores e matrizes
%para o movimento.
%=============================================================================%        
global GCONFIG
if GCONFIG(1); str = sprintf('>>> Calculating movement ... 0%%'); disp(str);end
%=============================================================================%
%> Variáveis de configuração
%=============================================================================%        
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

VARX = MM(3,4)/100;
VARZ = MM(3,5)/100;
DY = (30-L);
DZ = (H-5);

F = GCONFIG(2);

%=============================================================================%
%> Cálculo do Scara A
%=============================================================================%        
PPP = changecoord(obj(3).P0,obj(10));           %Obter as coodenadas do suporte (obj(3)) no referencial do scara
A00 = [PPP(1),PPP(2),PPP(3)+H+10, pi]';
A0 = [0,0,0,pi]';        %Ponto inicial
P  = [A0 A00];                %Matriz de coordenadas do movimento
ta = [5 5];               %Vetor de incremento de tempo de cada movimento
for k = 4:9
    PPP = changecoord(obj(k).P0,obj(10));           %Obter as coodenadas da peça (obj(k)) no referencial do scara
    A1 = [PPP(1),PPP(2),PPP(3)+H+10, pi/2]';
    t1 = 3;
    A2 = [PPP(1),PPP(2),PPP(3), pi/2]';
    t2 = 2;
    A3 = A1;
    t3 = 15;
    PPP = changecoord(obj(3).P0,obj(10));           %Obter as coodenadas do suporte (obj(3)) no referencial do scara
    A4 = [PPP(1),PPP(2),PPP(3)+H+10, 0]';
    t4 = 3;
    A5 = [PPP(1),PPP(2),PPP(3)+H, 0]';
    t5 = 2;
    A6 = A4;
    t6 = 15;
    P  = [P,  A1, A2, A3, A4, A5, A6];
    ta = [ta, t1, t2, t3, t4, t5, t6];
end
    P  = [P A0];
    ta = [ta 1]; 
    ty = zeros(length(ta),1);
    ty(1)=ta(1);
    for n=2:length(ta)
        ty(n)=ty(n-1)+ta(n);
    end
    N = ta/dt;
    Qm = Multi_invkinScara(P,L1,'A');
    Qm = Qm(:,2,:);
    Q  = Qm(:,:);
    Q(2,:) = mod(Q(2,:),2*pi);
    [QQ, t] = MultiPolyTrajV_a(Q, N, ty);
    MDH = GenerateMultiDH(obj(10).DH, QQ,obj(10).j);
    obj(10).AAA = calculaterobotmotion(MDH, obj(10).T);
    [obj(10).xyz(:,1),obj(10).xyz(:,2),obj(10).xyz(:,3)] = RobotEndPath( obj(10).AAA(:,:,1:5,:));
    QQ = [[0,0,0,0,0,0]', QQ];
    QA = diff(QQ,1,2);
    if GCONFIG(1); str = sprintf('>>> Scara A calculated ... 31.1%%'); disp(str);end
%=============================================================================%
%> Cálculo do Scara B
%=============================================================================% 
    A0 = [0,0,0,pi]';        %Ponto inicial
    PPP = changecoord(obj(3).P0,obj(11));           %Obter as coodenadas da peça (obj(k)) no referencial do scara
    A00 = [PPP(1),PPP(2)+45,PPP(3)+H+10, 0]';
    P  = [A0 A00];                %Matriz de coordenadas do movimento
    ta = [41 15];                %Vetor de incremento de tempo de cada movimento
for k = 4:9
    PPP = changecoord(obj(3).P0,obj(11));           %Obter as coodenadas da peça (obj(k)) no referencial do scara
    A1 = [PPP(1),PPP(2),PPP(3)+H+10, 0]';
    t1 = 2;
    A2 = [PPP(1),PPP(2),PPP(3)+H, 0]';
    t2 = 3;
    A3 = A1;
    t3 = 15;
    PPP = changecoord(obj(k).Pf ,obj(11));           %Obter as coodenadas do suporte (obj(3)) no referencial do scara
    A4 = [PPP(1),PPP(2),PPP(3)+10+H, -pi/2]';
    t4 = 3;
    A5 = [PPP(1),PPP(2),PPP(3), -pi/2]';
    t5 = 2;
    A6 = A4;
    t6 = 15;
    P  = [P,  A1, A2, A3, A4, A5, A6];
    ta = [ta, t1, t2, t3, t4, t5, t6];
end
    P  = [P A0];
    ta = [ta 1];
    ty = zeros(length(ta),1);
    ty(1)=ta(1);
    for n=2:length(ta)
        ty(n)=ty(n-1)+ta(n); 
    end
    N = ta/dt;
    Qm = Multi_invkinScara(P,L1,'C');
    Qm = Qm(:,2,:);
    Q  = Qm(:,:);
    [QQ, t] = MultiPolyTrajV_a(Q, N, ty);
    MDH = GenerateMultiDH(obj(11).DH, QQ,obj(11).j);
    obj(11).AAA = calculaterobotmotion(MDH, obj(11).T);
    [obj(11).xyz(:,1),obj(11).xyz(:,2),obj(11).xyz(:,3)] = RobotEndPath( obj(11).AAA(:,:,1:5,:));
    QQ = [[0,0,0,0,0,0]', QQ];
    QC = diff(QQ,1,2);
    if GCONFIG(1); str = sprintf('>>> Scara C calculated ... 66.2%%'); disp(str);end
%=============================================================================%
% >>> Cálculo do RRR+RR <<<
%=============================================================================% 
    [R, P] = getRP(MM);
    time2 = [33 73  113 153 193 233
         58 98  138 178 218 258];
    nit = time2/dt;
    R2=[0 0 0
    0 0 0
    0 0 1];
    P0 = [0; 0; 0];
    L = MM(2,:);
    DH0 = makeDHRRRRR(L);
%=============================================================================%
%> Pontos de passagem do RRR+RR 
%=============================================================================% 
    P1 = P  + [45*VARX/2;15;15];
    P2 = P1 - [0;15;15];
    P3 = P2 + [-45*VARX/2;0;0];
    P4 = P  + [-45*VARX/2;15;15];
    P5 = P  + [0; -DY*VARZ/2; DZ*VARZ/2];
    P6 = P  - [0; -DY*VARZ/2; DZ*VARZ/2];
    
    Qf = invkinRRRRR(obj, L, R, P1);
    Qi = invkinRRRRR(obj, L, R2, P0);
    MQ  = linspacevect(Qi',Qf', nit(1));
    MQ1 = [];
    Q = invkinRRRRR(obj, L, R, P2);
    MQ1 = [MQ1 linspacevect(Qf',Q', 2/dt)];

    tvar = linspace(0,8,8/dt);
    x = (-45*VARX/8)*tvar;
    y = P2(2)*ones(1,length(tvar));
    z = P2(3)*ones(1,length(tvar));
    Q1 = Q;
    Dq = [];
    juntas = [];
    for k = 1:length(tvar)-1
        dr = [x(k+1)-x(k);y(k+1)-y(k);z(k+1)-z(k)];
        drr = ((dr/(sum(dr.^2,1).^0.5)).*F);
        JI = jacoinvRRRRR(Q1(:,k), L);
        J  = JacoRRRRR(Q1(:,k), L);
        juntas = [juntas J'*drr];
        dq(:,k) = JI*dr;
        Dq = [Dq dq(:,k)];
        Q1(:,k+1) = Q1(:,k)+dq(:,k);
    end
      
    Jt1 = juntas;
    F1 = drr;
    
    MQ1 = [MQ1 Q1];

    Q = invkinRRRRR(obj, L, R, P4);
    MQ1 = [MQ1 linspacevect(MQ1(:,end)',Q', 2/dt)];
    Q = invkinRRRRR(obj, L, R, P5);
    MQ1 = [MQ1 linspacevect(MQ1(:,end)',Q', 2/dt)];
    
    tvar = linspace(0,8,8/dt);
    x =  P5(1)*ones(1,length(tvar));
    y = (DY*VARZ/8)*tvar;
    z = (-DZ*VARZ/8)*tvar;
        
    Q1 = Q;
    Dq = [];
    juntas = [];
    for k = 1:length(tvar)-1
        dr = [x(k+1)-x(k);y(k+1)-y(k);z(k+1)-z(k)];
        drr = ((dr/(sum(dr.^2,1).^0.5)).*F);
        JI = jacoinvRRRRR(Q1(:,k), L);
        J  = JacoRRRRR(Q1(:,k), L);
        juntas = [juntas J'*drr];
        dq(:,k) = JI*dr;
        Dq = [Dq dq(:,k)];
        Q1(:,k+1) = Q1(:,k)+dq(:,k);
    end
    
    Jt2 = juntas;
    F2 = drr;
    
    MQ1 = [MQ1 Q1];
    Q = invkinRRRRR(obj, L, R, P1);
    MQ1 = [MQ1 linspacevect(MQ1(:,end)',Q', 0.8/dt)];
    MQ1 = [MQ1 linspacevect(MQ1(:,end)',Q', 17/dt)];
    MQ = [MQ MQ1 MQ1 MQ1 MQ1 MQ1 MQ1];
    
    Q = invkinRRRRR(obj, L, R, P0);
    MQ = [MQ linspacevect(MQ(:,end)',Q', 18/dt)];

    MDH = GenerateMultiDH(DH0, MQ);
    obj(12).AAA = calculaterobotmotion(MDH, obj(12).T);
    [obj(12).xyz(:,1),obj(12).xyz(:,2),obj(12).xyz(:,3)] = RobotEndPath( obj(12).AAA(:,:,1:5,:) );
    QQ = MQ;
    QQ = [[0,0,0,0,0]', QQ];
    QB = diff(QQ,1,2);
   if GCONFIG(1); str = sprintf('>>> RRR+RR calculated ... 100%%'); disp(str);end
end

