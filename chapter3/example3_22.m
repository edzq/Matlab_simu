x=0:0.1:10;
y=exp(x);
subplot(1,3,1)    		% ��ʾ�ڵ�1����ͼ��
plot(x,y)
subplot(1,3,2)
loglog(x,y)       		% ��x���y�ᶼ��������������ͼ��
subplot(1,3,3)
semilogy(x,y)     		% ��x�ᰴ���Ա�����y�ᰴ�����������ƶ�άͼ��
