[x,y]=meshgrid(-8:0.5:8);
z=sqrt(x.^2+y.^2)+eps;
f=sin(z)./z;
mesh(f)            		%�������߿򹹳ɵı���ͼ��
meshc(f)           		%���ƴ��������ߵı���ͼ��
meshz(f)           		%���ƴ��������ߵı���ͼ��
