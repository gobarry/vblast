% m����������
% n����������
% L������

function [bitstr,dete,ber]=main(L,m,n,maxSNR,minSNR,SNRstep)
bitstr=produce_bitstr(L);
x=BPSKmod(bitstr);
x=reshape(x,m,L/m);     % ����,ÿ�鳤��L/m
snr=minSNR:SNRstep:maxSNR;   % �����
I=length(snr);
va=zeros(I,1);
dete=zeros(m,L/m);      % ����ź�
ber=zeros(I,1);
for i=1:I
    H=(randn(n,m)+1i*randn(n,m))/sqrt(2);
    va(i)=1/(2*10^(snr(i)/10));
    for j=1:L/m
        noise=sqrt(va(i))*(randn(n,1)+1i*randn(n,1));
        y=H*x(1:end,j)+noise;
        dete(1:end,j)=vblast(y,H);
    end
    d=reshape(dete,1,L);
    ber(i)=sum(abs(d~=bitstr))/L;
end
plot(snr,ber);
xlabel('SNR/dB');
ylabel('BER');
title('BPSK����,(4,4)MIMOϵͳ��ZF-VBLAST����㷨��������������ȹ�ϵ');
    