function [ H ] = DrawFrames1( AA, P, A)
%DRAWFRAMES1 Summary of this function goes here
%   A fun¸c˜ao deve desenhar gr´aficos que representam outros objetos
% associados aos elos, como os referenciais (sistemas de coordenadas).
% Desenha os sistemas de coordenadas todos do robˆo. O objeto P,
% obtido por “seixos.m”, ou outro, dever´a ser desenhado em cada elo.
% A hipermatriz AA tem as transforma¸c˜oes que permitir˜ao calcular as
% posi¸c˜oes dos objetos a desenhar. H ´e um vetor de handles gr´aficos
% para todos os sistemas desenhados.
% Devem desenhar-se tamb´em o primeiro (da base) e o ´ultimo (m˜ao)
% sistemas de coordenadas.
saa = size(AA,3);
H = zeros(1,saa);
P1 =  A * P;
H(1) = fill3(P1(1,:),P1(2,:),P1(3,:),'b');
%P1 = zeros(size(P));
%A = eye(4);
for k = 1:saa 
    A = A * AA(:,:,k);
    P1 =  A * P;
    H(k+1) = plot3(P1(1,:),P1(2,:),P1(3,:),'color',[0.092*k, 0.08*k, 0.9/k] );
end

