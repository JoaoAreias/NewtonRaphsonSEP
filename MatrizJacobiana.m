function J = MatrizJacobiana(v_mod, v_ang, G, B, tipo)
    %MATRIZJACOBIANA Summary of this function goes here
    %   Detailed explanation goes here
    H = SubmatrizH(v_mod, v_ang, G, B, tipo);
    M = SubmatrizM(v_mod, v_ang, G, B, tipo);
    N = SubmatrizN(v_mod, v_ang, G, B, tipo);
    L = SubmatrizL(v_mod, v_ang, G, B, tipo);
    J = [H M; N L];
end

