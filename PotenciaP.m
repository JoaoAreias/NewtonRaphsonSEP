function P = PotenciaP(v_mod, v_ang, G, B)
    n_barras = length(B);
    P = zeros([n_barras 1]);
    for k = 1:n_barras
        for m = 1:n_barras
            theta_km = v_ang(k) - v_ang(m);
            P(k) = P(k) + v_mod(k)*v_mod(m)*(G(k, m)*cos(theta_km) + B(k, m)*sin(theta_km));
        end
    end
end

