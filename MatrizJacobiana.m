function [H, L] = MatrizJacobiana(v_mod, v_ang, G, B, tipo)
    H = SubmatrizH(v_mod, v_ang, G, B, tipo);
    %M = SubmatrizM(v_mod, v_ang, G, B, tipo);
    %N = SubmatrizN(v_mod, v_ang, G, B, tipo);
    L = SubmatrizL(v_mod, v_ang, G, B, tipo);
    %J = [H N; M L];
end