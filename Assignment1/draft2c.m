load("dataIndSSA2022.mat");

% Order the data in increasing order
task2_sorted = sort(task2_data);

sigma =  1.0026;
mean =  0.9989;
x = 0:0.01:110;

h = histogram(task2_sorted, 'Normalization','pdf', 'BinEdges', x);



% hold on
% pdf = exp(-(log(x)- mu).^2 ./ (2 * sigma.^2)) ./ (x * sigma * sqrt(2 * pi));
% plot(x, pdf, 'LineWidth', 1.5);
% hold off

logPDF = @(x) exp(-(log(x)- mean).^2 ./ (2 * sigma.^2)) ./ (x * sigma * sqrt(2 * pi));
[Y, E] = discretize(task2_sorted, 10);
chi = zeros(1, length(E));
chiSq = 0;

for i = 1: length(E)-1
    chi(i) = integral(logPDF, E(i), E(i+1));
end

for i = 1: length(E)
    y1 = (h.Values(i) - chi(i));
%     chi(i)
    if chi(i) == 0 
        chiSq = chiSq + 0;
    else
        chiSq = chiSq + ((y1^2)/chi(i));
    end 
end 
x1 = [min(task2_sorted) :0.1:max(task2_sorted)];
y = logPDF(x1);
plot(x1,y)
% 
chiSq