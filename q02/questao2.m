%% Variáveis de Entrada
vt = 13800; % tensão de terminal do GS
vl = 13800; % tensão de linha do GS
S = 50000000; % potência aparente do GS
Xs = 2.5; % reatância síncrona do GS
Ra = 0.2; % resistência de armadura do GS
fp = 0.9; % fator de potência (atrasado)

%% Cálculo da Corrente de Armadura
Ia = S/(sqrt(3)*vl);

% fase da corrente de armadura
phase = acosd(fp)*-1;

%% Tensão de Fase
vp = vt/sqrt(3);

%% Impedância Síncrona
jXsIa = Xs * (Ia*cosd(phase)+ 1i*Ia*sind(phase))*1i;

%% Tensão Induzida Interna do GS
Ea = vp*cosd(0) + 1i*vp*sind(0) + Ra*(Ia*cosd(phase) + 1i*Ia*sind(phase))+ jXsIa;

modulo = abs(Ea);
fase = angle(Ea)*(180/pi);

