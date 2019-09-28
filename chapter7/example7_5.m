fs=800;
T=16;
dt=1/fs;
t=[-T/2:dt:T/2-dt];
df=1/T;
f=[-fs/2:df:fs/2-df];
fm=1;
Kf=10;
fc=20;
m=cos(2*pi*fm*t);
phi=2*pi*Kf*cumsum(m)*dt; %�Ե����ź�����������
s=cos(2*pi*fc*t+phi);  %FM�ѵ��ź�
S=t2f(s,fs);
figure(1)
plot(t,s)  % �����ѵ��źŵĲ���
axis([0,1,-1,1])
figure(2)
plot(f,abs(S).^2)   % �����ѵ��źŵĹ�����
axis([-40,40,0,max(abs(S).^2)])  % �۲�˫�ߴ�������
