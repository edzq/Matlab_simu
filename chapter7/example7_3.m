fs=800;    % �������ʣ���λkHz
T=200;    % Ƶ�׷ֱ��ʣ���λms
dt=1/fs;
t=[-T/2:dt:T/2-dt];
df=1/T;
f=[-fs/2:df:fs/2-df];
fm=2;     % �����źŵ�Ƶ�ʣ���λkHz
fc=20;     % �ز�Ƶ�ʣ���λkHz
m=cos(2*pi*fm*t);
s=m.*cos(2*pi*fc*t);  % DSB�ѵ��ź�
S=t2f(s,fs);   % ���ѵ��ź�������Ҷ�任
figure(1)
plot(t,s)   
axis([0,1,-1,1])
figure(2)    
plot(f,abs(S))       % �����ѵ��źŵ�˫�ߴ�������
axis([-30,30,0,max(abs(S))])   %���úᡢ����Ĺ۲췶Χ
