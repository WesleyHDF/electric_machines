%% Funções Desenvolvidas
% calc_corrente_armadura - Esta função irá retornar o valor da corrente de
    % armaruda juntamente com o seu valor de fase.


%% Variáveis de Entrada
vt = 13800; % tensão de terminal do GS
vl = 13800; % tensão de linha do GS
S = 50000000; % potência aparente do GS
Xs = 2.5; % reatância síncrona do GS
Ra = 0.2; % resistência de armadura do GS
fp = 0.9; % fator de potência (atrasado)
fp_estado = 'i'; % i - indutivo e c-capacitivo
ligacao = 'y'; % y - ligacao Y e d - ligacao delta
num_polos = 4; % Número de polos da máquina.
freq_ele = 60; % frequência elétrica em Hz.
%input('Quantos pontos da curva: ', 's')

%% Cálculo - GS operando Nominalmente
[Ia_ref,Il_ref,Ea_ref,Z_ref,Fp_ref,Vel_rpm] = calc_op_nominal_gs(vt,ligacao,S,num_polos,freq_ele,Xs,Ra);

%% Cálculo da Corrente de Armadura
[Ia,Ia_phase,Il,Il_phase] = calc_correntes(S,vl,fp,fp_estado);

%% Tensão de Fase
[vp,vl_calc] = calc_tensao_fase(vt,ligacao);

%% Impedância Síncrona
jXsIa = Xs * (Ia*cosd(Ia_phase)+ 1i*Ia*sind(Ia_phase))*1i;

%% Tensão Induzida Interna do GS
%Ea = vp*cosd(0) + 1i*vp*sind(0) + Ra*(Ia*cosd(phase) + 1i*Ia*sind(phase))+ jXsIa;
Ea = calc_tensao_induzida(vp,Ia,Ia_phase,Xs,Ra);

modulo = abs(Ea);
fase = angle(Ea)*(180/pi);

