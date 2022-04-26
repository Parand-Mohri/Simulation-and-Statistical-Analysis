% boxplot(task1_data)
x = zeros(1, length(task1_data));
scatter(task1_data, x)
a = 0.05;
n = length(task1_data);
% h = histogram(task1_data,50);
[Y, E] = discretize(task1_data , 50);
% %data is normal with M mean and V variance 
M = mean(task1_data);
st = std(task1_data); 
% % p = normcdf(,M,st);
% 
% expected = zeros(1,length(h.Values));
% for i=1: length(E)-1
%      expected(i) = (normcdf(E(i+1),M,st) - normcdf(E(i),M,st)) * n;
% end
% x = 0;
% for j = 1: length(E) -1
%     x = x + (((h.Values(j) - expected(j))^2)/expected(j));
% end
% 
% 
% 
