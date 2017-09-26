function AAA = calculaterobotmotion(MDH, A)
%CALCULATEROBOTMOTION AAA – conjunto de hipermatrizes que calculam
% as transformações todas para todos os elos da matriz de DH. [dim(AAA)=4]
% – Esta função simplesmente coloca numa “superhipermatriz” todas as transformações dos elos associdadas à MDH
    for k = 1:size(MDH,3)
        AAA(:,:,:,k) = Tlinks(MDH(:,:,k)); 
        AAA(:,:,1,k) = A * AAA(:,:,1,k);
    end
end

