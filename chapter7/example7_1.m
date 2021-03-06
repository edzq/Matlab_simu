fs=800;    % 采样速率，单位kHz
T=200;    % 频谱分辨率，单位ms
dt=1/fs;    % 时域采样间隔
t=[-T/2:dt:T/2-dt];    % 时域采样点
df=1/T;    % 频域采样间隔
f=[-fs/2:df:fs/2-df];    % 频域采样点
fm=1;     % 调制信号的频率，单位kHz
fc=10;     % 载波频率，单位kHz
A=3;      % 直流信号
m=cos(2*pi*fm*t)+A;  % 调制信号叠加直流信号
s=m.*cos(2*pi*fc*t);   % 已调信号
S=t2f(s,fs);    % 对已调信号做傅里叶变换
figure(1)   
plot(t,s)       % 画出已调信号的波形
axis([0,2,-4,4])  % 设置图形的观察范围
figure(2)    
plot(f,abs(S))  % 画出已调信号的幅度谱
axis([-15,15,0,max(abs(S))])   %设置横、纵轴的观察范围
