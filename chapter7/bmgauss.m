function [y1,y2]=bmgauss(m,sigma,N)
% ������˹�������Box-Muller�㷨
% ���ø�ʽ   
% [y1,y2] = bmgauss(m,sigma,N) ���������Ϊm������Ϊsigma��������˹�������
% [y1,y2] = bmgauss(m,sigma)���������Ϊm������Ϊsigma��������˹�����
% [y1,y2] = bmgauss(sigma): �������Ϊ0������Ϊsigma��������˹�����
% [y1,y2] = bmgauss���������Ϊ0������Ϊ1��������˹�����
if nargin == 0,
  m=0; sigma=1;N=1;
elseif nargin == 1,
  sigma=m; m=0;N=1;
elseif nargin ==2,
    N=1;
end;
u1 = rand(1,N);
u2 =rand(1,N);
r = sigma*sqrt(-2*log(u1)); % �����ֲ�
y1 = m+r.*cos(2*pi*u2);
y2 = m+r.*sin(2*pi*u2);