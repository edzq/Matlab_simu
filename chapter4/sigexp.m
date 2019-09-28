function sigexp(a,s,w,t1,t2)
%������ʵ�ֻ��Ƹ�ָ���ź�ʱ����
% a : ��ָ���źŷ���
% s : ��ָ���ź�Ƶ��ʵ��
% w : ��ָ���ź�Ƶ���鲿
% t1,t2�� ���Ʋ��ε�ʱ�䷶Χ
t = t1:0.01:t2;
theta = s + j*w;
fc = a*exp(theta*t);
real_fc = real(fc);
imag_fc = imag(fc);
mag_fc = abs(fc);
phase_fc = angle(fc);

subplot(2,2,1)
plot(t,real_fc,'k')
title('ʵ��');xlabel('t');
axis([t1,t2,-(max(mag_fc)+0.2),max(mag_fc)+0.2]);
subplot(2,2,2)
plot(t,imag_fc,'k');
title('�鲿');xlabel('t');
axis([t1,t2,-(max(mag_fc)+0.2),max(mag_fc)+0.2]);
subplot(2,2,3)
plot(t,mag_fc,'k');
title('ģ');xlabel('t');
axis([t1,t2,0,max(mag_fc)+0.5]);
subplot(2,2,4)
plot(t,phase_fc,'k');
title('���');xlabel('t');
axis([t1,t2,-(max(phase_fc)+0.5),max(phase_fc)+0.5]);