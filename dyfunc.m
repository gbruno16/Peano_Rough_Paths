function res=dyfunc(xi,G)
    res= 2*xi(1)*G(1,1)+2*xi(2)*G(1,2);
    %res= -sin(xi(2))*G(1,2)+cos(xi(1))*G(2,1);
    %res=G(2,1);
end