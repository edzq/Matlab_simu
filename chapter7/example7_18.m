snr=10;      %����ȣ���λΪdB 
fftl=128;    %FFT�ĳ���
N=6;         %һ��֡�ṹ��OFDM�źŵĸ���
para=128;    %���д�������ز�����
gsl=32;      %����ʱ϶�ĳ���
%**************OFDM�źŵĲ���***************
signal=rand(1,para*N*2)>0.5;
%����0��1������У����Ÿ���Ϊpara*N*2�����ŵ���*����ˮƽ*ÿ�����ŵ��з�������
for i=1:para
    for j=1:N*2
    sigpara(i,j)=signal(i*j);
%�����任������������Ķ����ƾ���任Ϊ����Ϊpara������ΪN*2�ľ���
end
end
%*******���½���QPSK���ƣ������ݷ�ΪI��Q��·********
for j=1:N;
    ich(:,j)=sigpara(:,2*j-1);
    qch(:,j)=sigpara(:,2*j);
end
kmod=1./sqrt(2);
ich1=ich.*kmod;
qch1=qch.*kmod;
x=ich1+qch1.*sqrt(-1);     %�������ź�
y=ifft(x);                 %����Ҷ���任��Ƶ���ź�ת��Ϊʱ���ź�
ich2=real(y);              %I�ŵ�ȡʱ���źŵ�ʵ��
qch2=imag(y);              %Q�ŵ�ȡʱ���źŵ��鲿
%**********���²��뱣��ʱ϶**********
ich3=[ich2(fftl-gsl+1:fftl,:);ich2];
qch3=[qch2(fftl-gsl+1:fftl,:);qch2];
%**********���½��в����任**********
ich4=reshape(ich3,1,(fftl+gsl)*N);
qch4=reshape(qch3,1,(fftl+gsl)*N);
%����Ϊϵͳ���Ͷ��γɵ��ź�
Tdata=ich4+qch4.*sqrt(-1);
%**********����Ϊϵͳ���ն˽��н���Ĺ���**********
Rdata=awgn(Tdata,snr,'measured');   %�Խ��յ����źż����˹������
%**********����Ϊ���ն���ȥ����ʱ϶**********
idata=real(Rdata);
qdata=imag(Rdata);
idata1=reshape(idata,fftl+gsl,N);
qdata1=reshape(qdata,fftl+gsl,N);
idata2=idata1(gsl+1:gsl+fftl,:);
qdata2=qdata1(gsl+1:gsl+fftl,:);
%**********����Ϊϵͳ���ն˽��и���Ҷ�任**********
Rx=idata2+qdata2+sqrt(-1);
ry=fft(Rx);
Rich=real(ry);
Rqch=imag(ry);
Rich=Rich/kmod;
Rqch=Rqch/kmod;
%**********����Ϊ���ն˽���QPSK���**********
for j=1:N;
    Rpara(:,2*j-1)=Rich(:,j);
    Rpara(:,2*j)=Rqch(:,j);
end
Rsig=reshape(Rpara,1,para*N*2);
Rsig=Rsig>0.5;   %�����о�
figure(1)
subplot(2,1,1)
stem(Rsig(1:20))
grid;
subplot(2,1,2)
stem(signal(1:20))
grid;	 
