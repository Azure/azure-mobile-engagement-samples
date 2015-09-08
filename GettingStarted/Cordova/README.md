    
#Cordova plugin for Azure Mobile Engagement Sample Application
----


To easily play around with the plugin, a sample application (w/ unit testing) is available.

#### MAC OS/X
- Edit setup.sh with your own credentials
```sh


export AZME_ANDROID_CONNECTION_STRING=<ANDROID_CONNECTION_STRING>
export AZME_ANDROID_GOOGLE_PROJECT_NUMBER=<ANDROID_GOOGLE_PROJECT_NUMBER>

export AZME_IOS_CONNECTION_STRING=<IOS_CONNECTION_STRING>

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
cordova emulate android
cordova emulate ios
cordova run android --device
cordova run ios --device
```

#### Windows
The process is similar, just edit/run the `setup.bat` file. Only the Android platform is supported on Windows.

