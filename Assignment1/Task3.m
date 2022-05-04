a1 = 0;
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

% for loop for looping over the formula to generate 10,000 random numbers
for n = 4:10000    
    x(n) = mod((a1 * x(n-1)) + (a2 * x(n-2)) + (a3 * x(n-3)), m1);
    y(n) = mod((b1 * y(n-1)) + (b2 * y(n-2)) + (b3 * y(n-3)), m2);
    
    z(n) = mod((x(n) - y(n)), m1);
    
end
zMax = max(z);
z = z / zMax;
Hand = reshape(floor(z*10), 2000,5);
% alldif, one, two, threekind, full, fourKind, fiveKind = 0;
p = zeros(1, 7);
for i =1:length(Hand)
    if(allDif(Hand(i,:)))
        p(1) = p(1) + 1;
    elseif(onePair(Hand(i,:)))
        p(2) = p(2) + 1;
    elseif(twoPair(Hand(i,:)))
        p(3) = p(3) + 1;
    elseif(treeOfAKind(Hand(i,:)))
        p(4) = p(4) + 1;
    elseif(fullHouse(Hand(i,:)))
        p(5) = p(5) + 1;
    elseif(fourOfAKind(Hand(i,:)))
        p(6) = p(6) + 1;
    elseif(fiveOfKind(Hand(i,:)))
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
    y1 = (probExpected(i) - probObserved(i))
    chiSq = chiSq + ((y1^2)/probObserved(i));
    end
end 
chiSq

function y = allDif(x)
    x = unique(x);
    if length(x) == 5
        y = true;
    else
        y = false;
    end
end

function y = onePair(x)
    x = unique(x);
    if length(x) == 4
        y = true;
    else
        y = false;
    end
end

function y = twoPair(x)
    u = unique(x)
    if length(u) == 3
        l = zeros(1,length(u));
        for i=1:length(u)
            l(i) = length(find(x == u(i)));
        end

          if (max(l)== 2)
              y = true;
          else 
              y = false;
          end
    else
        y = false;
    end
end
function y = treeOfAKind(x)
    u = unique(x);
    if length(u) == 3
        l = zeros(1,length(u));
        for i=1:length(u)
            l(i) = length(find(x == u(i)));
        end

          if (max(l)== 3)
              y = true;
          else 
              y = false;
          end
    else
        y = false;
    end
end

function y = fullHouse(x)
    u = unique(x);
    if length(u) == 2
        l = zeros(1,length(u));
        for i=1:length(u)
            l(i) = length(find(x == u(i)));
        end

          if (max(l)== 3)
              y = true;
          else 
              y = false;
          end
    else
        y = false;
    end
end

function y = fourOfAKind(x)
    u = unique(x);
    if length(u) == 2
        l = zeros(1,length(u));
        for i=1:length(u)
            l(i) = length(find(x == u(i)));
        end

          if (max(l)== 4)
              y = true;
          else 
              y = false;
          end
    else
        y = false;
    end
end


function y = fiveOfKind(x)
    u = unique(x);
    if length(u) == 1
        y = true;
    else
        y = false;
    end
end


%alldif, 1pair, 2pairs, 3ofakind, 4ofakind, 5ofakind 
function n = getPattern(x)
    r = unique(x)
    if length(r)==5
        n = 1
    else len
