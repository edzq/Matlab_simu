% 2��������źŲ���
% ����FFT��������źŵĹ����׺�����غ���
PN_coff = [0 1 1 1 0 0 0 1];  % ��������
PN_seed = [1 0 1 0 0 1 0 1]; %���ó�ʼ����
nbits = 2^8-1;
P = zeros(1,nbits);     %�������Ϊ2^8-1
samp = 5;		%����Ƶ��
PN_reg = PN_seed;
for i = 1:nbits
    P(((i-1)*samp+1):((i-1)*samp+samp)) = PN_reg(1);
    f = rem(PN_reg*PN_coff',2); % ģ2�ӷ���
    PN_reg = [f,PN_reg(1:1:7)]; % ����
end 
t1=0:100;
subplot(3,1,1);
stem(t1,P(1:101),'.k');
ylabel('���2��������');
axis([0 100 -1.5 1.5]);
T = nbits*samp;
P = 2*P-1;  % �����ƽΪ+/-
x = fft(P);             %��FFT����Ƶ��
psd = x.*conj(x);       %����PSD
Rx = real(ifft(psd))/T;   %��������غ���
psd = abs(psd)/T;
df = samp/T;
freq=[0:df:df*(length(x)-1)]-samp/2;
subplot(3,1,2);
plot(freq,fftshift(psd),'.k');
ylabel('������й�����');
subplot(3,1,3);
stem(t1,Rx(1:101),'.k');
ylabel('����غ���');
