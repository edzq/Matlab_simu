function y=gausamp(my,Cy)
% ���ɸ�˹��������
% my: ��ֵ������
% Cy: �������
x = bmgauss(0,1,length(my));% ������˹�������
y = x*sqrtm(Cy)'+my';
