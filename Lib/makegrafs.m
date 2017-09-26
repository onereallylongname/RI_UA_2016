function [] = makegrafs( obj, QA, QB, QC, Jt1, Jt2, F1, F2)
%=============================================================================%
% makegrafs( obj, QA, QB, QC, Jt1, Jt2, F1, F2) - cria e mostra os
% diferentes graficos.
%=============================================================================%
global GCONFIG
NN = [size(obj(10).AAA,4), size(obj(11).AAA,4),size(obj(12).AAA,4)];

%=============================================================================%
% >>> Mostar gráficos da velocidade das juntas <<<
%=============================================================================%
if GCONFIG(3)
%=============================================================================%
%> SCARA A
%=============================================================================%
disp('Creating joint velocity graph for Scara A')
figure;
%> q1
subplot(2,2,1)
plot(linspace(0,33,33/GCONFIG(6)),QA(2,1:33/GCONFIG(6)),'b')
axis tight
title('Scara A q1')
xlabel('t(s)')
ylabel('v ang (rad/s)')
%> q2
subplot(2,2,2)
plot(linspace(0,33,33/GCONFIG(6)),QA(3,1:33/GCONFIG(6)),'b')
axis tight
title('Scara A q2')
xlabel('t(s)')
ylabel('v ang (rad/s)')
%> q3
subplot(2,2,3)
plot(linspace(0,33,33/GCONFIG(6)),QA(4,1:33/GCONFIG(6)),'b')
axis tight
title('Scara A q3')
xlabel('t(s)')
ylabel('v ang (rad/s)')
%> q4
subplot(2,2,4)
plot(linspace(0,33,33/GCONFIG(6)),QA(5,1:33/GCONFIG(6)),'b')
axis tight
title('Scara A q4')
xlabel('t(s)')
ylabel('v ang (rad/s)')
%=============================================================================%
%> SCARA C
%=============================================================================%
disp('Creating joint velocity graph for Scara B')
figure;
%> q1
subplot(2,2,1)
plot(linspace(0,79,79/GCONFIG(6)),QC(2,1:79/GCONFIG(6)),'b')
axis tight
title('Scara C q1')
xlabel('t(s)')
ylabel('v ang (rad/s)')
%> q2
subplot(2,2,2)
plot(linspace(0,79,79/GCONFIG(6)),QC(3,1:79/GCONFIG(6)),'b')
axis tight
title('Scara C q2')
xlabel('t(s)')
ylabel('v ang (rad/s)')
%> q3
subplot(2,2,3)
plot(linspace(0,79,79/GCONFIG(6)),QC(4,1:79/GCONFIG(6)),'b')
axis tight
title('Scara C q3')
xlabel('t(s)')
ylabel('v ang (rad/s)')
%> q4
subplot(2,2,4)
plot(linspace(0,79,79/GCONFIG(6)),QC(5,1:79/GCONFIG(6)),'b')
axis tight
title('Scara C q4')
xlabel('t(s)')
ylabel('v ang (rad/s)')
%=============================================================================%
%> RRR+RR B
%=============================================================================%
disp('Creating joint velocity graph for RRR+RR B')
figure;
%> q1
subplot(2,3,1)
plot(linspace(0,58,58/GCONFIG(6)),QB(1,1:58/GCONFIG(6)),'b')
axis tight
title('RRR+RR B q1')
xlabel('t(s)')
ylabel('v ang (rad/s)')
%> q2
subplot(2,3,2)
plot(linspace(0,58,58/GCONFIG(6)),QB(2,1:58/GCONFIG(6)),'b')
axis tight
title('RRR+RR B q2')
xlabel('t(s)')
ylabel('v ang (rad/s)')
%> q3
subplot(2,3,3)
plot(linspace(0,58,58/GCONFIG(6)),QB(3,1:58/GCONFIG(6)),'b')
axis tight
title('RRR+RR B q3')
xlabel('t(s)')
ylabel('v ang (rad/s)')
%> q4
subplot(2,3,4)
plot(linspace(0,58,58/GCONFIG(6)),QB(4,1:58/GCONFIG(6)),'b')
axis tight
title('RRR+RR B q4')
xlabel('t(s)')
ylabel('v ang (rad/s)')
%> q5
subplot(2,3,5)
plot(linspace(0,58,58/GCONFIG(6)),QB(5,1:58/GCONFIG(6)),'b')
axis tight
title('RRR+RR B q5')
xlabel('t(s)')
ylabel('v ang (rad/s)')  
    
end
%=============================================================================%
% >>> Mostrar Caminho dos robos <<<
%=============================================================================%
disp('Creating robot path')
if GCONFIG(4)
dispcell( obj );
title('Primeiro trajecto de cada robo')
xlabel('x(mm)')
ylabel('y(mm)')
zlabel('z(mm)')
hold on
plot3(obj(10).xyz(1:33/GCONFIG(6),1),obj(10).xyz(1:33/GCONFIG(6),2),obj(10).xyz(1:33/GCONFIG(6),3),'dg','MarkerSize',2)
plot3(obj(12).xyz(1:58/GCONFIG(6),1),obj(12).xyz(1:58/GCONFIG(6),2),obj(12).xyz(1:58/GCONFIG(6),3),'dr','MarkerSize',2)
plot3(obj(11).xyz(1:79/GCONFIG(6),1),obj(11).xyz(1:79/GCONFIG(6),2),obj(11).xyz(1:79/GCONFIG(6),3),'dk','MarkerSize',2)
hold off
end
%=============================================================================%
% >>> Mostrar grafico de Torque dos motores do robo RRR+RR <<<
%=============================================================================%
disp('Creating torque graph')
if GCONFIG(5)
cor = ['r','g','b','k','m'];
figure
%> Primeiro trajecto
subplot(1,2,1)
for k = 1:5
plot(linspace(33,33+8,size(Jt1,2)),Jt1(k,:),'color',cor(k))
hold on  
end
title('Primeiro trajecto de gravação')
xlabel('t(s)')
ylabel('Tau(Nmm)')
axis auto
legend('q1','q2','q3','q4','q5');
hold off
%> Segundo trajecto
subplot(1,2,2)
for k = 1:5
plot(linspace(33+8+4,33+16+4,size(Jt2,2)),Jt2(k,:),'color',cor(k))
hold on  
end
title('Segundo trajecto de gravação')
xlabel('t(s)')
ylabel('Tau(Nmm)')
legend('q1','q2','q3','q4','q5');
axis auto
hold off
end

end