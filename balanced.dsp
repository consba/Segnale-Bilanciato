import("stdfaust.lib");

sorgente = os.osc(1000); // os. puntatore lib oscillatori

bilanciatore = _ <: _, 0-_; // A <: B "divide" : replica il segnale A in nA volte in B 
ricevitore = _+(0-_) : /(2);

//rumore = _ + no.noise, _ + no.noise;
rumore = par(i, 2, _ + no.noise); //par fa n volte la funzione in parallelo

process = sorgente : bilanciatore : rumore : ricevitore;
//process = no.noise;
