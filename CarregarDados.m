ramos = xlsread ('casoieee14_ramos.xls');
barras = xlsread ('casoieee14_barras.xls');

%% carregando os dados da planilha barras
num_barra = barras (:,1); %Número da barra no sistema
tipo_barra = barras (:,2); %Tipo da barra (1 – PQ, 2 – PV e 3 - Vθ)
Pcons_barra = barras (:,3); %Potência ativa consumida (MW)
Qcons_barra = barras (:,4); %Potência reativa consumida (MVAr)
Pger_barra = barras (:,5); %Potência ativa gerada (MW)   
Qger_barra = barras (:,6); %Potência reativa gerada (MVAr)
condutancia_barra = barras (:,7); %Condutância shunt, valor de potência para tensão de 1.0 p.u. (MW)
susceptancia_barra = barras (:,8); %Susceptância shunt, valor de potência para tensão de 1.0 p.u. (MVAR)
tensao_barra = barras (:,9); % Módulo da tensão da barra em p.u.
angulo_barra = barras (:,10); % Ângulo da tensão da barra em graus.
base_barra = barras (:,11); %Base de Potência Trifásica.


%% carregando os dados da planilha ramos
origem_ramo  = ramos (:,1); %Número da barra de origem
destino_ramo = ramos (:,2); % Número da barra de destino
R_ramo = ramos (:,3); %Resistência série em p.u.
xl_ramo = ramos (:,4); %Resistência série em p.u.
susceptancia_ramo = j*ramos (:,5)/2; %Susceptância shunt total em p.u.
a_ramo  = ramos (:,6); %Relação de transformação do transformador

