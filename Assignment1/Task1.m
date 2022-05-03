boxplot(task1_data)
% x = zeros(1, length(task1_data));
% scatter(task1_data, x)
% a = 0.05;
n = length(task1_data);
% h = histogram(task1_data,50);
% [Y, E] = discretize(task1_data , 50);
% x =[-3:.01:3];
% pd = makedist('Lognormal');
% y = pdf(pd,x);
% plot(x,y)
M = mean(task2_data);
st = std(task2_data);
%  Min = min(task1_data)
%  Max = max(task1_data)

% seven number summary 



x = [-100:.01:100];
% lognstat
% y = lognpdf( x , lognstat(0) , lognstat(1) );
y = normpdf( x , exp(M +(st/2)) , st);
plot(x,y)

    