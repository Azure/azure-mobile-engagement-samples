
export DST_PATH=~
export CURDIR=$PWD

# replace with your own IDs 

# GENERIC
export APP_NAME=AZMECordova
export AZME_REDIRECT_URL=mytest
export PACKAGE_NAME=<PACKAGE_NAME>

# IOS
export AZME_IOS_CONNECTION_STRING=<IOS_CONNECTION_STRING>

#ANDROID
export AZME_ANDROID_CONNECTION_STRING=<ANDROID CONNECTION STRING>
export AZME_ANDROID_GOOGLE_PROJECT_NUMBER=<ANDROID GOOGLE PROJECT NUMBER>


rm -rf $DST_PATH/$APP_NAME
cd $DST_PATH
cordova create $APP_NAME $PACKAGE_NAME $APP_NAME
cd $APP_NAME
cordova platform add ios
cordova platform add android
cordova plugin add cordova-plugin-console

cordova plugin add cordova-plugin-ms-azure-mobile-engagement   \
                                --variable AZME_IOS_CONNECTION_STRING=$AZME_IOS_CONNECTION_STRING \
                                --variable AZME_ANDROID_GOOGLE_PROJECT_NUMBER=$AZME_ANDROID_GOOGLE_PROJECT_NUMBER \
                                --variable AZME_ANDROID_CONNECTION_STRING=$AZME_ANDROID_CONNECTION_STRING \
                                --variable AZME_REDIRECT_URL=$AZME_REDIRECT_URL 
                        
cordova plugin add http://git-wip-us.apache.org/repos/asf/cordova-plugin-test-framework.git
cordova plugin add cordova-plugin-ms-azure-mobile-engagement#:tests

rm -rf www
cp -r  $CURDIR/www .

cd $CURDIR
echo "Sample project successfully created in $DST_PATH/$APP_NAME"