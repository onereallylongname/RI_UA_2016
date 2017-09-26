function [ A ] = Tlinks( DH )
%TLINK Tlinks(DH)
%   Aceita uma matriz de Denavit-Hartenberg (DH) e devolve uma
%matriz de transforma¸c˜ao para cada elo (linha de DH) dispostas ao
%longo da 3a dimens˜ao da hipermatriz AA.
%Invoca a fun¸c˜ao Tlink() anterior.
m = size(DH,1);
A = zeros(4,4,m);
for k = 1:m
A(:,:,k)=Tlink(DH(k,:));
end

