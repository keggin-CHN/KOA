function [x,y,f] = CEC2017_plot(func_name)

[lb,ub,dim,fobj]=Get_CEC2017_details(func_name,2);

x=-100:2:100; y=x; %[-100,100]

L=length(x);
f=[];

for i=1:L
    for j=1:L
        f(i,j)=fobj([x(i),y(j)]);
    end
end

end


