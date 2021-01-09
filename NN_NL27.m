clear all;
close all;
clc;
%%
width = 4;     % Width in inches
height = 2.8;    % Height in inches
alw = 0.75;      % AxesLineWidth
fsz = 11;        % Fontsize
lw = 1.5;        % LineWidth
msz = 8;         % MarkerSize
fname='Calibri';
%color properties 
c = get(0, 'DefaultAxesColorOrder');
%%
input=xlsread('./data/input');
input=input';
lam=linspace(1400,1600,3);
h0=linspace(200,400,3);
w0=linspace(400,1400,3);

for k=1:length(lam)
    for m=1:length(h0)
        
        data{k,m}=load(['.\data\neff-strip-width400-1400(3))height',num2str(h0(m)),'wavlength',num2str(lam(k))]);
        
    end
end

for k=1:3
   index_te(3*k-2:3*k)=data{1,k}.neff_te(:,1);
   index_tm(3*k-2:3*k)=data{1,k}.neff_tm(:,1); 
end

for k=1:3
   index_te2(3*k-2:3*k)=data{2,k}.neff_te(:,1);
   index_tm2(3*k-2:3*k)=data{2,k}.neff_tm(:,1); 
end
for k=1:3
   index_te3(3*k-2:3*k)=data{3,k}.neff_te(:,1);
   index_tm3(3*k-2:3*k)=data{3,k}.neff_tm(:,1); 
end

te=[index_te,index_te2,index_te3];
tm=[index_tm,index_tm2,index_tm3];
target=[te;tm];

%%
fig1=figure;
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw,'Fontname',fname); %<- Set properties
ax.ColorOrderIndex = 1;
% h = subplot(1,1,1); 

markerSize = 50;
z=input(1,:)';
x=input(2,:)';
y=input(3,:)';
scatter3(x,y,z, markerSize,te,'filled') 
cb=colorbar;
cbylabel=ylabel(cb,'{\it n}_{eff}');
set(cbylabel,'fontsize',fsz*1.2);
colormap('jet');
caxis([2 3.2]);
set(cb,'Ticks',[2 2.3 2.6 2.9 3.2]);
% pos=[0.8995 0.1382 0.0381 0.7868];
% set(cb,'position',pos);
set(gca,'TickLength',[.08 .08]);
set(gca,'fontsize',fsz,...
        'Xlim',[x(1) x(end)],...
        'xtick',[x(1):100:x(end)],...
        'Ylim',[y(1) y(end)],...
        'ytick',[y(1):500:y(end)],...
        'zlim',[z(1) z(end)],...
        'ztick',[z(1):100:z(end)]);
% ax=gca;
% grid on;
% ax.XColor='r';
% ax.YColor='b';

zlabel("{\lambda} (nm)");
xlabel("{\it h} (nm)");
ylabel("{\it w} (nm)");


set(gcf,'InvertHardcopy','on');
set(gcf,'PaperUnits', 'inches');
papersize = get(gcf, 'PaperSize');
left = (papersize(1)- width)/2;
bottom = (papersize(2)- height)/2;
myfiguresize = [left, bottom, width, height];
set(gcf,'PaperPosition', myfiguresize);
%%
print(fig1,['.\figure\NN27'],'-dmeta','-r300');
print(fig1,['.\figure\NN27'],'-dpng','-r300');
