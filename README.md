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
simulink를 사용하다보면 loop를 만들게 된다. 이때 대수루프를 지원하지 않는다며 오류가 뜰 때가 있는데, 이는 결과가 아직 나오지 않은 값이 피드백되며 오류를 만들어 발생하는 것이다.

이는 `delay`블록을 사용하여 feedback루프의 초기값을 설정해 해결할 수 있다.
