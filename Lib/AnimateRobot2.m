function [] = AnimateRobot2(h, AAA, sd, pos)
%ANIMATEROBOT Summary of this function goes here
%   H � handles gr�ficos dos objetos a animar (desenhados por
% DrawFrames)
% � AAA � superhipermatriz que cont�m a sequ�ncia temporal de
% hipermatrizes calculadas por CalculateRobotMotion;
% � Obj � objeto a representar (sistema coordenadas - seixos) � � passado
% aqui para se recalcular dinamicamente a sua postura para fazer a
% representa��o;
% � h � handle gr�fico dos elos do rob� (de DrawLinks)
% � sd � indicador do n�vel de pausa entre passos da anima��o (controla a
% velocidade da anima��o).

    
    for k = 1:size(AAA,4)
%         A = eye(4);
%         for kk = 1:size(AAA,3)
%             A = A * AAA(:,:,kk,k);
%             P = A * Obj;
%             set(H(kk+1),'Xdata',P(1,:),'Ydata',P(2,:),'Zdata',P(3,:));
%         end
        %AAA(:,:,1,k) = pos*AAA(:,:,1,k);
        org = LinkOrigins2(AAA(:,:,:,k), pos);
        set(h,'Xdata',org(1,:),'Ydata',org(2,:),'Zdata',org(3,:));
        pause(sd);
    end
end

