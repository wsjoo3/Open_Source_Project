# Open_Source_Project

## 개발 계획
|Team 11|Weeks|Distributing roles|
|-|-|-|
|-|Week1|개발환경 세팅, Dataset 준비 및 라벨링 작업|
|-|WeeK2|keras 라이브러리를 이용해 라벨링된 이미지 학습|
|-|Week3|학습시킨 데이터를 RaspberryPi에 적용해 테스트|
|-|WeeK4|설정값을 변경하며 원하는 결과가 나올 때까지 테스트 진행|

## Needs

- >Darknet YOLO3 Tiny Framework
- >keras Library
- >RaspberryPi
    - Camera
    - Speaker


## Dataset 구하기
데이터셋 구하는 방법은 크게 두가지가 있다. 직접 수집하는 방법과 오픈 데이터셋을 이용하는 방법이다.   
우선 YOLO 모델이 정상적으로 돌아가는지 확인을 할 필요가 있어 오픈 데이터셋을 이용하기로 했다.   
오픈 데이터셋으로 부족하다고 판단이 되면 직접 데이터를 수집할 계획이다.   
오픈 데이터셋은 구글의 Open Image dataset을 이용할 계획이다.   
- Google Open Image dataset : https://storage.googleapis.com/openimages/web/visualizer/index.html?set=train&type=detection&c=%2Fm%2F03p3bw   

![스크린샷, 2021-10-30 15-20-54](https://user-images.githubusercontent.com/91614334/139522846-dca4a9e1-73c1-4d83-aa50-d857b984a79f.png)   

## Yolov3 시작하기

1. [YOLO 웹사이트](http://pjreddie.com/darknet/yolo/)에서 YOLOv3 weights를 다운로드한다.   
2. Darknet YOLO 모델을 Keras 모델로 변환한다.   
3. YOLO 탐지를 실행한다.   

```
wget https://pjreddie.com/media/files/yolov3.weights
python convert.py yolov3.cfg yolov3.weights model_data/yolo.h5
python yolo_video.py [OPTIONS...] --image, for image detection mode, OR
python yolo_video.py [video_path] [output_path (optional)]
```
## Yolov3 학습
1. annotation file과 class names file을 만든다.  
    One row for one image;  
    Row format: `image_file_path box1 box2 ... boxN`;  
    Box format: `x_min,y_min,x_max,y_max,class_id` (no space).  
    VOC 데이터셋에는 `python voc_annotation.py`을 이용한다.   
    예시:   
    ```
    path/to/img1.jpg 50,100,150,200,0 30,50,200,120,3
    path/to/img2.jpg 120,300,250,600,2
    ...

2. `python convert.py -w yolov3.cfg yolov3.weights model_data/yolo_weights.h5`을 실행한다.   
    model_data/yolo_weights.h5 파일은 사전학습된 weights를 로드하기 위해 쓰인다.   

3. train.py 을 실행한다.  
    `python train.py`  
    
