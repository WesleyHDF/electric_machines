function [Ia_ref,Il_ref,Ea_ref,Z_ref,Fp_ref,Vel_rpm] = calc_op_nominal_gs( ...
    tensao_terminal, ...
    ligacao, ...
    pot_aparente, ...
    num_polos, ...
    freq_eletrica, ...
    Xs, ...
    Ra)
    %% Corrente de Armadura e Corrente de Linha Máxima

    if ligacao == 'y'
        Ia_ref = pot_aparente/(sqrt(3)*tensao_terminal); %Fp = 1?
        Il_ref = Ia_ref;
    elseif ligacao == 'd'
        Ia_ref = pot_aparente/(3*tensao_terminal);
        Il_ref = Ia_ref*sqrt(3);
    else
        printf('A informação de ligação da máquina deve ser: (y) para ligacao Y e (d) para ligacao delta.')
        ligacao = input('Informe o tipo de ligacao da máquina','s');
        if ligacao == 'y'
            Ia_ref = pot_aparente/(sqrt(3)*tensao_terminal);
            Il_ref = Ia_ref;
        elseif ligacao == 'd'
            Ia_ref = pot_aparente/(sqrt(3)*tensao_terminal);
            Il_ref = Ia_ref*sqrt(3);
        else
            printf('A informação de ligação da máquina está incorreta!')
        end
    end

    %% Impedância Interna da Máquina
    Z_ref = sqrt((Xs^2 + Ra^2));
    
    %% Tensão Interna Máxima da Máquina
    Ea_ref = Z_ref*Ia_ref;
    
    %% Não faz muito sentido, mas Fator de Potência Máximo da Máquina
    Fp_ref = 1;

    %% Velocidade de Rotação da Máquina Elétrica (rpm)
    Vel_rpm = (120* freq_eletrica)/num_polos;

end