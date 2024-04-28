% 주기
T = 0.2;

% b 결과
sys_d = tf(-1,6,T) + tf([1 -1],[2 -2*exp(-2*T)],T) ...
        - tf([1 -1],[3 -3*exp(-3*T)],T);

% 분모의 최고차항을 1로 맞춘다.
sys_d.Numerator{1,1} = sys_d.Numerator{1,1}/sys_d.Denominator{1,1}(1,1);
sys_d.Denominator{1,1} = sys_d.Denominator{1,1}/sys_d.Denominator{1,1}(1,1);

sys_d

% c 결과
state_c = ss([-3 0;0 -2],[1;1],[1 -1],0);
tf_c = tf(state_c);
tf_d = c2d(tf_c,T);

tf_d

