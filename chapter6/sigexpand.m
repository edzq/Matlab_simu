function [out]=sigexpand(d,M)
%��������������ɼ��ΪN-1��0������
N=length(d);
out=zeros(M,N);
out(1,:)=d;
out=reshape(out,1,M*N);