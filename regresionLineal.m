x = load('ex2x.dat');
y = load('ex2y.dat');

figure
plot(x,y, 'o');
title('Regresión lineal')
ylabel('Altura en metros');
xlabel('Edad en años');

%%%%%% plot %%%%%%%%%%
verbose = false;

m = length(y);
x = [ones(m, 1), x]; %Add a column of ones to x
alpha = 0.02;
t = zeros(2,1);

J_vals = zeros(100, 100);
theta0_vals = linspace(-3, 3, 100);
theta1_vals = linspace(-1, 1, 100);

for i = 1:length(theta0_vals)
  for j = 1:length(theta1_vals)
    h = x*t;
    t1 = t(1) - alpha * (1/m)* sum(h-y);
    t2 = t(2) - alpha * (1/m)* sum((h-y) .* x(:,2));
    t(1) = t1;
    t(2) = t2;
    if (verbose)
      printf("Theta_0 = %f  Theta_1 = %f\n",t1,t2);
    end
    %if (display)
      %
    %end
    J_vals(i,j) = 1/(2*m) * sum((h-y).^2);
  end
end

hold on;
%%% Usar comet or plot con drawnow y pause %%%
comet(x(:,2),x*t);
%hold on;
%plot(x(:,2), x*t,'-r');
%drawnow;
%pause(0.00001)
hold off;
    