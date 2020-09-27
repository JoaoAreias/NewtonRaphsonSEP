function M = SubmatrizM(v_mod,v_ang, G, B, tipo)
    %SUBMATRIZH Submatriz da matriz jacobiana referente a dQ/dtheta
    n_barras = length(G);
    
    M = zeros(n_barras);
    
    for k = 1:n_barras
        for m = 1:n_barras
           if k == m
               s = 0;
               for i = 1:n_barras
                   theta_ki = v_ang(k)-v_ang(i);
                   s = s + v_mod(i)*(G(k, i)*cos(theta_ki) - B(k, i)*sin(theta_ki));
               end
               M(k, k) = -v_mod(k)^2*G(k, k) - v_mod(k)*s;
           else
               theta_km = v_ang(k)-v_ang(m);
               M(k, m) = -v_mod(k)*v_mod(m)*(G(k, m)*cos(theta_km) - B(k, m)*sin(theta_km));
           end
        end
    end
end
