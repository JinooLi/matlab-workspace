num_Gp_tf = [1];
den_Gp_tf = [1];
Gp_tf = tf(num_Gp_tf, den_Gp_tf);

T = 0.2;
Gd_tf = c2d(Gp_tf, T, 'zoh')