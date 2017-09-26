function [HH, fignum] = dispcell( obj )
%=============================================================================%
%DISPCELL dispcell( obj ) - Cria uma figura com a celula
%=============================================================================%
    fignum = figure;
    hold on
    HH = zeros(1,length(obj));
    for n = 1:length(obj)
        HH(n) = dispobj(obj(n));  
    end
    axis equal
    hold off
    grid off
end

