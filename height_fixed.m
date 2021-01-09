clear all;
close all;
clc;

%%
N=101;
lam=linspace(1400,1600,N);
height=220;
width=linspace(400,1400,N);

for k=1
    for kk=1:N
        for kkk=1:N
    
            data(kkk,:)=[lam(kkk),height(k),width(kk)];
            save(['input-height',num2str(height(k)),'width',num2str(width(kk))],'data')
            
        end
        
    end
    
end