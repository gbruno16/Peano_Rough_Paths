function y=cpeano(x,n)
if x==1
    y=[1;1];
else 
    y=zeros(2,1);
    t=base3(x,2*(n));
    y=peano(t,n);
end 
end