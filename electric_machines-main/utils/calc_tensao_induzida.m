function [Ea,jXsIa,Z] = calc_tensao_induzida(tensao_fase,tensao_fase_angle,Ia,Ia_phase,Xs,Ra)

    jXsIa = Xs*(Ia*cosd(Ia_phase)+ 1i*Ia*sind(Ia_phase))*1i;
    RaIa = Ra*(Ia*cosd(Ia_phase) + 1i*Ia*sind(Ia_phase));

    %% Impedância Interna da Máquina
    Z = sqrt((Xs^2 + Ra^2));

    %% Tensão Induzida da Máquina
    Ea = tensao_fase*cosd(tensao_fase_angle) + 1i*tensao_fase*sind(tensao_fase_angle) + RaIa + jXsIa;

end