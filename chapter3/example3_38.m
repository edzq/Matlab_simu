[x,y,z]=sphere(30);      
surf(x,y,z)             		%������ά��λ����
shading interp           	%���ò岹��������
hold on
x1=2*x;
y1=2*y;
z1=2*z;
mesh(x1,y1,z1)           	%�������߿򹹳ɵİ뾶Ϊ2����ά����
hidden off               	%���������͸��������
axis equal            
