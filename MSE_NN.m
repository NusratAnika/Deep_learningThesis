clear all;
close all;
clc;
%%
width = 5;       % Width in inches
height = 6;      % Height in inches
alw = 1;         % AxesLineWidth
fsz = 16;        % Fontsize
lw = 1.8;        % LineWidth
msz = 8;         % MarkerSize
fname='Calibri'; %font name 
c = get(0, 'DefaultAxesColorOrder');
%color properties s
%%

N=51;
lam=ones(1,51)*1350;
hght=linspace(200,400,N);
w0=linspace(400,1400,N);
N1=[4];


%%
%network results
for k=1:length(N1)
%NN
network=load(['./data/NN',num2str(N1(k)^3),'NL464tansig.mat']);
input=[lam;hght;w0];
out=network.net(input);
out_te=out(1,:)';
out_tm=out(2,:)';

%Simulation data
data=load(['.\data\neff101']);
sim_te=data.neff_te(:,1);
sim_tm=data.neff_tm(:,1);
sim_te=sim_te(1:2:end);
sim_tm=sim_tm(1:2:end);


perf_errorTE(k)=(immse(sim_te,out_te))
perf_errorTM(k)=(immse(sim_tm,out_tm))

end

%%
% fig1=figure;
% pos = get(gcf, 'Position');
% set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
% set(gca, 'FontSize', fsz, 'LineWidth', alw,'Fontname',fname); %<- Set properties
% ax.ColorOrderIndex = 1;
% h = subplot(1,1,1); 
% 
% p1=semilogy(N1,perf_errorTE,'.-','markersize',40,'linewidth',lw); hold on;
% % p2=plot(N1,perf_errorTM,'.--','markersize',25,'linewidth',lw); hold on;
% 
% p3=semilogy(N1,err_linTE,'.-','markersize',40,'linewidth',lw); hold on;
% % p4=plot(N1,err_linTM,'.--','markersize',25,'linewidth',lw); hold on;
% 
% p5=semilogy(N1,err_cubicTE,'.-','markersize',40,'linewidth',lw); hold on;
% % p6=plot(N1,err_cubicTM,'.--','markersize',25,'linewidth',lw); hold on;
% 
% p7=semilogy(N1,err_polyTE,'.-','markersize',40,'linewidth',lw); hold on;
% % p8=plot(N1,err_polyTM,'.--','markersize',25,'linewidth',lw); hold on;
% 
% set(p1,{'color'},{c(1,:)})
% % set(p2,{'color'},{c(1,:)})
% set(p3,{'color'},{c(2,:)})
% % set(p4,{'color'},{c(2,:)})
% 
% set(p5,{'color'},{c(3,:)})
% % set(p6,{'color'},{c(3,:)})
% set(p7,{'color'},{c(4,:)})
% % set(p8,{'color'},{c(4,:)})
% 
% set(gca,'fontsize',fsz,...
%         'Xlim',[N1(1) N1(end)],...
%         'xtick',[N1(1):1:N1(end)],...
%         'Ylim',[10^-6 10^-0],...
%         'ytick',[10^-6,10^-4,10^-2,10^-0],...
%         'xticklabel',{'2\times 2\times 2','3\times 3\times 3','4\times 4\times 4','5\times 5\times 5','6\times 6\times 6'});        
% xtickangle(45)
% xlabel('{\it N}_L');
% ylabel('MSE')
% set(gca,'TickLength',[.03 .03]);
% 
% pos=[0.65 0.63 0.1300 0.2100];
% leg=legend('Layout = 4\times6\times4','Linear','Cubic-spline','2 deg. Polynomial','position',pos);
% % set(leg,'fontsize',20);
% legend boxoff
% %------resize plot
% pos_sub=get(h,'position');
% plot_offx1=0.165;
% plot_offy2=0.21;
% plot_fx=0.78;
% plot_fy=0.65;
% 
% pos_sub(1)=plot_offx1;
% pos_sub(2)=plot_offy2;
% pos_sub(3)=plot_fx;
% pos_sub(4)=plot_fy;
% set(h,'position',pos_sub);
% %------resizing again
% set(gcf,'InvertHardcopy','on');    
% set(gcf,'PaperUnits', 'inches');
% papersize = get(gcf, 'PaperSize');
% left = (papersize(1)- width)/2;
% bottom = (papersize(2)- height)/2;
% myfiguresize = [left, bottom, width, height];
% set(gcf,'PaperPosition', myfiguresize);
% 
% % %------save
% print(fig1,['.\figure\compare-fit'],'-dmeta','-r300');
% print(fig1,['.\figure\compare-fit'],'-dpdf','-r300');

