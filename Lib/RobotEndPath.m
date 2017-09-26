function [X,Y,Z] = RobotEndPath( AAA )
%ROBOTENDPATH Summary of this function goes here
%   A fun¸c˜ao deve determinar o caminho que o robˆo ir´a percorrer no movimento.
% [X,Y,Z] - vetores das coordenadas sucessivas do end-effector do robˆo.
% AAA : a sequˆencia de hipermatrizes calculadas por CalculateRobotMotion.
% As coordenadas s˜ao a extremidade do robˆo, ou seja, a 4ª coluna do produto
% acumulado das transforma¸c˜oes geom´etricas de todos os elos.
    
    X = zeros(1,size( AAA ,4));
    Y = zeros(1,size( AAA ,4));
    Z = zeros(1,size( AAA ,4));
    
    for n =1: size( AAA ,4)
        A = eye(4);
        for j =1: size ( AAA ,3)
            A = A * AAA(:,:,j,n);
        end
        X(n) = A(1,4);
        Y(n) = A(2,4);
        Z(n) = A(3,4);
    end
end

