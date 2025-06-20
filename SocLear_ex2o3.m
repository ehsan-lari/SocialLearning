clear;
clc;

t_max = 1000;

mu_0 = [1/3 1/3 1/3]';
mu = mu_0;
n_states = length(mu);

mu_temp = zeros(n_states,1);

v = [1 1.1 0.9]';

for t = 1:t_max
    x = 1 + randn;
    for n = 1:n_states
        mu_temp(n) = mu(n)*exp( -( x - v(n) )^2 / 2 ) / sum(mu.*exp( -( x*ones(n_states,1) - v ).^2 / 2 ));
    end
    mu = mu_temp; 
    % bar(mu); hold on;
end

bar(mu);