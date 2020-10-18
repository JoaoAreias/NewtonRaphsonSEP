function H = SubmatrizH(v_mod,v_ang, G, B, tipo)
    %SUBMATRIZH Submatriz da matriz jacobiana referente a dP/dtheta
    n_barras = length(G);
    nao_pv = sum(tipo ~= 3); % Computa quantas barras não são barras swing
    H = zeros(nao_pv, nao_pv);
    
    idx_i = 1;
    for k = 1:n_barras
        if tipo(k) == 3
            continue
        end
        idx_j = 1;
        for m = 1:n_barras
           if tipo(m) == 3
               continue
           end
           H(idx_i, idx_j) = -B(k, m);
           idx_j = idx_j + 1;
        end
        idx_i = idx_i + 1;
    end
end

