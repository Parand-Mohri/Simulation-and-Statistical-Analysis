function [x] = LFSR(seed,q,r)
%LFSR Summary of this function goes here
%   Detailed explanation goes here
x = zeros(2^length(seed),5);
x(1,:) = seed;
for i = 1 :2^length(seed)
    s = x(i,:);
    x(i+1,1:4) = s(:,2:5);
    if(x(i,r) == x(i,q))
        x(i+1, 5) = 0;
    else
         x(i+1, 5) = 1;
    end
end
end

