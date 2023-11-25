# 2023-Sejong-AI-Challange

<img width="50%" alt="image" src="https://github.com/zosungwoo/2023-Sejong-AI-Challange/assets/30895117/8a3cc791-a629-4c2f-8ef3-055203b983d6">

2023 세종 AI 챌린지 (with MATLAB)
인공 지능 분야 문제 해결 능력 경진대회

<br>

### 센서를 이용한 환자 활동 상태 예측 문제

[문제링크](https://www.kaggle.com/competitions/2023-sejong-ai-challenge/overview)

&nbsp; 본 문제는 IMU(Inertial Measurement Unit)을 몸에 장착한 환자의 활동 상태를 예측하는 문제이다. 총 6가지의 활동이 수행되었으며, 활동 수행 중 IMU에 내장된 가속도계(accelerometer)를 통한 x, y, z 방향 가속도와 자이로스코프(gyroscope)를 통한 x, y, z 방향 각속도를 50 Hz의 sampling rate으로 측정하였다.

#### 데이터 설명:
Acc, Gyro로 시작하는 파일의 각 행에는 환자별(measureID) 50 Hz로 측정한 센서값이 기록되어 있다. label의 1,2,3,4,5,6은 각 환자별 활동 상태(class)를 의미한다.

> **Train data**
> 
> Acc_x_train.csv : x방향 가속도값
> 
> Acc_y_train.csv : y방향 가속도값
> 
> Acc_z_train.csv : z방향 가속도값
> 
> Gyro_x_train.csv : x방향 각속도값
> 
> Gyro_y_train.csv : y방향 각속도값
> 
> Gyro_z_train.csv : z방향 각속도값
> 
> yTrain.csv: train data labels
> 
> **Test data**
> 
> Acc_x_test.csv : x방향 가속도값
> 
> Acc_y_test.csv : y방향 가속도값
> 
> Acc_z_test.csv : z방향 가속도값
> 
> Gyro_x_test.csv : x방향 각속도값
> 
> Gyro_y_test.csv : y방향 각속도값
> 
> Gyro_z_test.csv : z방향 각속도값
> 
> submission_sample.csv : 답안 제출용 템플릿


<br>

- **MATLAB 트랙** 참가: MATLAB만을 사용하여 문제 해결
- 총 6개의 신호 중 적절한 3개의 신호를 선택한 후, Scalogram과 같은 Continuous Wavelet Transform을 진행하고 CNN을 적용
- MATLAB을 활용해 데이터 불러오기, 간단한 EDA, 전처리, 성능 개선(피처 엔지니어링, 하이퍼 파라미터 최적화), CNN 모델링(사전학습모델 GoogLeNet, ResNet fine tuning)을 수행
