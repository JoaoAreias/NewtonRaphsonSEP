function N = SubmatrizN(v_mod,v_ang, G, B,  tipo)
    %SUBMATRIZH Submatriz da matriz jacobiana referente a dP/dV
    n_barras = length(G);
    nao_pv = sum(tipo ~= 3); % Computa quantas barras não são barras swing
    quant_pq = sum(tipo == 1); % Quantidade de barras pq
    N = zeros([nao_pv, quant_pq]);
    
    idx_i = 1;
    for k = 1:n_barras
        if tipo(k) == 3
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
                   s = s + v_mod(i)*(G(k, i)*cos(theta_ki) + B(k, m)*sin(theta_ki));
               end
               N(idx_i, idx_j) = v_mod(k)*G(k, k) + s;
           else
               theta_km = v_ang(k)- v_ang(m);
               N(idx_i, idx_j) = v_mod(k)*(G(k, m)*cos(theta_km) + B(k, m)*sin(theta_km));
           end
           idx_j = idx_j + 1;
        end
        idx_i = idx_i + 1;
    end
end

