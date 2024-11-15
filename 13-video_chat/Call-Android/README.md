本文指导你运行 Android 示例项目。

## 前提条件

- 开发环境：
  - Android Studio 2020.3.1 Canary 1
- Android 真机（不能用模拟器）

## 运行示例项目

参考以下步骤编译和运行示例项目：

1.将代码克隆到本地

```
git clone https://github.com/anyRTC-UseCase/ARCall.git
```

2.将 Call-Android 导入 Android Studio


3.配置相关参数

在 `Call-Android/app/build.gradle` 文件中配置以下参数：
- 你获取到的anyRTC App ID。

```
buildConfigField("String", "APPID", '"YOUR APPID"')
```

4.运行


  

