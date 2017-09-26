function [ MDH ] = GenerateMultiDH( DH, MQ , t)
%GenerateMultiDH( DH, MQ )
%A func~ao permite obter as matrizes DH concretizadas (sem variaveis)
%para as diversas posic~oes das juntas de um rob^o. Essas diversas
%matrizes DH devem vir numa hipermatriz.
%Descric~ao dos par^ametros e retorno da func~ao:
%MDH - hipermatriz de matrizes DH definidas para os diversos vetores
%coluna de MQ.
%DH - A matriz base de Denavit-Hartenberg que corresponde a posic~ao
%zero do rob^o (juntas no valor de home position)
%MQ - dado por Linespacevect(Qi, Qf, N)
%Qi e Qf - vetores dos valores iniciais e finais das juntas
%N - numero de colunas de MQ, i.e., numero de posic~oes a calcular.
    l1 = size(DH,1);
    l2 = size(MQ,2);
    
    if nargin < 3
        t = zeros(l1,1);
    end
    t=~~t;
    MDH = zeros(l1,4,l2); 
    
    for n = 1 : l2
        MDH(:,:,n) = [DH(:,1)+MQ(:,n).*(~t), DH(:,2),DH(:,3)+MQ(:,n).*(t), DH(:,4)];
    end

end

