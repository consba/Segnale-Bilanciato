import("stdfaust.lib");

saw(N,f) = par(i, N, os.osc(f*(i+1))/(i+1)) :> _ /(2);

filtro(N,f) = seq(i,N,eavg(acor(f)));

eavg(a) = *(a) : +~*(1-a);
acor(fc) = cos(omega(fc))-1+sqrt(cosq(omega(fc))-4*cos(omega(fc))+3);
omega(fc) = fc*twopi/ma.SR;
twopi = 2*ma.PI;
cosq(x) = cos(x)*cos(x);



process = par(i, 6, saw(100,(220+(i*(sqrt(2)))))) :> _ : /(6) : filtro(10,2000);
