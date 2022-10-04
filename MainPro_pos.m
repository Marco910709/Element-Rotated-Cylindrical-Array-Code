%======================
%This is the main procedure to do element rotation and phase optimiztion using the CF-PSO for the first example in the article
% ======================

clc;clear all
close all
global l1
l1=24;    % element number
global D
D=48;     % variables to be optimized
global Np
Np=96;  % the number of the particles
max_Iteration=2000;
global DSLL
DSLL=-16.5; % desired SLL
global atheta
global aphi

load('rEPhi_VAEP') % full-wave simulated VAEP: rEPhi
load('rETheta_VAEP') % full-wave simulated VAEP: rETheta
aphi=rEPhi_VAEP;
atheta=rETheta_VAEP;

global dx dz
global theta0
global beta
global theta_v

theta_deg=(-180:1:179)';      
theta_v=theta_deg/180*pi;

f=10e9; % frequency
c=3e8; % speed of light
lambda=c/f; % wavelength
beta=2*pi/lambda;

angle_inter=4/180*pi; % angle interval of the elements
r0=0.5946*lambda/angle_inter;  % radius of the cylindrical array
theta0=(-46:4:46)/180*pi;

dx=r0*sin(theta0);
dz=r0*cos(theta0);

%------------set boundary--------------
global indxup1
global indxup2
global indxlow1
global indxlow2
global upbound

%% mainlobe and sidelobe region
xup=[-20;15];
indxup1=find(theta_deg==xup(1));
indxup2=find(theta_deg==xup(2));
xlow=[-26,21];
indxlow1=find(theta_deg==xlow(1));
indxlow2=find(theta_deg==xlow(2));

upbound=zeros(indxup2-indxup1+1,1); 

%% ---Optimization--
lowx=[-pi*ones(1,D/2),zeros(1,D/2)]; % lower bound of the variables
upx=[pi*ones(1,D/2),2*pi*ones(1,D/2)]; % upper bound of the variables

[best, trace]=pso(Np,max_Iteration,D,lowx,upx);   % optimization employing the PSO

%% ------------ pattern plot----------------------
[ff_co,ff_x]=aff(best);

figure(1)
plot(theta_deg,ff_co,'b','linewidth',2)
hold on
plot(theta_deg,ff_x,'r--','linewidth',2)
hold off
axis([-180 180 -40 0])
xlabel('\theta (deg)')
ylabel('Normalized Pattern (dB)')