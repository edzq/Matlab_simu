x=0:0.01:5;
y=sin(pi*x);            %�����Ƶ�������ʽ���㵥���Էǹ�����Ĺ�����
y=y./(pi*x);
y(1)=1;
snrzgonglv=y.*y;
snrzgonglv=snrzgonglv/4;
y=sin(pi*x/2);          %��������˫����Ĺ�����
y=y./(pi*x/2);
y(1)=1;
machegonglv=sin(pi*x/2).*sin(pi*x/2);
machegonglv=machegonglv.*y;
machegonglv=machegonglv.*y;
x=x*pi;
milergonglv=(23-2*cos(x)-22*cos(2*x)-12*cos(3*x)+5*cos(4*x)+12*cos(5*x)+...
+2*cos(6*x)-8*cos(7*x)+2*cos(8*x))./(17+8*cos(8*x));
t=x.*x;
milergonglv=milergonglv./t;
milergonglv(1)=0.2;
x=x/pi;
plot(x,snrzgonglv,'--',x,machegonglv,':',x,milergonglv); %��ͼ
legend('snrzgonglv','machegonglv','milergonglv');    %��ͼ�ν�������Ͻǻ���ͼ�и������ߵ�ͼ��