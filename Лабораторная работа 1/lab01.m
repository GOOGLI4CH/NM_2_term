f = @(x) sin(x);
f1 = @(x) tan(5.*x)./(cos(5.*x)).^2;
f2 = @(x) cos(5.*x.^2-3.*x+10);

a = -4.5;
b = -4.3;
n = 100;
n2 = 10;

s1(1) = trapezoid(a, b, n, f);
s1(2) = trapezoid(a, b, n2, f);
s2(1) = integral(f, a, b);
err_abs(1) = abs(s1(2)-s1(1));
err_rel(1) = err_abs(1)/s2(1);

s1(3) = rectangle(a, b, n, f1);
s1(4) = rectangle(a, b, n2, f1);
s2(2) = integral(f1, a, b);
err_abs(2) = abs(s1(4)-s1(3));
err_rel(2) = err_abs(2)/s2(2);

s1(5) = simpsons(a, b, n, f2);
s1(6) = simpsons(a, b, n2, f2);
s2(3) = integral(f2, a, b);
err_abs(3) = abs(s1(6)-s1(5));
err_rel(3) = err_abs(3)/s2(3);

function sum = trapezoid(a, b, n, f)
    h = (b - a) / n;
    x = a;
    sum = 0;
    while(x <= (b - h))
        sum = sum + (f(x)+f(x+h))/2*h;
        x = x + h;
    end
end
function sum = rectangle(a, b, n, f)
    h = (b - a) / n;
    x = a;
    sum = 0;
    while (x <= b - h) 
        sum = sum + (f((2*x + h)/2))*h;
        x = x + h;
    end
end
function sum = simpsons(a, b, n, f)
    h = (b - a) / n;
    x = a;
    sum = 0;
    while (x <= b - 2*h) 
        sum = sum + (f(x)+4*f(x+h) + f(x+2*h))/3*h;
        x = x + 2*h;
    end
end