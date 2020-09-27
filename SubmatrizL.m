function L = SubmatrizL(v_mod, v_ang, G, B, tipo)
    %SUBMATRIZH Submatriz da matriz jacobiana referente a dQ/dV
    n_barras = length(G);
    quant_pq = sum(tipo == 1); % Quantidade de barras pq
    L = zeros(quant_pq);
    
    idx_i = 1;
    for k = 1:n_barras
        if tipo(k) ~=1
            continue
        end
        idx_j = 1;
        for m = 1:n_barras
           if tipo(m) ~= 1
               continue
           end
           if k == m
               s = 0;
               for i = 1:n_barras
                   theta_ki = v_ang(k) - v_ang(i);
                   s = s + v_mod(i)*(G(k, i)*sin(theta_ki) - B(k, i)*cos(theta_ki));
               end
               L(idx_i, idx_j) = -v_mod(k)*B(k, k) + s;
           else
               theta_km = v_ang(k)- v_ang(m);
               L(idx_i, idx_j) = v_mod(k)*(G(k, m)*sin(theta_km) - B(k, m)*cos(theta_km));
           end
           idx_j = idx_j + 1;
        end
        idx_i = idx_i + 1;
    end
end

