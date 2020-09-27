clear all;
clc;

Config
CarregarDados
Ybarra
SolucaoInicial

J = MatrizJacobiana(v_mod, v_ang, G, B, tipo_barra);
disp('------ JACOBIANO DA PRIMEIRA ITERAÇÃO: ------')
disp(J)