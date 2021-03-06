a1 = 0;
a2 = 63308;
a3 = -183326;
b1 = 86098;
b2 = 0;
b3 = -539608;
m1 = 2147483647;
m2 = 2145483479;

x(1) = 0;
x(2) = 0;
x(3) = 0;
y(1) = 0;
y(2) = 0;
y(3) = 0;

% for loop for looping over the formula to generate 10,000 random numbers
for n = 4:10000    
    x(n) = mod((a1 * x(n-1)) + (a2 * x(n-2)) + (a3 * x(n-3)), m1);
    y(n) = mod((b1 * y(n-1)) + (b2 * y(n-2)) + (b3 * y(n-3)), m2);
    z(n) = mod((x(n) - y(n)), m1);
    
end

%% Task 3b: K-S TEST
%hypothesing a uniform distribution; fHat will be the CDF where x = [0, 1]
fHat = zeros(size(task2_data));
plusD = zeros(size(task2_data)); 
minusD = zeros(size(task2_data)); 
n = length(task2_data);
for i = 1: n
    if task2_data(i) < 0
        fHat(i) = 0; 
    elseif task2_data(i) > 1
        fHat(i) = 1; 
    else 
        fHat(i) = task2_data(i); 
    end
    plusD(i) = i/ n - fHat(i); 
    minusD(i) = fHat(i) - (i-1)/n;
end

maxPlus = max(plusD); 
maxMinus = max(minusD); 
d = max(maxMinus, maxPlus);





zMax = max(z);
z = z / zMax;
Hand = reshape(floor(z*10), 2000,5);
p = zeros(1, 7);
for i =1:length(Hand)
    x = Hand(i,:);
    u = unique(x);
    if length(u) == 5
         p(1) = p(1) + 1;
    elseif length(u) == 4
         p(2) = p(2) + 1;
    elseif length(u) == 3
        l = zeros(1,length(u));
        for j=1:length(u)
            l(j) = length(find(x == u(j)));
        end

          if (max(l)== 2)
              p(3) = p(3) + 1;
          else 
              p(4) = p(4) + 1;
          end
    elseif length(u) == 2
        l = zeros(1,length(u));
        for j=1:length(u)
            l(j) = length(find(x == u(j)));
        end

          if (max(l)== 3)
              p(5) = p(5)+1;
          else 
              p(6) = p(6) + 1;
          end
    elseif length(u) == 1
        p(7) = p(7) + 1;
    end

end


probObserved = p/2000;
probExpected = [0.3024, 0.5040, 0.1080,0.072, 0.009, 0.0045, 0.0001];
chiSq = 0;
for i = 1: length(probExpected)
    if probObserved(i) == 0
        chiSq = chiSq + 0;
    else
    y1 = (probExpected(i) - probObserved(i));
    chiSq = chiSq + ((y1^2)/probObserved(i));
    end
end 
chiSq

