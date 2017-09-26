function AAA = calculaterobotmotion(MDH, A)
%CALCULATEROBOTMOTION AAA � conjunto de hipermatrizes que calculam
% as transforma��es todas para todos os elos da matriz de DH. [dim(AAA)=4]
% � Esta fun��o simplesmente coloca numa �superhipermatriz� todas as transforma��es dos elos associdadas � MDH
    for k = 1:size(MDH,3)
        AAA(:,:,:,k) = Tlinks(MDH(:,:,k)); 
        AAA(:,:,1,k) = A * AAA(:,:,1,k);
    end
end

