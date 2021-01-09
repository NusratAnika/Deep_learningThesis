clear all;
close all;
clc;
%%
width = 5;       % Width in inches
height = 5.5;      % Height in inches
alw = 1;         % AxesLineWidth
fsz = 16;        % Fontsize
lw = 1.8;        % LineWidth
msz = 8;         % MarkerSize
fname='Calibri'; %font name 
c = get(0, 'DefaultAxesColorOrder');
%color properties s
%%
data=load('.\data\perrorActfun.txt');

TE=data(:,1);
TM=data(:,2);

err=[TE,TM];
x=[1,2,3,4,5];
%%
fig1=figure;
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw,'Fontname',fname); %<- Set properties
h=subplot(1,1,1);

X = categorical({'tansig','linear','radbas','logsig','relu'});
X = reordercats(X,{'tansig','linear','radbas','logsig','relu'});
% b=bar(err,'Barwidth',1);
xd=(x(2)-x(1))/2;
bar(x-xd/3,err(:,1), 'barwidth', .5);
hold on
hb=bar(x+xd/3,err(:,2), 'barwidth', .5);

% set(b(1),'FaceColor','red');
% set(b(2),'FaceColor','blue');

% xtips1 = b(1).XEndPoints;
% ytips1 = b(1).YEndPoints;
% labels1 = string(b(1).YData);
% text(xtips1,ytips1,labels1,'HorizontalAlignment','center',...
%     'VerticalAlignment','bottom')
% xtips2 = b(2).XEndPoints;
% ytips2 = b(2).YEndPoints;
% labels2 = string(b(2).YData);
% text(xtips2,ytips2,labels2,'HorizontalAlignment','center',...
%     'VerticalAlignment','bottom')
% box off;
set(gca,'fontsize',fsz,...
        'Xlim',[0 6],...
        'xtick',[1:1:5],...
        'Ylim',[0 6],...
        'ytick',[0:2:6],...
        'xticklabel',[]);            
xtickangle(45)
leg=legend('TE','TM','location','Northeast');
leg.ItemTokenSize = [50,50];
legend boxoff
set(gca,'xticklabel',[])
ylabel('-log_{10}(MSE)')

%% plot resize 
pos_sub=get(h,'position');

plot_offx1=0.13;
plot_offy2=0.13;
plot_fx=0.85;
plot_fy=0.8284;


pos_sub(1)=plot_offx1;
pos_sub(2)=plot_offy2;
pos_sub(3)=plot_fx;
pos_sub(4)=plot_fy;
% 
set(h,'position',pos_sub);
% % ----------------------------------------------
% Here we preserve the size of the image when we save it.
set(gcf,'InvertHardcopy','on');    
set(gcf,'PaperUnits', 'inches');
papersize = get(gcf, 'PaperSize');
left = (papersize(1)- width)/2;
bottom = (papersize(2)- height)/2;
myfiguresize = [left, bottom, width, height];
set(gcf,'PaperPosition', myfiguresize);

% %------save
print(fig1,['.\figure\Activaton_function'],'-dmeta','-r300');
% print(fig1,['.\figure\Activaton_function'],'-dpdf','-r300');
% 



