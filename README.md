# 매트랩 워크 스페이스

이 레포지토리는 내가 하는 모든 매트랩 과제, 프로젝트 등을 백업하고 기록하는 용도이다.  
이걸 사용하면서 겪는 문제와 그 해결책을 이 마크다운 파일에 기록한다.

## 발생 문제 list

### simulink에서 workspace로 변수 가져다 쓰기  
우선 simulink에서 `to workspace` 블록을 원하는 출력과 연결한다.

이때 여러 출력을 연결하고싶으면 `mux`를 사용한다.

예를 들어 `to workspace` 블록의 이름을 output으로 설정하였다 하자. 이때, 다음과 같이 사용하면 된다.

```matlab
simout = sim('DC_velo_con');
data1 = simout.output.Data(:,1) % 첫 번째 data
data2 = simout.output.Data(:,2) % 두 번째 data
time = simout.tout % 시간
```

### 대수 루프 문제
`slx`파일을 여러개 만들어 서로 참조하여 계속 발전시키는 구조를 만들면 대수루프를 지원하지 않는다며 오류가 뜰 때가 있는데, 이는 결과가 아직 나오지 않은 값이 피드백되며 오류를 만들어 발생하는 것이다.

이는 `delay`블록 또는 `Memory`블록을 사용하여 feedback루프의 초기값을 설정해 해결할 수 있다. 

하지만, 시뮬레이션이 되긴 하지만 제대로 동작하지 않는 것을 확인하였다.  
되도록이면 시뮬레이션은 한 파일에 모두 만드는 것을 추천한다. 만약 모듈화를 하고싶으면 하나의 파일 안에서 하자.

# 디렉토리 설명
- [Electric machine](./Electirc_machine/)는 전기기기 수업시간에 과제로써 나오는 프로젝트를 넣어놓는다.

- [Digital Control](./Digital_Control/)에는 디지털 제어 수업 [레포지토리](https://github.com/CDSL-UoS/Course_Digital-Control_2024)에서 가져온 자료와 과제가 있다.