function [pb,ps]=snr2p(snr_in_dB)
% [pb,ps]=snr2p(snr_in_dB)
%�����dBΪ��λ�ĸ�������ȵı��������ʺͷ���������
N=10000; %������
Es=1;				  	
snr=10^(snr_in_dB/10);	 	  	%��������ȵ���ֵ
sgma=sqrt(Es/(4*snr));	  	  	%��������������
% �ź�ӳ��
s00=[1 0];
s01=[0 1];
s11=[-1 0];
s10=[0 -1];
%�����ź�Դ
for i=1:N,	
  temp=rand;			  	%����һ����0��1��֮��ľ����������
  if (temp<0.25),		  	%��Դ���"00"�ĸ���Ϊ1/4 
    dsource1(i)=0;
    dsource2(i)=0;		   
  elseif (temp<0.5),		  	%��Դ���"01"�ĸ���Ϊ1/4
    dsource1(i)=0;
    dsource2(i)=1;
  elseif (temp<0.75),	 	  	%��Դ���"10"�ĸ���Ϊ1/4
    dsource1(i)=1;	
    dsource2(i)=0;
  else			          	%��Դ���"11"�ĸ���Ϊ1/4
    dsource1(i)=1;
    dsource2(i)=1;
  end;
end;
%�о��������ʼ���
numofsymbolerror=0;
numofbiterror=0;
for i=1:N,
  %���о����Ľ��ն˵��źţ����ڵ�i������Ϊ��
  n(1)=bmgauss(sgma);	  	  
  n(2)=bmgauss(sgma);
  if ((dsource1(i)==0) & (dsource2(i)==0)),
    r=s00+n;                                                        %����00�������Ӧ�����ź�
  elseif ((dsource1(i)==0) & (dsource2(i)==1)),
    r=s01+n;                                                        %����01�������Ӧ�����ź�
  elseif ((dsource1(i)==1) & (dsource2(i)==0)),
    r=s10+n;                                                         %����10�������Ӧ�����ź�
  else
    r=s11+n;                                                          %����11�������Ӧ�����ź�
  end;
  % ����Ϊ���㻥�������
  c00=dot(r,s00);
  c01=dot(r,s01);
  c10=dot(r,s10);
  c11=dot(r,s11);
  % ��i�����ŵ��о����½���
  c_max=max([c00 c01 c10 c11]);
  if (c00==c_max),
    decis1=0; decis2=0;
  elseif (c01==c_max),
    decis1=0; decis2=1;
  elseif (c10==c_max),
    decis1=1; decis2=0;
  else
    decis1=1; decis2=1;
  end;
  %���о��������ȷ�������������1
  symbolerror=0;
  if (decis1~=dsource1(i)),
    numofbiterror=numofbiterror+1;
    symbolerror=1;
  end;
  if (decis2~=dsource2(i)),
    numofbiterror=numofbiterror+1;
    symbolerror=1;
  end;
  if (symbolerror==1),
    numofsymbolerror = numofsymbolerror+1;
  end;
end;
ps=numofsymbolerror/N;	          	% �ܹ�����N������
pb=numofbiterror/(2*N);    	  	%�ܹ�����2N������
