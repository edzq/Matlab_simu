Ts=1;                                       %��Ԫ����
%���������ο�˹������y1=sinc(t/Ts)��������������y2=sinc((x-Ts)/Ts)
x = linspace(-5,5,1000);
y1 = sinc(x/Ts);
y2=sinc((x-Ts)/Ts);
f=linspace(-(Ts+1),Ts+1);                        %���ɾ��δ��亯��
y=Ts.*rectpuls(f,Ts);
subplot(221)                                            %��ͼ
plot(x,y1,x,y2)subplot(222)
plot(f,y);
axis([-(Ts+.2),Ts+.2,0,Ts+0.2]);

