n_barras = length(barras);

v_mod = zeros([n_barras 1]);
v_ang = zeros([n_barras 1]);

for i = 1:n_barras
    switch tipo_barra(i)
        case 1
            % Barra PQ
            v_mod(i) = 1.0;
            v_ang(i) = 0.0;
        case 2
            % Barra PV
            v_mod(i) = tensao_barra(i);
            v_ang(i) = 0.0;
        case 3
            % Barra Vtheta
            v_mod(i) = tensao_barra(i);
            v_ang(i) = angulo_barra(i);
        otherwise
            disp(['Tipo da barra ', string(i), ' não foi reconhecido'])   
    end
end