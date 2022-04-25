% boxplot(data)
% x = zeros(length(data));
% scatter(data, x)
a = 0.05;
n = length(data);
h = histogram(data,20);
[Y, E] = discretize(data, 20);
%data is normal with M mean and V variance 
M = mean(data);
st = std(data); 
% p = normcdf(,M,st);

expected = zeros(1,length(h.Values));
for i=1: length(E)-1
     expected(i) = (normcdf(E(i+1),M,st) - normcdf(E(i),M,st)) * n;
end
x = 0;
for j = 1: length(E) -1
    x = x + (((h.Values(j) - expected(j))^2)/expected(j));
end



