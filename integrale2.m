function int=integrale2(y,dy,t,k,int_type)
    %x=3^(-2*k)/2:3^(-2*k):t;
    %x=0:3^(-2*k):t;
    x=0:10^(-k):t;
   
    %x=[0,x, t];
    x=[x, t];
    
    A=0;
    xf=cpeano(x(1),15);
    int=0;
    for i=1:length(x)-1
            xi=xf;
            xf=cpeano(x(i+1),15);
            A=area_opt(x(i+1),k)-area_opt(x(i),k)-xi(1)*xf(2)+xi(2)*xf(1);
            dx=xf-xi;
            G=0.5*[dx(1)*dx(1),dx(1)*dx(2)+A;
               dx(1)*dx(2)-A,dx(2)*dx(2)];
            
            if int_type=='r'
                int=int+y(xi,dx)+dy(xi,G);
            elseif int_type=='y'
                int=int+y(xi,dx);
            end
            
    end
end 