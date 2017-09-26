function [ h ] = dispobj( obj )
%=============================================================================%
%DISPOBJ dispobj( obj ) - Desenha um objeto na celula
%   Output h
%=============================================================================%
    if obj.tp < 2
        if isempty(obj(1).TP)
             P = obj.P;
        else
             P = obj.TP;
        end
        f = obj.f;
        fc = obj.fc;
        h = patch('Vertices', P, 'Faces',  f, ...
           'FaceVertexCData', fc, 'FaceColor', 'flat');
    else
        h = DrawLinks(obj.Org);
    end
end

