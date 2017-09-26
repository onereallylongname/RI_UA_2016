function [ org ] = LinkOrigins(AA,A)
%LINKORIGINS Summary of this function goes here
%   Esta fun¸c˜ao deve devolver uma matriz com as origens dos diversos
%sistemas de coordenadas de um manipulador, dada a hipermatriz de
%transforma¸c˜oes obtida com Tlinks().
%Aceita uma hipermatriz AA de matrizes de transforma¸c˜ao geom´etrica
%(uma para cada elo), e devolve as coordenadas das diversas origens
%come¸cando em 0 0 0.

saa = size(AA,3);
org = zeros(3, saa+1);
org(:,1) = A(1:3,4);
%A = eye(4);
for k = 1:saa
    A = A * AA(:,:,k);
    P = A*[0 0 0 1]';
    org(:,k+1) = P(1:3);
end


end

