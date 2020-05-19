% V-BLAST ���
% ����: R �����źţ�n*1��
%       H ת�ƾ��� (n*m)
% �����a ����źţ�m*1)

function [a] = vblast(y,H)
[n,m]=size(H);
a=zeros(m,1);
k_list=1:m;
r=y;
h=H;
G=pinv(H);
k=minnorm(G,k_list);
for i=1:m
    w=G(k,:);
    z=w*r;
    a(k)=BPSKdemod(z);
    r=r-BPSKmod(a(k)).*h(:,k);
    h(1:end,k)=zeros(n,1);
    G=pinv(h);
    k_list(find(k_list==k))=[];
    k=minnorm(G,k_list);
end





