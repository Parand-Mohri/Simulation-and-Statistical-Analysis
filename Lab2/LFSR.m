function [x] = LFSR(seed,q,r)
%LFSR Summary of this function goes here
%   Detailed explanation goes here
x = zeros(2^length(seed),length(seed));
x(1,:) = seed;
for i = 1 :2^length(seed)
    s = x(i,:);
    x(i+1,1:length(seed)-1) = s(:,2:length(seed));
    if(x(i,r) == x(i,q))
        x(i+1, length(seed)) = 0;
    else
         x(i+1, length(seed)) = 1;
    end
end
end

