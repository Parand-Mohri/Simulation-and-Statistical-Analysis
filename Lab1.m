samplesize = 1000;
fxy = @(x,y) 4 - x.^2  - y.^2; %integrand
x = (5/4) *rand(1, samplesize); %uniform x ~(0,2)
y = (5/4) *rand(1, samplesize); %uniform y ~(0,x/2)
m = (5/4) * (5/4); %measure of domain
Ef = (1/samplesize)*sum(fxy(x,y)); %expected value
integral_value = m*Ef %estimation of integral