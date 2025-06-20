clear;
clc;

t_max = 100;

mu_0 = [1/3 1/3 1/3]';
mu = mu_0;
n_states = length(mu);

mu_temp = zeros(n_states,1);

v = [0.5 1 1.5]';

MU_all = zeros(n_states,t_max);

for t = 1:t_max
    MU_all(:,t) = mu;
    x = 0.6 + randn;
    for n = 1:n_states
        mu_temp(n) = mu(n)*exp( -( x - v(n) )^2 / 2 ) / sum(mu.*exp( -( x*ones(n_states,1) - v ).^2 / 2 ));
    end
    mu = mu_temp;    
end

plot(1:t_max,MU_all);
set(findall(gca, 'Type', 'Line'),'LineWidth',2);