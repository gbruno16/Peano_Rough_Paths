m=3; %numero massimo di iterazioni
res=zeros(6,m); %risultati
t=0.5; %calcolo dell'integrale tra 0 e t

%Integrale di Young
figure(1)
hold on 
for part=1:2 %tipo di partizione
    for i=1:m %iterazione
        int=integraleopt(@yfunc,@dyfunc,t,i,'y',part); %calcolo integrale
        res(part,i)=int;  
        disp(part)
    end
    plot(res(part,:).','-o');
end

%per la partizione i/10^k non si può sfruttare la versione ottimizzata 
part=3;
for i=1:m
        int=integrale2(@yfunc,@dyfunc,t,i,'y'); %calcolo integrale "lento"
        res(part,i)=int;  
        disp(part)
end
plot(res(part,:).','-o');
leg1=legend('$\frac{i}{3^{2k}}$', '$\frac{1}{2\cdot 3^{2k}}\frac{i}{3^{2k}}$','$\frac{i}{10^k}$');
set(leg1,'Interpreter','latex');
hold off

%Integrale Rough
figure(2)
hold on
for part=1:2
    for i=1:m
        int=integraleopt(@yfunc,@dyfunc,t,i,'r',part);
        res(part+3,i)=int; 
        disp(part)
    end
    plot(res(part+3,:).','-o');
end
part=3;
for i=1:m
        int=integrale2(@yfunc,@dyfunc,t,i,'r');
        res(part+3,i)=int;  
        disp(part)
end
plot(res(part+3,:).','-o');
leg1=legend('$\frac{i}{3^{2k}}$', '$\frac{1}{2\cdot 3^{2k}}\frac{i}{3^{2k}}$','$\frac{i}{10^k}$');
set(leg1,'Interpreter','latex');
hold off
