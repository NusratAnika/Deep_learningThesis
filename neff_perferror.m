clear all;
close all;
clc;
%%
width = 3.5;     % Width in inches
height = 2.8;    % Height in inches
alw = 0.75;      % AxesLineWidth
fsz = 16;        % Fontsize
lw = 1.5;        % LineWidth
msz = 8;         % MarkerSize
fname='Calibri';
%color properties 
c = get(0, 'DefaultAxesColorOrder');
%%
network=load('NN216NL464v1tansig.mat');
N=26;
lam=linspace(1400,1600,N);
hght=linspace(200,400,N);
w0=linspace(400,1400,N);
% out_te=zeros(26,26
% out_tm=zeros(26,26);

%%
%network results
for k=1:N
    input=load(['.\data\nnresults\input-lam',num2str(lam(k)),'height',num2str(hght(k))]);
    input=input.data';
    out=network.net(input);
    
    out_te(k,:)=out(1,k);
    out_tm(k,:)=out(2,k);
    
    data=load(['.\data\simulation\neff-strip-width400-1400(26))height',num2str(hght(k)),'wavlength',num2str(lam(k))]);
    sim_te(k,:)=data.neff_te(k,1);
    sim_tm(k,:)=data.neff_tm(k,1);
    
    perf_errorTE(k,:)=-log10(immse(sim_te(k,:),out_te(k,:)));
    perf_errorTM(k,:)=-log10(immse(sim_tm(k,:),out_tm(k,:)));
    
end
errorTE=mean(perf_errorTE)
errorTM=mean(perf_errorTM)
%  figure(1);
%  plot(lam,perf_errorTE)
%  hold on;
%%
% figure(4);
% imagesc(lam,hght,sim_tm);
% axis square;
% % shading interp;
% set(gca,'YDir','normal')
% cb = colorbar;
% colormap('hot');
% caxis([2,3.2])


