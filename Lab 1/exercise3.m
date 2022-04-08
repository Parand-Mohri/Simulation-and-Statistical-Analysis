N = 1000;
L = 0.20;
xb = L + rand(1,N)*(1-2*L);
yb = L + rand(1,N)*(1-2*L);
angs = rand(1,N)*360;
xe = xb + L*cosd(angs);
ye = yb + L*sind(angs);
n = sum(floor(xb/L) ~= floor(xe/L));
piEstimate = 2 * N / n