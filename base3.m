function tt=base3(t,n)
    tt=zeros(1,n);
    for i=1:n
        a=mod(t*3^i,3);
        %problema di approssimazione numerica e con Peano poi produce
        %risultati sbagliati. Altre soluzioni possibili? Questa è brutta ma
        %sembra funzionare.
        if 0.9999999<a && a<1 
            a=1;
        elseif 1.9999999< a && a<2
                a=2;
        elseif 2.9999999< a && a<3
            a=0;
        end
        tt(i)=floor(a);
    end
end