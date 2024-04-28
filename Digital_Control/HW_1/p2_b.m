T = 0.2;

dsys = tf(-1,6,T) + tf([1 -1],[2 -2*exp(-2*T)],T) ...
        - tf([1 -1],[3 -3*exp(-3*T)],T);

dsys

