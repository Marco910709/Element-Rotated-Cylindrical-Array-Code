%======================
%This function is used to calculate the element-rotated array pattern
% ======================
function [ff_pco,ff_px]=aff(x)

global atheta
global aphi
global l1
global beta
global dx dz
global theta0
global theta_v

x_pop=x.';
rotAng=x_pop(1:l1);
phase=x_pop(l1+1:end);

rotAng_deg=rotAng/pi*180;
[aa,bb]=find(rotAng_deg<0);
rotAng_deg(aa,bb)=rotAng_deg(aa,bb)+360;

rotAng_int=floor(rotAng_deg);
rotAng_dec=rotAng_deg-rotAng_int;

ff_co=zeros(size(theta_v));
ff_x=zeros(size(theta_v));
for m=1:l1
    
    dec=rotAng_dec(m);
    alp_low=rotAng_int(m);
    alp_up=alp_low+1;
    while alp_up==360
        alp_up=0;
    end
    while alp_low==360
        alp_up=0;
        alp_low=0;
    end
    atheta_p1=atheta(:,360-alp_low);
    aphi_p1=aphi(:,360-alp_low);
    
    atheta_p2=atheta(:,360-alp_up);
    aphi_p2=aphi(:,360-alp_up);
    rETheta_rot=(atheta_p2-atheta_p1)*dec+atheta_p1;
    rEPhi_rot=(aphi_p2-aphi_p1)*dec+aphi_p1;
    
    theta00=theta0(m)/pi*180;
    low_bound=floor(theta00);
    v_dec=theta00-low_bound;
    up_bound=low_bound+1;
    
    rEPhi_rot_low=circshift(rEPhi_rot,low_bound);
    rETheta_rot_low=circshift(rETheta_rot,low_bound);
    rEPhi_rot_up=circshift(rEPhi_rot,up_bound);
    rETheta_rot_up=circshift(rETheta_rot,up_bound);
    
    rephi=(rEPhi_rot_up-rEPhi_rot_low)*v_dec+rEPhi_rot_low;
    retheta=(rETheta_rot_up-rETheta_rot_low)*v_dec+rETheta_rot_low;
    
    ff_x=ff_x+retheta.*exp(1j*(beta*dx(m)*sin(theta_v)+beta*dz(m)*cos(theta_v)+repmat(phase(m),size(theta_v))));
    ff_co=ff_co+rephi.*exp(1j*(beta*dx(m)*sin(theta_v)+beta*dz(m)*cos(theta_v)+repmat(phase(m),size(theta_v))));
end

afs=ff_co.*conj(ff_co);
afs_norm=afs/max(max(afs));
ff_pco=10*log10(afs_norm);

aft=ff_x.*conj(ff_x);
aft_norm=aft/max(max(afs));
ff_px=10*log10(aft_norm);

end