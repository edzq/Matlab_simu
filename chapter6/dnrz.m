function y=snrz(x)
%������ʵ�ֽ������һ�ζ����ƴ����Ϊ��Ӧ��˫���Էǹ��������
%����xΪ�������룬���yΪ��õ���

t0=300;
t=0:1/t0:length(x);
for i=1:length(x),
    if(x(i)==1),
        for j=1:t0,
            y((i-1)*t0+j)=1;
        end
    else
        for j=1:t0,
            y((i-1)*t0+j)=-1;
        end
    end;
end
y=[y,x(i)];
M=max(y);
m=min(y);
subplot(211)
plot(t,y);grid on;
axis([0,i,m-0.1,M+0.1]);
