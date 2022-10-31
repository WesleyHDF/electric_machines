function jXsIa = calc_impedancia_sincrona(Xs,Ia,Ia_phase)

    jXsIa = Xs* (Ia*cosd(Ia_phase)+ 1i*Ia*sind(Ia_phase))*1i;

end