%������ͨ�������˲���
%��������źŵĹ����׺�����غ���
FH_L=-2;
FH_R=2;
f=FH_L:0.01:FH_R;
subplot(2,1,1);
plot(f,ones(size(f)),'k');
axis([-2.5,2.5,0,2]);
xlabel('f (��λ: Hz)');ylabel(' �������ܶ� ');
subplot(2,1,2);
t=-5:0.01:5;
R=2*sinc(2*t);
plot(t,R,'k');
xlabel('\tau (��λ: Second)');ylabel(' ����غ��� ');