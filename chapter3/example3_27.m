sales=[30 40 55 79 62 81];
x=2001:2006;
profits=[15.5 23.2 28.6 36.9 27.0 42.5];
area(x,sales,'facecolor',[0.5 0.9 0.6],'edgecolor',...
'b','linewidth',2)                    	%�������ɫ���߽�ɫ�ͱ߽���
hold on
area(x,profits,'facecolor',[0.9 0.8 0.7],'edgecolor','r','linewidth',2)
hold off
set(gca,'xtick',[2001:2006])         	%x��Ϊ2001��2006
xlabel('���','fontsize',10)          	%x���ע�ֺ�Ϊ10��
ylabel('��Ԫ','fontsize',10)
gtext('�ɱ�')                            	%ͨ�������ͼ�������ע��
gtext('����')
gtext('\rightarrow���۶�')
