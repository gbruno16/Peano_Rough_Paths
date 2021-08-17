function A=area_opt(t,k)
    [X,Y]=PeanoCurve(k-1, 1); %calcolo dei valori della k-esima iterazione della curva di Peano
    X=[X;1]; %aggiunta a mano del valore [1,1]
    Y=[Y;1];
    x=0:3^(-2*k):t; %partizione di [0,1] corrispondente
    A=0;
    xf=[X(1);Y(1)];
    
    %Applico la formula descritta nella tesi per A_{0,t}
    for i=1:length(x)-1
            xi=xf;
            xf=[X(i+1);Y(i+1)];
            yf=cpeano(x(i+1),15);
           
            A=A+xi(1)*xf(2)-xi(2)*xf(1);
    end
    
    %Aggiunta dell'ultimo termine
    xi=xf;
    xf=cpeano(t,15);
    A=A+xi(1)*xf(2)-xi(2)*xf(1);
end