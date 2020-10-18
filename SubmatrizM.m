function M = SubmatrizM(v_mod,v_ang, G, B, tipo)
    %SUBMATRIZH Submatriz da matriz jacobiana referente a dQ/dtheta
    n_barras = length(G);
    nao_pv = sum(tipo ~= 3); % Computa quantas barras não são barras swing
    quant_pq = sum(tipo == 1); % Quantidade de barras pq
    M = zeros([quant_pq, nao_pv]);
    idx_i = 1;
    for k = 1:n_barras
        if tipo(k) ~=1
            continue
        end
        idx_j = 1;
        for m = 1:n_barras
           if tipo(m) == 3
               continue
           end
           
           if k == m
               s = 0;
               for i = 1:n_barras
                   theta_ki = v_ang(k)-v_ang(i);
                   s = s + v_mod(i)*(G(k, i)*cos(theta_ki) + B(k, i)*sin(theta_ki));
               end
               M(idx_i, idx_j) = -v_mod(k)^2*G(k, k) + v_mod(k)*s;
           else
               theta_km = v_ang(k)-v_ang(m);
               M(idx_i, idx_j) = -v_mod(k)*v_mod(m)*(G(k, m)*cos(theta_km) + B(k, m)*sin(theta_km));
           end
           idx_j = idx_j + 1;
        end
        idx_i = idx_i + 1;
    end
end

