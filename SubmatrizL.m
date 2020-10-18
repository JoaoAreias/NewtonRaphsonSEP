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
           L(idx_i, idx_j) = -B(k, m);
           idx_j = idx_j + 1;
        end
        idx_i = idx_i + 1;
    end
end

