function [ QQ, t ] = MultiPolyTrajV_a( Q,NN,tt )
%MULTIPOLYTRAJV Summary of this function goes here
%� Q � matriz com os vetores iniciais, finais e interm�dios das posi��es
% a percorrer: [ Qi QA QB ... Qf]
% � As velocidades iniciais e finais s�o zero
% � tt � vetor com os instantes finais de cada via point (espera-se que o
% instante inicial � 0, mas poder� n�o ser...)
% � N � � vetor com os n�meros de pontos a usar em cada sub-trajet�ria
% � QQ � uma matriz que, em cada coluna, tem os valores das juntas
% nos instantes correspondentes, incluindo os via points.
% � t � um vetor com os instantes de tempo correspondentes a todos
% os instantes de amostragem da trajet�ria do in�cio ao fim.

    V = zeros( size(Q) ); %matriz com as velocidades de passagem (inicializado a zero)
    for i=2:size(Q,2)-1 %para calcular velocidades interm�dias come�ar no segundo at� ao pen�ltimo
        dq_1 = (Q(:,i)-Q(:,i-1))/(tt(i)-tt(i-1)); % vetor das velocidades m�dias no tro�o anterior
        dq_2 = (Q(:,i+1)-Q(:,i))/(tt(i+1)-tt(i)); % vetor das velocidades m�dias no tro�o posterior % vetor das velocidades m�dias no tro�o posterior
        m = (sign(dq_1) == sign(dq_2)); %vetor l�gico das velocidades de passagem n�o nulas (m=vetor indexador)
        V(m,i) =( dq_1(m) + dq_2(m) )/2; %atribui��o das velocidades m�dias n�o nulas! Indexa��o engenhosa ?
    end 
    
    for k = 1 : size(Q,2)-1
               
        Q0 = Q(:,k);
        Qf = Q(:,k+1);
        N = NN(k);
        t0 = tt(k);
        tf = tt(k+1);
        Qv0 = V(:,k);
        Qvf = V(:,k+1);
%         Qv0 = zeros(size(Q0));
%         Qvf = Qv0;
        
        [qq, ttt] = PolyTrajV( Q0,Qf,Qv0,Qvf,N,t0,tf);
        if k == 1
            QQ = qq;
            t = ttt;
        else
            QQ = [QQ, qq];
            t = [t, ttt];
        end
    end

end

