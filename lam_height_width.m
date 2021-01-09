clear all;
close all;
clc;

%%
N=26;
lam=linspace(1400,1600,N);
height=linspace(200,400,N);
width=linspace(400,1400,N);

for k=1:N
    for kk=1:N
        for kkk=1:N
    
            data(kkk,:)=[lam(k),height(kk),width(kkk)];
            save(['input-lam',num2str(lam(k)),'height',num2str(height(kk))],'data')
            
        end
        
    end
    
end