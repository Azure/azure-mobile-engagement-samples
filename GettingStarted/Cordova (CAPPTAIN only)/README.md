    
#Cordova plugin for Capptain Sample Application
----


To easily play around with the plugin, a sample application (w/ unit testing) is available.

#### MAC OS/X
- Edit setup.sh with your own credentials
```sh
export CAPPTAIN_IOS_APP_ID=<APP_ID_IOS>
export CAPPTAIN_IOS_SDK_KEY=<SDK_KEY>
export CAPPTAIN_ANDROID_APP_ID=<APP_ID_ANDROID>
export CAPPRAIN_ANDROID_GOOGLE_PROJECT_NUMBER=<GOOGLE_PROJECT_NUMBER>
```
- Create the sample project by launching setup.sh 
```sh
sh setup.sh
```
- Go to the directory where the app has been created
```sh
cd ~/CapptainCordova
```
- Launch one of the following command
```sh
cordova run android
cordova emulate ios
cordova run ios device
```

#### Windows
The process is similar, just edit/run the `setup.bat`file. Only the Android platform is supported on Windows.

