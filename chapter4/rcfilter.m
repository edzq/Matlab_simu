echo off
B=1;    % ���÷������
fs=4*B;     % ����Ƶ��
ts = 1/fs; 
Nfft=128;   % ����FFT����Ŀ
AVG=50;     
sigma=sqrt(fs); 
t =0:ts:1024;
N = length(t);
s1 = cos(t);
psd_s1 = abs(fft(s1,Nfft).^2)/(N+1); %����:ȷ�����źŹ������ܶ�
psd_n1=zeros(1,Nfft);
psd_x = zeros(1,Nfft);
for j=1:AVG
    n1=sigma*randn(1,N);
    x = s1+n1;
    psd_n1 = psd_n1+abs(fft(n1,Nfft).^2)/(N+1); %����:�����������ܶ�
    psd_x = psd_x+abs(fft(x,Nfft).^2)/(N+1);  % �����źŹ������ܶ�
end
psd_n1 = psd_n1/AVG;
psd_x = psd_x/AVG;
f=(0:length(psd_s1)-1)/ts/length(psd_s1); %����Ƶ�ʷ�Χ
f=f-fs/2;
Hf2=1./(1+(2*pi*f).^2);
subplot(3,1,1);
psd_s2 = Hf2.*fftshift(psd_s1); %�����ȷ�����źŹ������ܶ�
plot(f,psd_s2,'k');
axis([-1,1,0,1]);
xlabel('f');ylabel('�������ܶ�(ȷ���ź�)');
subplot(3,1,2);
psd_n2 = Hf2.*fftshift(psd_n1); %���:�����������ܶ�
plot(f,psd_n2,'k');
axis([-1,1,0,0.2]);
xlabel('f');ylabel('�������ܶ�(�����ź�)');
subplot(3,1,3);
psd_x2 = Hf2.*fftshift(psd_x); % ����źŹ������ܶ�
plot(f,psd_x2,'k');
xlabel('f');ylabel('�������ܶ�(����źţ�');
axis([-1,1,0,1]);
SNR=trapz(f,psd_s2)/trapz(f,psd_n2); %��ֵ��������
text = ['��������:  ',num2str(SNR,15),'.'];
disp(text);
