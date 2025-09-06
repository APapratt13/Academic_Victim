%%Listing 1: Izračun odziva korištenjem konvolucijskog integrala

syms t tau a real % define real symbolic variables

h = heaviside(t) - heaviside(t - 1);      % impulse response
u = heaviside(t) - heaviside(t - 20);      % input signal

h = subs(h, t, tau);                      % rewrite h in terms of tau
u = subs(u, t, t - tau);                  % rewrite u(t) as u(t - tau)

y = int(h * u, tau, -Inf, Inf);          % symbolic convolution

% evaluate y at t = 1/5 
avalue = 1/5;
y = double(subs(y, t, avalue));  % substitute 'a' with actual value

% plot the result
figure
fplot(y)
grid on
xlim([-1, avalue + 2])
