%F(x)
%eps - точность
%определять отрезок самостоятельно
%подключить оси
eps=0.01;
F = @(x) x.^3+6.*x-1;
x=linspace(-1,1);
plot(x,F(x));     %График
xlabel('OX');
ylabel('OY');
grid on;
a = 0;
b = 1;

d = bisesection(F, a, b, eps);
n = NewtonMethod(F, a, b, eps);
s = simpleMethod(F, a, b, eps);

%Метод дихотомии
function x0 = bisesection(F, a, b, eps)
    while (b-a)/2 > eps
        c = (a+b)/2;
        if F(c) == 0 
            x0 = c;
            return;
        elseif F(a)*F(c) < 0 
            b = c;
        else
            a = c;
        end
    end
    x0 = (a+b)/2;
end

%Метод Ньютона (касательных)
function x = NewtonMethod(F,a,b,eps)

if(F(b)*diff(F(b),2)>0)
     x = b;
else
    x = a;
end
F_prime = (F(b+eps)-F(b)) / eps;

while(abs(F(x))>= eps)
    x = x - F(x)/F_prime;
    F_prime = (F(b+eps)-F(b)) / eps;
end
end

%Метод простой итерации

function x0 = simpleMethod(F, a, b, eps)
if(F(b)*diff(F(b),2)>0)
     x = b;
else
    x = a;
end
while true
    x0=x;
    df = (F(x0+eps)-F(x0))./eps;
    M = 1.01 * df;
    x = x0 - F(x0) ./ M;
    if(abs(x - x0) <= eps )
        break;
    end
end
end