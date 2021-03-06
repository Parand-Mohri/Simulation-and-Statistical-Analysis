
load('dataIndSSA2022.mat')
%% Task 1
figure;
x = zeros(1, length(task1_data));
scatter(task1_data, x)
figure;
histogram(task1_data,50);
figure;
boxplot(task1_data)

data_no_outlier = rmoutliers(task1_data);
figure;
histogram(data_no_outlier,50);
% 7 number summary whith normalized data whithout outlier
percentiles = prctile(data_no_outlier/max(data_no_outlier),[2,9,25,50,75,91,98]);
%for normal distribution the distance between these need to be same 
%and as we can see the distance is not exactly the same but its close.

m = mean(data_no_outlier); %mean
var = var(data_no_outlier); % variance 
st = std(data_no_outlier); % standard deviation 
n = length(data_no_outlier);
% skweness is positive so the data is skewed to the right 
skweness = (sum((data_no_outlier - m).^3))/((n -1 ) * (st^3));
%hypothesis
% from data generated without outliers the hypothesis that we can 
% make is the data is normally distributed with right skweness. 

%% Task 2
% relevant parameters of the hypothesized distribution with MLE.
MLEmean = sum(log(task2_data)) / length(task2_data);
MLEvar = sum((log(task2_data) - MLEmean).^2) /length(task2_data);
std2 = sqrt(MLEvar);
% PDF of log normal distribution 
logNormPDF = @(x) (1 ./ (x * std2 * sqrt(2 * pi))) .* exp(- ((log(x) - MLEmean).^2)/ (2 * MLEvar));
x =[min(task2_data):.01:max(task2_data)];
% make histogram normalized with 61 bins
h = histogram(task2_data, 61, 'Normalization','pdf');
hold on
%plot of real normal log distribution
plot(x, logNormPDF(x));
hold off
%as seen they look really close to each other
%null hypothesis : the distribution is log normal
% alpha = 0.05
% degree of freedom = 60 (number of bins - 1)
% critical value = 43188
% get the edges for each bin with 61 bins
[Y, E] = discretize(task2_data, 61);
expected = zeros(1, length(E));
%calculate expected values of log normal distribution
for i=1: length(E)-1
     expected(i) = integral(logNormPDF, E(i), E(i+1));
end
% calculate chi square test 
x = 0;
for j = 1: length(E)   
    if(expected(j) ~= 0) 
        % if the expected value is 0 we dont do it becaue
        %x get to infinity
        x = x + (((h.Values(j) - expected(j))^2)/expected(j));
    end
end
% x < critical value -->  no reason to reject null hypothesis


%% Task 3
a1 = 0;
a2 = 63308;
a3 = -183326;
b1 = 86098;
b2 = 0;
b3 = -539608;
m1 = 2147483647;
m2 = 2145483479;
% for the first 3 values of x and y im just putting zeros
x = zeros(1, 10000);
y = zeros(1, 10000);
%random number generator
for n = 4:10000    
    x(n) = mod((a1 * x(n-1)) + (a2 * x(n-2)) + (a3 * x(n-3)), m1);
    y(n) = mod((b1 * y(n-1)) + (b2 * y(n-2)) + (b3 * y(n-3)), m2);
    z(n) = mod((x(n) - y(n)), m1);
end

%ks test
task2_data_sort = sort(task2_data); % sort the data
fHat = zeros(size(task2_data_sort));
plusD = zeros(size(task2_data_sort)); 
minusD = zeros(size(task2_data_sort)); 
n = length(task2_data_sort);
for i = 1: n
    if task2_data_sort(i) < 0
        fHat(i) = 0; 
    elseif task2_data_sort(i) > 1
        fHat(i) = 1; 
    else 
        fHat(i) = task2_data_sort(i); 
    end
    plusD(i) = i/n - fHat(i); 
    minusD(i) = fHat(i) - (i-1)/n;
end
% calculate max d min d and d 
maxPlus = max(plusD); 
maxMinus = max(minusD); 
d = max(maxMinus, maxPlus);
% null hypothesis --> data is randomly generated
% alpha = 0.05
% case = we know all values 
% critical value = 1 .358
% d < critical value --> no reson to reject null hypothesis

z = z / max(z);
Hand = reshape(floor(z*10), 2000,5);
% p = [no.alldif, no.onepair, no.twopair, no.treeofkind,
% no.fullhouse, no.fourofkind, no.fiveofkind]
p = zeros(1, 7);
% poker test
for i =1:length(Hand)
    x = Hand(i,:);
    u = unique(x);
    if length(u) == 5 
         p(1) = p(1) + 1; % all dif
    elseif length(u) == 4
         p(2) = p(2) + 1;% one pair
    elseif length(u) == 3
        l = zeros(1,length(u));
        for j=1:length(u)
            l(j) = length(find(x == u(j)));
        end

          if (max(l)== 2)
              p(3) = p(3) + 1; % two pair
          else 
              p(4) = p(4) + 1; % tree of a kind
          end
    elseif length(u) == 2
        l = zeros(1,length(u));
        for j=1:length(u)
            l(j) = length(find(x == u(j)));
        end

          if (max(l)== 3)
              p(5) = p(5)+1; % full house
          else 
              p(6) = p(6) + 1; % four of a kind
          end
    elseif length(u) == 1
        p(7) = p(7) + 1; % five of a kind
    end

end

probObserved = p/2000; % get the probability
% expected probability from slides
probExpected = [0.3024, 0.5040, 0.1080,0.072, 0.009, 0.0045, 0.0001];
% chi square test 
x = 0;
for i = 1: length(probExpected)
    if probObserved(i) ~= 0
    x = x + (((probExpected(i) - probObserved(i)).^2)/probObserved(i));
    end
end 
% null hypothesis --> data randomly generated
% alpha = 0.05
% degree of freedom = 6 
% critical value = 12.592
% x < critical value -- > no reason to reject null hypothesis




    