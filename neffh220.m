clear all;
close all;
clc;
%%
width = 4.5;     % Width in inches
height = 3;    % Height in inches
alw = 0.75;      % AxesLineWidth
fsz = 20;        % Fontsize
lw = 1.5;        % LineWidth
msz = 8;         % MarkerSize
fname='Calibri';
%color properties 
c = get(0, 'DefaultAxesColorOrder');
%%
network=load('NN64NL464v1tansig.mat');
N=101;
lam=linspace(1400,1600,N);
hght=linspace(200,400,N);
w0=[400:10:1400];
N1=length(w0);
% out_te=zeros(26,26);
% out_tm=zeros(26,26);

%%
%network results
for k=1:N1
    input=load(['.\data\nnresults\input-height220width',num2str(w0(k))]);
    input=input.data';
    out=network.net(input);
    
    out_te(k,:)=out(1,:);
    out_tm(k,:)=out(2,:);
    
%     figure(1);
%     plot(lam,out(1,:))
%     hold on;
    
end
%%
fig1=figure(1);
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw,'Fontname',fname); %<- Set properties
ax.ColorOrderIndex = 1;
h = subplot(1,1,1);
%%
imagesc(lam,w0,out_te);
axis square;
% shading interp;
set(gca,'YDir','normal')
colormap('jet');
caxis([2.1,3])
colorbar;
cb = colorbar;
ylabel(cb,'{\it n}_{eff}');
set(cb,'Fontname',fname);
set(cb,'fontsize',fsz);
set(cb,'Ticks',[2.2:0.4:3]);
set(gca,'TickLength',[.04 .04]);
set(gca,'fontsize',fsz,...
        'Xlim',[lam(1) lam(end)],...
        'xtick',[lam(1):100:lam(end)],...
        'Ylim',[w0(1) w0(end)],...
        'ytick',[w0(1):500:w0(end)]);
ylabel("{\it w} (nm)");
xlabel(" {\lambda} (nm)");
colorbar off;
% pos=[400.0001 0.243 1];
% set(x,'position',pos);
% resize plot
pos_sub=get(h,'position');

plot_offx1=0.24;
plot_offy2=0.28;
plot_fx=0.4444;
plot_fy=0.6668;

pos_sub(1)=plot_offx1;
pos_sub(2)=plot_offy2;
pos_sub(3)=plot_fx;
pos_sub(4)=plot_fy;
set(h,'position',pos_sub);
%%
set(gcf,'InvertHardcopy','on');
set(gcf,'PaperUnits', 'inches');
papersize = get(gcf, 'PaperSize');
left = (papersize(1)- width)/2;
bottom = (papersize(2)- height)/2;
myfiguresize = [left, bottom, width, height];
set(gcf,'PaperPosition', myfiguresize);
%%
fig2=figure(2);
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw,'Fontname',fname); %<- Set properties
ax.ColorOrderIndex = 1;
h = subplot(1,1,1);
%%
imagesc(lam,w0,out_tm);
axis square;
% shading interp;
set(gca,'YDir','normal')
colormap('jet');
caxis([1.5,2.8])
colorbar;
cb = colorbar;
ylabel(cb,'{\it n}_{eff}');
set(cb,'Fontname',fname);
set(cb,'fontsize',fsz);
set(cb,'Ticks',[1.6:0.4:2.8]);
set(gca,'TickLength',[.04 .04]);
set(gca,'fontsize',fsz,...
        'Xlim',[lam(1) lam(end)],...
        'xtick',[lam(1):100:lam(end)],...
        'Ylim',[w0(1) w0(end)],...
        'ytick',[w0(1):500:w0(end)]);
ylabel("{\it w} (nm)");
xlabel(" {\lambda} (nm)");
colorbar off;
% pos=[400.0001 0.243 1];
% set(x,'position',pos);
% resize plot
pos_sub=get(h,'position');

plot_offx1=0.24;
plot_offy2=0.28;
plot_fx=0.4444;
plot_fy=0.6668;

pos_sub(1)=plot_offx1;
pos_sub(2)=plot_offy2;
pos_sub(3)=plot_fx;
pos_sub(4)=plot_fy;
set(h,'position',pos_sub);
%%
set(gcf,'InvertHardcopy','on');
set(gcf,'PaperUnits', 'inches');
papersize = get(gcf, 'PaperSize');
left = (papersize(1)- width)/2;
bottom = (papersize(2)- height)/2;
myfiguresize = [left, bottom, width, height];
set(gcf,'PaperPosition', myfiguresize);
%%
for k=1:N1

    data=load(['.\data\simulation2\neff-strip-lam1400-1600(101))width',num2str(w0(k)),'width220']);
    sim_te(k,:)=data.neff_te(:,1);
    sim_tm(k,:)=data.neff_tm(:,1);
    
%     figure(3);
%     plot(lam,sim_te(k,:))
%     hold on;
end
%%
fig3=figure(3);
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw,'Fontname',fname); %<- Set properties
ax.ColorOrderIndex = 1;
h = subplot(1,1,1);
%%
imagesc(lam,w0,sim_te);
axis square;
% shading interp;
set(gca,'YDir','normal')
colormap('jet');
caxis([2.1,3])
colorbar;
cb = colorbar;
ylabel(cb,'{\it n}_{eff}');
set(cb,'Fontname',fname);
set(cb,'fontsize',fsz);
set(cb,'Ticks',[2.2:0.4:3]);
set(gca,'TickLength',[.04 .04]);
set(gca,'fontsize',fsz,...
        'Xlim',[lam(1) lam(end)],...
        'xtick',[lam(1):100:lam(end)],...
        'Ylim',[w0(1) w0(end)],...
        'ytick',[w0(1):500:w0(end)]);     
ylabel("{\it w} (nm)");
xlabel(" {\lambda} (nm)");
colorbar off;
% pos=[400.0001 0.243 1];
% set(x,'position',pos);
% resize plot
pos_sub=get(h,'position');

plot_offx1=0.24;
plot_offy2=0.28;
plot_fx=0.4444;
plot_fy=0.6668;

pos_sub(1)=plot_offx1;
pos_sub(2)=plot_offy2;
pos_sub(3)=plot_fx;
pos_sub(4)=plot_fy;
set(h,'position',pos_sub);
%%
set(gcf,'InvertHardcopy','on');
set(gcf,'PaperUnits', 'inches');
papersize = get(gcf, 'PaperSize');
left = (papersize(1)- width)/2;
bottom = (papersize(2)- height)/2;
myfiguresize = [left, bottom, width, height];
set(gcf,'PaperPosition', myfiguresize);

%%
fig4=figure(4);
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw,'Fontname',fname); %<- Set properties
ax.ColorOrderIndex = 1;
h = subplot(1,1,1);
%%
imagesc(lam,w0,sim_tm);
axis square;
shading interp;
set(gca,'YDir','normal')
colormap('jet');
caxis([1.5,2.8])
colorbar;
cb = colorbar;
ylabel(cb,'{\it n}_{eff}');
set(cb,'Fontname',fname);
set(cb,'fontsize',fsz);
set(cb,'Ticks',[1.6:0.4:2.8]);
set(gca,'TickLength',[.04 .04]);
set(gca,'fontsize',fsz,...
        'Xlim',[lam(1) lam(end)],...
        'xtick',[lam(1):100:lam(end)],...
        'Ylim',[w0(1) w0(end)],...
        'ytick',[w0(1):500:w0(end)]);     
ylabel("{\it w} (nm)");
xlabel(" {\lambda} (nm)");
colorbar off;
% pos=[400.0001 0.243 1];
% set(x,'position',pos);
% resize plot
pos_sub=get(h,'position');

plot_offx1=0.24;
plot_offy2=0.28;
plot_fx=0.4444;
plot_fy=0.6668;

pos_sub(1)=plot_offx1;
pos_sub(2)=plot_offy2;
pos_sub(3)=plot_fx;
pos_sub(4)=plot_fy;
set(h,'position',pos_sub);
%%
set(gcf,'InvertHardcopy','on');
set(gcf,'PaperUnits', 'inches');
papersize = get(gcf, 'PaperSize');
left = (papersize(1)- width)/2;
bottom = (papersize(2)- height)/2;
myfiguresize = [left, bottom, width, height];
set(gcf,'PaperPosition', myfiguresize);
%%
print(fig1,['.\figure\h220NN64TE'],'-dmeta','-r300');
print(fig2,['.\figure\h220NN64TM'],'-dmeta','-r300');
print(fig3,['.\figure\h220N64SimuTE'],'-dmeta','-r300');
print(fig4,['.\figure\h220N64SimuTM'],'-dmeta','-r300');



