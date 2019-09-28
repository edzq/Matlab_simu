m=5;
n=2^m-1;
theta=pi*(-n:2:n)/n;
phi=(pi/2)*(-n:2:n)'/n;
x=cos(phi)*cos(theta);
y=cos(phi)*sin(theta);
z=sin(phi)*ones(size(theta));
f=hadamard(2^m);
surf(x,y,z,f)             		%�����ɶ��С�湹�ɵı���ͼ��
axis square               		%ͼ�������趨Ϊ������
colormap([0 0 0;1 1 1])   		%������ͼ�ε�С����ɫΪ�ڰ����

