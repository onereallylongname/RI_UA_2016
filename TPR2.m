%=============================================================================%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% >>>> *Trabalho 2* <<<< 
%=============================================================================%
% Autor:
% António Almeida 
% Nº mec:
% 64960
% Contacto:
% almeid@ua.pt 
% Disciplina:
% Robotica Industrial
%
% 18/10/15
% Universidade de Aveiro
%=============================================================================%
% >>> Introdução <<<
%=============================================================================%
%   Este trabalho foi realizado no ambito da discilplina de Robotica
%   Industrial, como solução do Trabalho número 2, em época de recurso.
%=============================================================================%  
% >>> Objectivo <<<
%=============================================================================%
%   Simular uma celula robotica com uma operação de gravação e paletização, 
% em movimento sincrono.
%
%=============================================================================%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%>>> Iniciar Simulação <<<
%Limpar todos os dados anteriores e fechar todas as janelas
close all; clear all; clc;
%=============================================================================%

%=============================================================================%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          >>> Editável pelo utilizador <<<
%=============================================================================%
%> Display Options 
PSHOW = true;  % - Fazer pausa antes da animação
SHOWG = true;  % - Mostar gráficos da velocidade das juntas
SHOWR = true;  % - Mostrar Caminho dos robos
SHOWL = true;  % - Mostrar caminho imediatamente antes do robo
SHOWT = true;  % - Mostrar grafico de Torque dos motores do robo RRR+RR
SHOWP = true;  % - Mostra o progresso dos calculos a decorrer
%> Parametros definidos pelo utilizador:
FORCE = 10;    % - Força de trabalho na peça
REPVL = 5;     % - Velocidade de reprodução [0.5, 10]
INTIM = 0.1;   % - Intervelo de tempo entre cada iteração [0.5, 0.01]
%=============================================================================%
%          >>> Fim de secção editável <<<
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%=============================================================================%
format compact;
format
global GCONFIG;
GCONFIG(1) = SHOWP;
GCONFIG(2) = FORCE;
GCONFIG(3) = SHOWG;
GCONFIG(4) = SHOWR;
GCONFIG(5) = SHOWT;
GCONFIG(6) = INTIM;
DT = INTIM/REPVL;
%=============================================================================%
%>>> Parametros inicíais <<<
%=============================================================================%
%=============================================================================%
%> Ler ficheiro tp1conf.csv.
%=============================================================================%
a=cd('.');
if ~strcmp(a(end-2:end),'Lib')
    if ~strcmp(a(end-9:end),'TPR2_64960')
        cd('./TPR2_64960/Lib');
    end
end

if size(dir('cell_tp2.csv'),1)
    configmatrix = dlmread('cell_tp2.csv');
else
%> Caso não exista este ficheiro são usados valores por defito.  
    configmatrix = [90  ,110 ,80  ,80  ,0	
                    70  ,80  ,50  ,20  ,38
                    38  ,9   ,15  ,80  ,60
                    220 ,45  ,100 ,100 ,0 ];
end
%=============================================================================%
%> Mudar para o diretorio das funções
%=============================================================================%
a=cd('.');
if  ~strcmp(a(end-2:end),'Lib')
    if strcmp(a(end-9:end),'TPR2_64960')
        cd('Lib');
    else
        cd('./TPR2_64960/Lib');
    end
end

%=============================================================================%
% >>> MAIN <<<
%=============================================================================%
%> Criar Objetos e Robos
Obj = makeobjcell(configmatrix);
%> Posicionar Objetos e Robos na celula
Obj = makecell1(Obj, configmatrix);
%> Calcular movimentos dos Robos
[Obj, QA, QB, QC, Jt1, Jt2, F1, F2] = makecellpath_a(Obj, configmatrix, INTIM);
%> Mostrar gráficos
makegrafs(Obj, QA, QB, QC, Jt1, Jt2, F1, F2);

if PSHOW 
    pause
end
%> Display da celula
[H b] = dispcell( Obj );
%> Animar a celula
Animatecell(H,Obj,INTIM, DT)
