function [ QQ, t ] = PolyTrajV_a( Q0,Qf,Qv0,Qvf,N,t0,tf )
%POLYTRAJV Summary of this function goes here
%• Q0 – vetor da posição inicial das juntas
%• Qf – vetor da posição final das juntas
%• Qv0 – vetor da velocidade inicial das juntas
%• Qvf – vetor da velocidade final das juntas
%• t0 – instante inicial da trajetória (segundos)
%• tf – instante final da trajetória (segundos)
%• N – número de pontos a usar na definição da trajetória

if tf == t0
    QQ = NaN;
end

t = linspace(t0,tf,N);

for k = 1:length(Q0)
    q0 = Q0(k);
    qf = Qf(k);
    v0 = Qv0(k);
    vf = Qvf(k);
    
    a0 = q0;
    a1 = v0;
    a2 = ((3*(qf-q0)/(tf-t0)^2)-(2*v0+vf)/(tf-t0));
    a3 = ((-2*(qf-q0)/(tf-t0)^3)+((vf+v0)/(tf-t0)^2));

    QQ(k,:) = a0 + a1*(t-t0)+ a2*((t-t0).^2)+a3*((t-t0).^3);

end

