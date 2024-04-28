% 샘플링 주기 0.2s
T = 0.2;

% state space 
state_sys = ss([-3 -2;1 0],[1;0],[1 3],0);
d_state_sys = c2d(state_sys,T);

% 결과 출력

% 펄스 전달함수(이산시간 전달함수)
tf(d_state_sys)

% 이산시간 상태공간 모델
d_state_sys