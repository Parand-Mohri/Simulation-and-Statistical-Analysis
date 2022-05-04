
load('dataIndSSA2022.mat')
%% Task 1
% visualization
figure;
x = zeros(1, length(task1_data));
scatter(task1_data, x)
figure;
h = histogram(task1_data,50);
figure;
boxplot(task1_data)

data_no_outlier = rmoutliers(task1_data);
histogram(data_no_outlier)

% 7 number summary 
percentile = prctile(data_no_outlier,[2,9,25,50,75,91,98]);

m = mean(data_no_outlier); %mean
var = var(data_no_outlier); % variance 
st = std(data_no_outlier); % standard deviation 
n = length(data_no_outlier);
skweness = (sum((data_no_outlier - m).^3))/((n -1 ) * (st^3))


%% Task 2
 MLEmean = sum(log(task2_data)) / length(task2_data);
 MLEvar = sum((log(task2_data) - MLEmean).^2) /length(task2_data);
 std2 = sqrt(MLEvar);
 logNormPDF = @(x) (1 ./ (x * std2 * sqrt(2 * pi))) .* exp(- ((log(x) - MLEmean).^2)/ (2 * MLEvar));
x =[min(task2_data):.01:max(task2_data)];
h = histogram(task2_data, 10, 'Normalization','pdf');
hold on
plot(x, logNormPDF(x));
hold off

alpha = 0.05;
[Y, E] = discretize(task2_data, 10);
expected = zeros(1, length(E));
for i=1: length(E)-1
     expected(i) = integral(logNormPDF, E(i), E(i+1));
end
x = 0;
for j = 1: length(E)   
    if(expected(j) ~= 0)
        x = x + (((h.Values(j) - expected(j))^2)/expected(j));
    end
end



%% Task 3
a2 = 63308;
a3 = -183326;
b1 = 86098;
b2 = 0;
b3 = -539608;
m1 = 2147483647;
m2 = 2145483479;

x(1) = 0;
x(2) = 63308;
x(3) = -183326;
y(1) = 86098;
y(2) = 0;
y(3) = -539608;

x = zeros(1, 10000);
y = zeros(1, 10000);

for n = 4:10000    
    x(n) = mod((a1 * x(n-1)) + (a2 * x(n-2)) + (a3 * x(n-3)), m1);
    y(n) = mod((b1 * y(n-1)) + (b2 * y(n-2)) + (b3 * y(n-3)), m2);
    
    z(n) = mod((x(n) - y(n)), m1);
    
end





% [Y, E] = discretize(task1_data , 50);
% x =[-3:.01:3];
% pd = makedist('Lognormal');
% y = pdf(pd,x);
% plot(x,y)
% M = mean(task2_data);
% st = std(task2_data);
%  Min = min(task1_data)
%  Max = max(task1_data)

% seven number summary 




% lognstat
% y = lognpdf( x , lognstat(0) , lognstat(1) );
% y = normpdf( x , exp(M +(st/2)) , st);
% plot(x,y)

    