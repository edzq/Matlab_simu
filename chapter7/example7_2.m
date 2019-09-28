fs=800;    % �������ʣ���λkHz
T=200;    % Ƶ�׷ֱ��ʣ���λms
dt=1/fs;
t=[-T/2:dt:T/2-dt];
df=1/T;
f=[-fs/2:df:fs/2-df];
fm=1;     % �����źŵ�Ƶ�ʣ���λkHz
fc=10;     % �ز�Ƶ�ʣ���λkHz
A=3;      % ֱ���ź�
m=cos(2*pi*fm*t)+A;
s=m.*cos(2*pi*fc*t); % �ѵ��ź�
y1=abs(hilbert(s))-A;% ���а���첨����ȥ��ֱ������
subplot(2,1,1)
plot(t,y1)
title(��AM�ź�ͨ�������ŵ��Ľ���źš�)
ss=awgn(s,20,��measured��);  % AM�ź�ͨ��AWGN�ŵ�������������
y2= abs(hilbert(ss))-A;
subplot(2,1,2)
plot(t,y2)
title(�������Ϊ20dBʱ�Ľ���źš�)
