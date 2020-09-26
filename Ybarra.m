clear all
clc

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

%% construindo a diagonal principal

Ykk = zeros(length(num_barra));

    for k = 1:length(num_barra)
        for w = 1:length(origem_ramo)
            
            Ykk_1(w) = 1/ (R_ramo(w) +j*xl_ramo(w));
            
            if origem_ramo(w) == k
                
                Ykk(k,k) = Ykk(k,k) + Ykk_1(w)/(a_ramo(w)^2) + susceptancia_ramo(w);
                
            elseif destino_ramo(w) == k
                
                Ykk(k,k) = Ykk(k,k) + Ykk_1(w) + susceptancia_ramo(w);
                
            end
        end
    end

 


%% Elementos fora da diagonal principal

elemento_1 = zeros((length(num_barra)), (length(num_barra)));
elemento_2 = zeros((length(num_barra)), (length(num_barra)));


        for z = 1:length(origem_ramo) %ramo de origem
            
        elemento_1((origem_ramo(z)),(destino_ramo(z))) = -1/((R_ramo(z,:)+j*(xl_ramo(z,:))*a_ramo(z,:)));
        elemento_2((destino_ramo(z)),(origem_ramo(z))) = -1/((R_ramo(z,:)+j*(xl_ramo(z,:))*a_ramo(z,:)));

         end
       

 Y_barra_2 = elemento_1+elemento_2;
 
 %% unindo a matriz diagonal principal com a matriz fora da diagonal e formando a Ybarra
Y_barra = Ykk+Y_barra_2;
        
