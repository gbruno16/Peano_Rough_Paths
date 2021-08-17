function int=integraleopt(y,dy,t,k,int_type,part_type)
    %y: funzione da integrare.
    %dy: differenziale di y da applicare a Gamma.
    %t: integrale tra 0 e t.
    %k: iterazione della partizione da considerare.
    %int_type: y per Young, r per Rough.
    %part_type: 1,2,3 in base al tipo di partizione scelto.

    [X,Y]=PeanoCurve(k-1, part_type); %calcolo punti sulla curva di Peano della partizione con k iterazioni di tipo part_type
    X=[X;1]; %aggiunta del punto (1,1) a mano
    Y=[Y;1];
    f=cpeano(t,15); %calcolo del valore della curva di Peano in t, estremo di integrazione
    
    %Correzione delle partizioni
    if part_type==1
        x=0:3^(-2*k):t;  %partizione di [0,t]
        X=X(1:length(x)); %tronco i punti della curva di Peano
        Y=Y(1:length(x)); 
        x=[x,t]; %aggiungo a mano t
    elseif part_type==2
        x=3^(-2*k)/2:3^(-2*k):t;  %partizione di [0,t]
        X=[0;X(1:length(x))]; %qui serve aggiungere anche lo 0
        Y=[0;Y(1:length(x))];
        x=[0,x,t]; 
       
    elseif part_type==3
        x=0:10^(-k):t;
        X=X(1:length(x));
        Y=Y(1:length(x));
        x=[x,t];
    end
   
    X=[X;f(1)]; %aggiungo a meno il punto finale
    Y=[Y;f(2)];
    

    A=0; %parte antisimmetrica A_{s,t}
    xf=[X(1);Y(1)]; %inizializzo xf
    int=0; 
    
    %Calcolo dell'integrale
    for i=1:length(X)-1
            xi=xf;
            xf=[X(i+1);Y(i+1)];
           
            dx=xf-xi;
          
            
            if int_type=='y' %integrale di Young
                int=int+y(xi,dx); 
               
            elseif int_type=='r' %integrale Rough
                 if part_type==1
                     A=0; %nel caso della prima partizione A è sempre nulla
                 else
                    A=area_opt(x(i+1),k)-area_opt(x(i),k)-xi(1)*xf(2)+xi(2)*xf(1);
                 end
                  G=0.5*[dx(1)*dx(1),dx(1)*dx(2)+A; %calcolo di Gamma_{s,t} sommando anche la parte simmetrica
                        dx(1)*dx(2)-A,dx(2)*dx(2)];
            
                 int=int+y(xi,dx)+dy(xi,G);
            end
            
    end
end 