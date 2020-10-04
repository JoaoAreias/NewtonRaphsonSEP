clear all;
clc;

Config
CarregarDados
Ybarra
SolucaoInicial

Pesp = (Pger_barra - Pcons_barra)./base_barra;
Qesp = (Qger_barra - Qcons_barra)./base_barra;

pq_count = sum(tipo_barra == 1);
pv_count = sum(tipo_barra == 2);

for i = 1:max_iter
    P = PotenciaP(v_mod, v_ang, G, B);
    Q = PotenciaQ(v_mod, v_ang, G, B);
    resPa = Pesp - P;
    resQa = Qesp - Q;
    
    resP = resPa(tipo_barra ~= 3); % Todos menos barra swing
    resQ = resQa(tipo_barra == 1); % Apenas barra PQ
    
    % Sai do algorítimo quando convergir
    residuos = [resP; resQ];
    if(max(abs(residuos)) <= eps/100)
        break;
    end
    
    J = MatrizJacobiana(v_mod, v_ang, G, B, tipo_barra);
    dx = J\residuos;
    
    v_ang(tipo_barra ~= 3) = v_ang(tipo_barra ~= 3) + dx(1:(pq_count + pv_count));
    v_mod(tipo_barra == 1) = v_mod(tipo_barra == 1) + dx((pq_count + pv_count + 1): end);
end

v_ang = rad2deg(v_ang);
lista_barras = transpose(linspace(1, length(barras), length(barras)));
resultado = [lista_barras v_mod v_ang];

disp('    Barra || Modulo V || Angulo V')
disp(resultado)