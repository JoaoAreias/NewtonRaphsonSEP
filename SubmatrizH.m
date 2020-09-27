function H = SubmatrizH(v_mod,v_ang, G, B, tipo)
    %SUBMATRIZH Submatriz da matriz jacobiana referente a dP/dtheta
    n_barras = length(G);
    nao_pv = sum(tipo ~= 3); % Computa quantas barras não são barras swing
    H = zeros(nao_pv, nao_pv);
    
    for k = 1:n_barras
        for m = 1:n_barras
           if k == m
               s = 0;
               for i = 1:n_barras
                   theta_ki = v_ang(k)-v_ang(i);
                   s = s + v_mod(i)*(G(k, i)*sin(theta_ki) - B(k, i)*cos(theta_ki));
               end
               H(k, k) = -v_mod(k)^2*B(k, k) - v_mod(k)*s;
           else
               theta_km = v_ang(k)-v_ang(m);
               H(k, m) = v_mod(k)*v_mod(m)*(G(k, m)*sin(theta_km) - B(k, m)*cos(theta_km));
           end
        end
    end
end

