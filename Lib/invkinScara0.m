function [Q] = invkinScara0(x, y, z, alf, L,n)
%=============================================================================%
%INVKINRR invkinScara(x, y, z, alf, L)
%C�lcula a cinematica inversa de um Scara.
%=============================================================================%
    q0 = [0 0];
%=============================================================================%
%> Definir a home position
%=============================================================================%
    if ((x == 0) && (y == 0) && (z == 0)) % posi��o 0
        Q  = [q0; q0; q0; q0; q0; q0]; 
    else
%=============================================================================%
%>>>> C�lculo dos �ngulos do robo <<<
%=============================================================================%
        q2 = acos((x^2+y^2-L(2)^2-L(3)^2)/(2*L(2)*L(3)));
%=============================================================================%
%> Verifica��o do �ngulo da junta 2
%=============================================================================%        
        if (q2 < -2.6180);
            q2 = NaN; 
            error('ERRO de c�lculo de simula��o \n >SCARA %c: �ngulo q2 Imposs�vel -> %d < -150�',n,(q2*180/pi));  
        end
%=============================================================================%
%> Verifica��o do alcance do bra�o
%=============================================================================%        
        if(q2 > 2.6180)
            q2 = NaN; 
            error('ERRO de c�lculo de simula��o \n >SCARA %c: �ngulo q2 Imposs�vel -> %d > 150�',n,(q2*180/pi)); 
        end
        
        q2 = [q2 -q2];
        q1 = atan2((y*(L(2)+L(3)*cos(q2))-x*L(3)*sin(q2)),...
                    (x*(L(2)+L(3)*cos(q2))+y*L(3)*sin(q2)));
        q0 = [0 0];
        q3 = [alf alf]-q1-q2;        
        q4 = -L(1)+z + L(4); 
        if (q4 < 0 || q4 > L(4)); q4 = NaN; warning('Movimento de q4 SCARA imp!'); end
        q4 = [q4 q4];
%=============================================================================%
%> Verifica��o do alcance da junta 4
%=============================================================================%        
        if q4(1) < 0
            Q = NaN;
            error('ERRO de c�lculo de simula��o \n >SCARA %c: Posi��o da junta q4 fora do alcance do robo -> %d < 0',q4)
        end
        if q4(1) > L(4)
            Q = NaN;
            error('ERRO de c�lculo de simula��o \n >SCARA %c: Posi��o da junta q4 fora do alcance do robo -> %d > L4',q4)
        end

        Q  = [q0; q1; q2; q3; q4; q0];
    end
end

