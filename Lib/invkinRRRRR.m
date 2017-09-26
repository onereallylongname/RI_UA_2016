function [ Q ] = invkinRRRRR(obj ,L ,R ,P)
%=============================================================================%           
%INVKINRRRRR (obj ,L ,R ,P)
%   Cinematica inversa do RRR+RR
%=============================================================================%           
    PPP = homo2coor(changecoord(P',obj(12)));
%=============================================================================%
%> Determinar coordenadas da ponta do RRR
%=============================================================================%           
    PW = PPP'+L(5)*R(:,3);
    x  = PW(1);
    y  = PW(2);
    z  = PW(3);

    L(3) = L(3)+L(4);

    if ((P(1) == 0) && (P(2) == 0) && (P(3) == 0)) % posição 0
       Q  = [0; 0; 0; 0; 0]; 
    else
%> calcular junta tres
        q3 = acos(((x^2)+(y^2)+((z-L(1))^2)-(L(2)^2)-(L(3)^2))/(2*L(2)*L(3)));
        if imag(q3)~=0
            Q = NaN;
            error('ERRO de cálculo de simulação \n >RRR+RR %c: Posição (%d,%d,%d) fora do alcance do robo',n,P(1),P(2),P(3))
        end
        q3 = [q3,-q3];
%> calcular junta dois
     
        r  = sqrt(x^2+y^2);
        aa =(L(2)+L(3)*cos(q3))*(z-L(1))-r*L(3)*sin(q3);
        bb = ((L(2)+L(3)*cos(q3))*r+L(3)*sin(q3)*(z-L(1)));
        q21 = atan2(aa,bb);

        r  = -r;
        aa = (L(2)+L(3)*cos(q3))*(z-L(1))-r*L(3)*sin(q3);
        bb = ((L(2)+L(3)*cos(q3))*r+L(3)*sin(q3)*(z-L(1)));
        q22 = atan2(aa,bb);

        q2 = [q21, q22];
        q3 = [q3, q3];
%> calcular junta um
        k  = sign( L(3)*cos(q2+q3)+L(2)*cos(q2) );
        aa = k*y;
        bb = k*x;

        q1 = atan2(aa, bb); 
        QQ = [q1;q2;q3]; 
%=============================================================================%
%> Rodar angulos para home position
%=============================================================================%           
        for i=1:size(QQ,2)
            QQ(2,i)=QQ(2,i)-pi/2;
            QQ(3,i)=QQ(3,i)+pi/2;
        end
%=============================================================================%
%> Determinar redundancia
%=============================================================================%        
     Q = QQ(:,1);
       
%=============================================================================%
%> Verificação do alcance das juntas 2, 3, 4, 5 
%=============================================================================%            
        if (QQ(2) < -2.0944-pi/2);
            error('ERRO de cálculo de simulação \n >RRR+RR: Ângulo q2 Impossível -> %d < -120º',(QQ(2)*180/pi));  
        end
        if (QQ(2) > 2.0944-pi/2)
            error('ERRO de cálculo de simulação \n >RRR+RR: Ângulo q2 Impossível -> %d > 120º',(QQ(2)*180/pi)); 
        end
        if (QQ(3) < -1.0472+pi/2);
            error('ERRO de cálculo de simulação \n >RRR+RR: Ângulo q3 Impossível -> %d < -60º',(QQ(3)*180/pi));  
        end
        if (QQ(3) > 4.1888+pi/2)
            error('ERRO de cálculo de simulação \n >RRR+RR: Ângulo q3 Impossível -> %d > 240º',(QQ(3)*180/pi)); 
        end
        if (QQ(4) < -pi);
            error('ERRO de cálculo de simulação \n >RRR+RR: Ângulo q4 Impossível -> %d < -180º',(QQ(4)*180/pi));  
        end
        if (QQ(4) > pi)
            error('ERRO de cálculo de simulação \n >RRR+RR: Ângulo q4 Impossível -> %d > 180º',(QQ(4)*180/pi)); 
        end
        if (QQ(5) < -pi);
            error('ERRO de cálculo de simulação \n >RRR+RR: Ângulo q5 Impossível -> %d < -180º',(QQ(5)*180/pi));  
        end
        if (QQ(5) > 1.0472)
            error('ERRO de cálculo de simulação \n >RRR+RR: Ângulo q5 Impossível -> %d > 60º',(QQ(5)*180/pi)); 
        end

        j = [0 0 0]';
        DHini=[0    0    L(1) pi/2
               pi/2 L(2) 0    0
               0    0    0    pi/2];

        MDH = GenerateMultiDH(DHini, Q,j);
        RR  = Tlinks(MDH(:,:,1));
        R03 = RR(1:3,1:3,1)*RR(1:3,1:3,2)*RR(1:3,1:3,3); 
        R63 =R03'*R;
        q4 = atan2(R63(2,3),R63(1,3));
        q5 = atan2(sqrt((R63(1,3))^2+(R63(2,3))^2),R63(3,3))-(pi/2); 

        Q = [Q; q4; q5];
    end


end

