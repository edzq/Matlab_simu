function y=lcgrand(seed,n)
% ʹ��sch����Schrage�㷨
% ����     x=(a*x) mod M
M = 2147483647;
a = 16807;
r = 2836;
q = 127773;
mask=123459876; %seed=0ʱ����
seed = bitxor(seed, mask);
y = zeros(1,n);
for i=1:n
    k  = fix(seed/q);
    seed = a*(seed-k*q)-r*k;
    if(seed<0) 
        seed = seed+M;
    end
    y(i) = seed/M;
end 

