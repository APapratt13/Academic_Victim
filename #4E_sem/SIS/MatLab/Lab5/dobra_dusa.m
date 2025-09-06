%% ZADATAK 1
% a*y[n] + b*y[n-1] + c*y[n-2] = d*u[n] + e*u[n-1] + f*u[n-2]
a =1 ;
b =-11 ;
c = -4;
d = -18;
e = -17;
f = 13;

H = (d - e + f) / (a - b + c);

if H < 0
    kut = 3.14;
else
    kut = 0;
end

H = abs(H);

disp(['|H| = ', num2str(H)]);
disp(['kut iznosi: ', num2str(kut)]);

%% ZADATAK 2

%%A dio zadatka je odgovor NE
a = -6;  
b = 3;
D = 1;   % u[n] = D*mi[n]

syms n

K = (b * D) / (1 - a);

E = -K;

q = a;

expr = E * q^n + K;

expr_decimal = vpa(expr, 4);


disp('Vrijednost izraza E * q^n + K:');
disp(expr_decimal);

%% ZADATAK 3
% a*y''(t) + b*y'(t) + c*y(t) = d*u''(t) + e*u'(t) + f*u(t)
a = 1;  
b = 5;
c = -3;
d = 1;
e = 4;
f = -4;
g = 5;   %u(t) = g*mi(t)
h = 1;   %h = y(0-)
i = 1;   %i = y'(0-)

y1 = h + g;
y2 = e * g + i - b * (y1 - h);

disp(['y(0+) = ', num2str(y1)]);
disp(['y''(0+) = ', num2str(y2)]);

%% ZADATAK 4
% a*y'(t) + b*y(t) = c*u'(t) + d*u(t)
a =1 ;  
b = 5;
c = 1;
d = 2;
e = 4;       %u(t) = e*mi(t)
f = -1;       %f = y(0-)
t = 0.13;       %vrijeme

S = -b;

K = (d * e) / b;

y = c * e + f;

g = y - K;

z = g * exp(S * t);

disp(['Vlastita frekvencija sustava iznosi : ', num2str(S)]);
disp(['Partikularno rješenje u trenutku t : ', num2str(K)]);
disp(['Prirodni odziv u trenutku t : ', num2str(z)]);