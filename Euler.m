function [x,y] = Euler(x0,y0,h,n)

x = zeros(1,n+1);
y = zeros(1,n+1);

x(1) = x0;
y(1) = y0;

for i = 1:n
    x(i+1) = x(i) + h;
    y(i+1) = y(i) + h*f(x(i),y(i));
end

end