len = 10000; % ���������
M = 16; %16���Ƶ���
msg = randint(len,1,M); %ԭʼ�ź�

% �ֱ�ʹ��PSK��PAM���ַ�ʽ����ԭʼ�ź�
txpsk = pskmod(msg,M);
txpam = pammod(msg,M);

%��ԭʼ�ź�����ͼ
scatterplot(txpsk);title('PSK Scatter Plot')
scatterplot(txpam); title('PAM Scatter Plot')

% ���ѵ��źż�����λ����
phasenoise = randn(len,1)*.015;
rxpsk = txpsk.*exp(j*2*pi*phasenoise);
rxpam = txpam.*exp(j*2*pi*phasenoise);

%���������źţ��ܸ��ŵģ�����ͼ
scatterplot(rxpsk); title('Noisy PSK Scatter Plot')
scatterplot(rxpam); title('Noisy PAM Scatter Plot')

% ��������ź�
recovpsk = pskdemod(rxpsk,M);
recovpam = pamdemod(rxpam,M);

% �ֱ�������ֵ��Ʒ�ʽ�µ��������
numerrs_psk = symerr(msg,recovpsk)
numerrs_pam = symerr(msg,recovpam)
