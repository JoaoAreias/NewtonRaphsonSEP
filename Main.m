tic
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


H = MatrizJacobiana(v_mod, v_ang, G, B, tipo_barra);

% Assegura que todos os modulos das tensões serão iguais a 1 p.u
for i = 1:length(v_mod)
   v_mod(i) = 1; 
end


for i = 1:max_iter
    resPa = Pesp - PotenciaP(v_mod, v_ang, G, B);
    resQa = Qesp - PotenciaQ(v_mod, v_ang, G, B);
    
    resP = resPa(tipo_barra ~= 3); % Todos menos barra swing
    
    % Sai do algorítimo quando convergir
    if(max(abs(resP)) <= eps/100)
        break;
    end
    
    d_theta = H\resP;    
    v_ang(tipo_barra ~= 3) = v_ang(tipo_barra ~= 3) + d_theta;
end

v_ang = rad2deg(v_ang);
lista_barras = transpose(linspace(1, length(barras), length(barras)));
resultado = [lista_barras v_mod v_ang];

disp(['N° de iteracoes: ', int2str(i)])
disp('    Barra || Modulo V || Angulo V')
disp(resultado)
toc