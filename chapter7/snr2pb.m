function [p]=snr2pb(snr_in_dB)
% [p]= snr2pb (snr_in_dB)
%�������Ĺ�������֪����ȣ����������ʽ��		
N=10000;
Eb=1;
d=1;				  
snr=10^(snr_in_dB/10);	 	  	%�����
sgma=sqrt(Eb/(2*snr));	  	  	%��������������
phi=0;                                                                  %�����ŵ����Ʀ�=0
%������������
for i=1:N,	
  temp=rand;			  	%����0~1֮��ľ����������
  if (temp<0.5),
    dsource(i)=0;
  else
    dsource(i)=1;
  end;
end;
% ��Ⲣ����������
numoferr=0;
for i=1:N,
  %��������
  if (dsource(i)==0),
    r0c=sqrt(Eb)*cos(phi)+bmgauss(sgma);
    r0s=sqrt(Eb)*sin(phi)+bmgauss(sgma);
    r1c=bmgauss(sgma);
    r1s=bmgauss(sgma);
  else
    r0c=bmgauss(sgma);
    r0s=bmgauss(sgma);
    r1c=sqrt(Eb)*cos(phi)+bmgauss(sgma);
    r1s=sqrt(Eb)*sin(phi)+bmgauss(sgma);
  end;
  %ƽ���ɼ�����
  r0=r0c^2+r0s^2;
  r1=r1c^2+r1s^2;
  % �о�
  if (r0>r1),
    decis=0;
  else
    decis=1;
  end;
  %������������ȷ�������������1.
  if (decis~=dsource(i)),
    numoferr=numoferr+1;
  end;
end;
p=numoferr/(N);		  
