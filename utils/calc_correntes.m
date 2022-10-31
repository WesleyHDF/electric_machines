%Cálculo da Corrente de Armadura
%Ia = S/(sqrt(3)*vl);
% fase da corrente de armadura
% phase = acosd(fp)*-1;

function [Ia,phase,Il,Il_phase] = calc_correntes(pot_aparente,tensao_linha,fp,fp_estado,ligacao)

    Ia = pot_aparente/(sqrt(3)*tensao_linha);
    % acho q o fp n entra nessa formula, pois P_ativa = pot_aparente*fp = 3Vp*Ia*fp

    if ligacao == 'y'
        %Ia = pot_aparente/(sqrt(3)*tensao_terminal); %Fp = 1?
        Il = Ia;
    elseif ligacao == 'd'
        %Ia = pot_aparente/(3*tensao_terminal);
        Il = Ia*sqrt(3);
    else
        printf('A informação de ligação da máquina deve ser: (y) para ligacao Y e (d) para ligacao delta.')
        ligacao = input('Informe o tipo de ligacao da máquina','s');
        if ligacao == 'y'
            %Ia = pot_aparente/(sqrt(3)*tensao_terminal);
            Il = Ia;
        elseif ligacao == 'd'
            %Ia = pot_aparente/(sqrt(3)*tensao_terminal);
            Il = Ia*sqrt(3);
        else
            printf('A informação de ligação da máquina está incorreta!')
        end
    end

    %% Ângulo da Corrente
    if fp_estado == 'i'
        phase = acosd(fp)*-1;
        Il_phase = phase;
    elseif fp_estado == 'c'
        phase = acosd(fp);
        Il_phase = phase;
    else
        phase = acosd(fp);
        Il_phase = phase;
    end

end