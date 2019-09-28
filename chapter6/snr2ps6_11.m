function [p]= snr2ps6_11 (snr_in_dB)
% [p]= snr2ps6_11 (snr_in_dB)
%��������ȸ���ʱ�Ĳ�����
% snr_in_dB����   �ź������ȣ�dB��
E=1;
SNR=exp(snr_in_dB*log(10)/10);	   	% �ź�������
sgma=E/sqrt(2*SNR);		                %����������׼��
N=10000;                                                             %�������ݱ�����

%��������������Դ
for i=1:N,                                                                
  temp=rand;   	      			% ����һ����0,1���ڵľ�����
  if (temp<0.5),
    dsource(i)=0;   	      %���������������ڣ�0,0.5�����ڣ�������Դ���������0
  else
    dsource(i)=1;	      	      %��֮��������Դ���������1
  end
end;

% ��⡢���������
numoferr=0;
for i=1:N,
  % matched filter outputs
  if (dsource(i)==0),
    r0=E+bmgauss(sgma);
    r1=bmgauss(sgma);	      		% ���������Դ������� "0"
  else
    r0=bmgauss(sgma);
    r1=E+bmgauss(sgma);     		% ���������Դ������� "1"
  end;
  % Detector follows.
  if (r0>r1),
    decis=0;		      		% �о�Ϊ "0".
  else
    decis=1;		      		% �о�Ϊ "1".
  end;
  if (decis~=dsource(i)),    	%����о���������ڶ�����Դ������������������1
    numoferr=numoferr+1;
  end;
end;
p=numoferr/N;	  	      		%��������
