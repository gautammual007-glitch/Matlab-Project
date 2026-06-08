function [x,y] = Heun(x0,y0,h,n)

x = zeros(1,n+1);
y = zeros(1,n+1);

x(1) = x0;
y(1) = y0;

for i = 1:n

    slopeLeft = f(x(i),y(i));

    A = x(i) + h;
    B = y(i) + h*slopeLeft;

    slopeRight = f(A,B);

    y(i+1) = y(i) + h*(slopeLeft+slopeRight)/2;
    x(i+1) = A;

end

end