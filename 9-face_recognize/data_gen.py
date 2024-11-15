import numpy as np
import cv2
 
cap = cv2.VideoCapture(0)
face_cascade = cv2.CascadeClassifier("haarcascade_frontalface_alt.xml")
sampleNum = 0
Id = input('请输入id：')
 
while True:
    ret, img = cap.read()
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    faces = face_cascade.detectMultiScale(gray, 1.3, 5)
    for (x, y, w, h) in faces:
        img = cv2.rectangle(img, (x, y), (x + w, y + h), (255, 0, 0), 2)
        # 增加例子数
        sampleNum = sampleNum + 1
        
        # 把照片保存到数据集文件夹
        cv2.imwrite(
            "dataSet/user." + str(Id) + "." + str(sampleNum) + ".jpg",
            gray[y : y + h, x : x + w],
        )
    cv2.imshow("img", img)
    if cv2.waitKey(1) & 0xFF == ord("q"):
        break
    if sampleNum == 50:
        break
 
cap.release()
cv2.destroyAllWindows()