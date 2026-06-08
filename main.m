clc;
clear;
close all;

disp('1 - Euler');
disp('2 - Heun');
disp('3 - RK4');
disp('4 - ode45');
disp('5 - All Methods (Default)');

choice = input('Choose method (Press Enter for All): ','s');

if isempty(choice)
    choice = 5;
else
    choice = str2double(choice);
end

h = input('Enter step size h: ');
n = input('Enter number of iterations n: ');

x0 = 0;
y0 = 1;
xf = x0 + n*h;

[xode,yode] = ode45(@f,[x0 xf],y0);

switch choice

    case 1
        [x,y] = Euler(x0,y0,h,n);

    case 2
        [x,y] = Heun(x0,y0,h,n);

    case 3
        [x,y] = RK4(x0,y0,h,n);

    case 4
        [x,y] = ode45(@f,[x0 xf],y0);

    case 5

        [xE,yE] = Euler(x0,y0,h,n);
        [xH,yH] = Heun(x0,y0,h,n);
        [xR,yR] = RK4(x0,y0,h,n);

        yExact = Exact(xE);

        figure;
        plot(xE,yExact,'k','LineWidth',2);
        hold on;

        plot(xE,yE,'ro--');
        plot(xH,yH,'bs--');
        plot(xR,yR,'g^--');
        plot(xode,yode,'m','LineWidth',1.5);

        legend('Analytical','Euler','Heun','RK4','ode45','Location','northwest');
        grid on;

        xlabel('x');
        ylabel('y');
        title('Comparison of All Methods');

        return;

    otherwise
        error('Invalid Choice');
end

yExact = Exact(x);

figure;
plot(x,yExact,'k','LineWidth',2);
hold on;
plot(x,y,'ro--','LineWidth',1.5);

legend('Analytical','Numerical','loation','nortwest' );
xlabel('x');
ylabel('y');
grid on;