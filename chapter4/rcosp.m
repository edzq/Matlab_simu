N = 1024;
AVG=50;
maxlags=64;           %�ӳ�
nfft=512;             %Ƶ�ʹ�����Ŀ
Rx_m = zeros(1,2*maxlags+1);
Px_m = zeros(1,maxlags);
Sx_m=zeros(1,nfft);
n = 0:N-1;
t = n/maxlags;
for j = 1:AVG
    X = cos(2*pi*10*t+ 2*pi*rand);
    Sx_m = Sx_m+abs(fft(X,nfft).^2)/nfft; % �����׹���
    [Rx,lags]=xcorr(X,maxlags,'unbiased'); % ������غ�������
    Px = fftshift(abs(fft(Rx(1:maxlags))));% ����غ�������FFT�任������
    Rx_m = Rx_m+Rx;
    Px_m = Px_m + Px;
end
Rx_m = Rx_m/AVG;
Sx_m = Sx_m/AVG;
Px_m = Px_m/AVG;
subplot(3,1,1);
plot(2*pi*lags/maxlags,Rx_m,'k');
xlabel('ʱ���� (��λ:2\pi \tau)');ylabel('����غ���');
title('����غ���');
axis([-2*pi,2*pi,-1.2,1.2]);
subplot(3,1,2);
df=maxlags/(nfft);                 %�ֱ���
fr = [0:df:df*(nfft-1)]-maxlags/2;
stem(fr,fftshift(Sx_m/max(Sx_m)),'.k');
axis([-20,20,0,1.2]);
xlabel('Ƶ��');ylabel('������(PSD)');
title('������: ����ͼ����PSD')
subplot(3,1,3);
df = 1;                            %�ֱ���
freq=[0:df:(maxlags-1)]-maxlags/2;
stem(freq,Px_m/max(Px_m),'ok');
axis([-20,20,0,1.2]);
xlabel('Ƶ��');ylabel('������(PSD)');
title('������: ����غ���������Ҷ�任')