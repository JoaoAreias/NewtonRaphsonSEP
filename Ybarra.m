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
B = imag(Y_barra);
G = real(Y_barra);
    
        
