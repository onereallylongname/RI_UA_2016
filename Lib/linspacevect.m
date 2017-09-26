function [ MQ ] = linspacevect(Qi, Qf, N)
%LINESPACEVECT linespacevect(Qi, Qf, N)
%   A func~ao deve emular a operac~ao de linspace sobre vetores.
% Qi - vetor dos valores iniciais
% Qf - vetor dos valores finais
% N - numero de elementos de cada linspace
% MQ - matriz com todos os vetores - cada linha sera o linspace dos
% elementos correspondentes de Qi ate Qf.
    l1 = length(Qi);
    l2 = length(Qf);
    if l1 ~= l2
        error('LQ1 != LQ2, vectores tem que ter o mesmo comp')
    else
        MQ = zeros(size(Qi,1) ,N);
        for n = 1:l1
            MQ(n,:) = linspace(Qi(n),Qf(n),N); 
        end
    end
end

