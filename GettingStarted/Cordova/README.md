    
#Cordova plugin for Azure Mobile Engagement Sample Application
----


To easily play around with the plugin, a sample application (w/ unit testing) is available.

#### MAC OS/X
- Edit setup.sh with your own credentials
```sh

export AZME_ANDROID_APPID=<AZME_ANDROID_APPID>
export AZME_ANDROID_COLLECTION=<ANDROID_IOS_COLLECTION>
export AZME_ANDROID_SDKKEY=<ANDROID_IOS_SDKKEY>
export AZME_ANDROID_GOOGLE_PROJECT_NUMBER=<AZME_ANDROID_GOOGLE_PROJECT_NUMBER>

export AZME_IOS_APPID=<AZME_IOS_APPID>
export AZME_IOS_COLLECTION=<AZME_IOS_COLLECTION>
export AZME_IOS_SDKKEY=<AZME_IOS_SDKKEY>

```
- Create the sample project by launching setup.sh 
```sh
sh setup.sh
```
- Go to the directory where the app has been created
```sh
cd ~/AZMECordova
```
- Launch one of the following command
```sh
cordova run android
cordova emulate ios
cordova run ios device
```

#### Windows
The process is similar, just edit/run the `setup.bat` file. Only the Android platform is supported on Windows.

