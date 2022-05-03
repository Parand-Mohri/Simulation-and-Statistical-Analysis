M = mean(task2_data);
st = std(task2_data); 
[Y, E] = discretize(task2_data, 100);
n = length(task2_data);
h = histogram(task2_data,100);
% expected = zeros(1,length(h.Values));
% for i=1: length(E)-1
%      expected(i) = (logncdf(E(i+1),M,st) - logncdf(E(i),log(M),log(st))) * n;
% end
% x = 0;
% for j = 1: length(E) -1
%     x = x + (((h.Values(j) - expected(j))^2)/expected(j));
% end

% histogram(expected,100)
