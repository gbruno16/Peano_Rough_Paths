function p=peano(t,n)
    p=zeros(2,1);
    for j=0:n-1
        S1=sum(t(2:2:(1+2*j-1)));
        S2=sum(t(1:2:(2+2*j-1)));
        if mod(S1,2)==0
            p(1)=p(1)+t(1+2*j)/3^(j+1);
        else
            p(1)=p(1)+(2-t(1+2*j))/3^(j+1);
        end 
        if mod(S2,2)==0
            p(2)=p(2)+t(2+2*j)/3^(j+1);
        else
            p(2)=p(2)+(2-t(2+2*j))/3^(j+1);
        end 
    end
end





