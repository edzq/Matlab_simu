%����˫����NRZ�����źž����������źź����������Ӱ�����ͼ���ļ�eyepattern1.m
N=1000;                 %�������г���
N_sample=8;             %ÿ��Ԫ��������
Ts=1;                   %��Ԫ����
dt=Ts/N_sample;         %�������
t=0:dt:(N*N_sample-1)*dt;

gt=ones(1,N_sample);    %�������ֻ�������
d=sign(randn(1,N));     %������������ɺ����ͷ��ź���������������
a=sigexpand(d,N_sample);       %��չ�����������У������ļ�����
st=conv(a,gt);                 %�������ֻ����ź�

ht1=2.5*sinc(2.5*(t-5)/Ts);    %���⣨1���������ͨH��f)�ĸ���Ҷ�任h(t)
rt1=conv(st,ht1);              %��������ź�rt1

ht2=sinc((t-5)/Ts);            %���⣨2���������ͨH��f)�ĸ���Ҷ�任h(t)
rt2=conv(st,ht2);              %��������ź�rt2

eyediagram(rt1+j*rt2,40,5);    %����MATLAB��ͼ��������ͼ��ÿ���켣40���㣬ˮƽ������귶Χ[-2.5,2.5]