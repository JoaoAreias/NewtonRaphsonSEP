function Q = PotenciaQ(v_mod, v_ang, G, B)
    n_barras = length(B);
    Q = zeros([n_barras 1]);
    for k = 1:n_barras
        for m = 1:n_barras
            theta_km = v_ang(k) - v_ang(m);
            Q(k) = Q(k) + v_mod(k)*v_mod(m)*(G(k, m)*sin(theta_km) - B(k, m)*cos(theta_km));
        end
    end
end

