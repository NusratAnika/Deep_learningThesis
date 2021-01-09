clear all;
close all;
clc;
%%
width = 5;       % Width in inches
height = 5.4;      % Height in inches
alw = 1;         % AxesLineWidth
fsz = 16;        % Fontsize
lw = 1.8;        % LineWidth
msz = 8;         % MarkerSize
fname='Calibri'; %font name 
c = get(0, 'DefaultAxesColorOrder');
%color properties s
%%

N=101;
lam=linspace(1400,1600,N);
hght=linspace(200,400,N);
w0=linspace(400,1400,N);
N1=[2 3 4 5 6];


%%
%network results
for k=1:length(N1)
inpt=linspace(400,1400,N1(k));
%NN
network=load(['./data/NN',num2str(N1(k)^3),'NL464tansig.mat']);
input=[lam;hght;w0];
out=network.net(input);
out_te=out(1,:)';
out_tm=out(2,:)';

%load simulation data for interpolation
data_interp=load(['.\data\neff',num2str(N1(k))]);
outputTE=data_interp.neff_te(:,1)';
outputTM=data_interp.neff_tm(:,1)';

%linear interpolation 
xlin=linspace(400,1400,101);
ylin_te = interp1(inpt,outputTE,xlin);
ylin_tm = interp1(inpt,outputTM,xlin);

%cubic interpolation 
xcubic=linspace(400,1400,101);
ycubic_te = spline(inpt,outputTE,xcubic);
ycubic_tm = spline(inpt,outputTM,xcubic);

%polynomial interpolation 
deg=2;
pTE = polyfit(inpt,outputTE,deg);
pTM = polyfit(inpt,outputTM,deg);
xpoly=linspace(400,1400,101);
ypoly_te = polyval(pTE,xpoly);
ypoly_tm = polyval(pTM,xpoly);


%Simulation data
data=load(['.\data\neff101']);
sim_te=data.neff_te(:,1);
sim_tm=data.neff_tm(:,1);


perf_errorTE(k)=-log10(immse(sim_te,out_te));
perf_errorTM(k)=-log10(immse(sim_tm,out_tm));

err_linTE(k)=-log10(immse(sim_te,ylin_te'));
err_linTM(k)=-log10(immse(sim_tm,ylin_tm'));

err_cubicTE(k)=-log10(immse(sim_te,ycubic_te'));
err_cubicTM(k)=-log10(immse(sim_tm,ycubic_tm'));

err_polyTE(k)=-log10(immse(sim_te,ypoly_te'));
err_polyTM(k)=-log10(immse(sim_tm,ypoly_tm'));

end

%%
fig1=figure;
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw,'Fontname',fname); %<- Set properties
ax.ColorOrderIndex = 1;
h = subplot(1,1,1); 

p1=plot(N1,perf_errorTE,'.-','markersize',40,'linewidth',lw); hold on;
% p2=plot(N1,perf_errorTM,'.--','markersize',25,'linewidth',lw); hold on;

p3=plot(N1,err_linTE,'.-','markersize',40,'linewidth',lw); hold on;
% p4=plot(N1,err_linTM,'.--','markersize',25,'linewidth',lw); hold on;

p5=plot(N1,err_cubicTE,'.-','markersize',40,'linewidth',lw); hold on;
% p6=plot(N1,err_cubicTM,'.--','markersize',25,'linewidth',lw); hold on;

p7=plot(N1,err_polyTE,'.-','markersize',40,'linewidth',lw); hold on;
% p8=plot(N1,err_polyTM,'.--','markersize',25,'linewidth',lw); hold on;

set(p1,{'color'},{c(1,:)})
% set(p2,{'color'},{c(1,:)})
set(p3,{'color'},{c(2,:)})
% set(p4,{'color'},{c(2,:)})

set(p5,{'color'},{c(3,:)})
% set(p6,{'color'},{c(3,:)})
set(p7,{'color'},{c(4,:)})
% set(p8,{'color'},{c(4,:)})

set(gca,'fontsize',fsz,...
        'Xlim',[N1(1) N1(end)],...
        'xtick',[N1(1):1:N1(end)],...
        'Ylim',[1 6],...
        'ytick',[1:1:6]);  

xlabel('{\it N}_L');
ylabel('-log_{10}(Perf. error)')
set(gca,'TickLength',[.03 .03]);

pos=[0.3 0.74 0.1300 0.2100];
leg=legend('{\it N}_L=4\times6\times4','Linear','Cubic-spline','Polynomial','position',pos);
% set(leg,'fontsize',20);
legend boxoff
%------resize plot
pos_sub=get(h,'position');
plot_offx1=0.16;
plot_offy2=0.14;
plot_fx=0.78;
plot_fy=0.8437;

pos_sub(1)=plot_offx1;
pos_sub(2)=plot_offy2;
pos_sub(3)=plot_fx;
pos_sub(4)=plot_fy;
set(h,'position',pos_sub);
%------resizing again
set(gcf,'InvertHardcopy','on');    
set(gcf,'PaperUnits', 'inches');
papersize = get(gcf, 'PaperSize');
left = (papersize(1)- width)/2;
bottom = (papersize(2)- height)/2;
myfiguresize = [left, bottom, width, height];
set(gcf,'PaperPosition', myfiguresize);

% %------save
% print(fig1,['.\figure\compare-fit'],'-dmeta','-r300');
% print(fig1,['.\figure\compare-fit'],'-dpdf','-r300');

