function [h] = DrawLinks(org)
%DRAWLINKS Summary of this function goes here
%   A fun¸c˜ao deve desenhar um gr´afico que representa os elos do robˆo.
%Esse gr´afico pode ser uma simples linha poligonal representando os
%elos. Org ´e uma matriz onde em cada coluna est˜ao os pontos
%extremos dos elos do robˆo; h ´e o handle gr´afico da linha desenhada.

h = plot3(org(1,:),org(2,:),org(3,:),'bo--','LineWidth',4,...
                       'MarkerEdgeColor','b',...
                       'MarkerFaceColor','k',...
                       'MarkerSize',5);
grid on;
    if(org(3,:)==0)
        view(0,90)
    else
        view(30,25)
    end

end

