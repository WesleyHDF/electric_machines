vt = 13800;
vl = 13800;
S = 50000000;
Xs = 2.5;
Ra = 0.2;   
fp = 0.9;

Ia = S/(sqrt(3)*vl);
vp = vt/sqrt(3);
phase = acosd(fp)*-1;
jXsIa = Xs * (Ia*cosd(phase)+j*Ia*sind(phase))* j;

Ea = vp*cosd(0)+j*vp*sind(0) + Ra*(Ia*cosd(phase)+j*Ia*sind(phase))+ jXsIa;

modulo = abs(Ea);
fase = angle(Ea)*(180/pi);

