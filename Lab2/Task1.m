m = int64( 2 ^ 31);
a = int64(2 ^ 16 + 3);
c = 0;
seed = int64(2 ^ 20);

Zi = @(i) mod(((a * i) + c) , m);

zs = zeros(10000,1);
zs(1) = seed;
for index = 1:10000-1
    zs(index+1) = Zi(f(index));
end
zs = double(zs)/double(m);

plot(zs(1:end-1),zs(2:end),'.')
plot3(zs(1:end-2), zs(2:end-1), zs(3:end),'.')



