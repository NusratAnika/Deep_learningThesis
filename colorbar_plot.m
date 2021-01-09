clear all;
close all;
clc;
%%
width = 2;     % Width in inches
height = 4;    % Height in inches
alw = 0.75;    % AxesLineWidth
fsz = 20;      % Fontsize
lw = 1.5;      % LineWidth
msz = 8;       % MarkerSize
cobr=jet;

%% plottig the figure
fig1=figure;
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
h = subplot(1,1,1); 

cb=colorbar;
xlim([0 250])
caxis([1.5,3.2]);
set(cb,'Ticks',[1.5 2 2.5 3]);
set(cb,'Fontsize',fsz);
colormap(cobr);
axis off
%==========resize plot
pos_sub=get(h,'position');
plot_offx1=-0.25;
plot_offy2=0.1;
plot_fx=0.754;
plot_fy=0.85;

pos_sub(1)=plot_offx1;
pos_sub(2)=plot_offy2;
pos_sub(3)=plot_fx;
pos_sub(4)=plot_fy;
set(h,'position',pos_sub);
%========resizing again
set(gcf,'InvertHardcopy','on');    
set(gcf,'PaperUnits', 'inches');
papersize = get(gcf, 'PaperSize');
left = (papersize(1)- width)/2;
bottom = (papersize(2)- height)/2;
myfiguresize = [left, bottom, width, height];
set(gcf,'PaperPosition', myfiguresize);
% 
%% save result
print(fig1,['.\figure\colorbar'],'-dmeta','-r300');
print(fig1,['.\figure\colorbar'],'-djpeg','-r300');




