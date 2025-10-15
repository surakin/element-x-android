#!/bin/sh

#./gradlew assembleGplayRelease
./gradlew assembleFdroidRelease

#rsync --mkpath -a app/build/outputs/apk/gplay/release/ "/home/rayden/Nextcloud/APKs/Element X/gplay/release/"

for apk in `ls app/build/outputs/apk/fdroid/release/*.apk | xargs -n 1 basename`; do zipalign -p 4 -f app/build/outputs/apk/fdroid/release/$apk "app/build/outputs/apk/fdroid/release/unsigned-$apk"; done

#for apk in `ls app/build/outputs/apk/gplay/release/app-*.apk | xargs -n 1 basename`; do apksigner sign --ks ~/.android_keystore --ks-pass pass:kelongtu --out "/home/rayden/Nextcloud/APKs/Element X/gplay/release/$apk" "app/build/outputs/apk/gplay/release/unsigned-$apk"; done

for apk in `ls app/build/outputs/apk/fdroid/release/app-*.apk | xargs -n 1 basename`; do apksigner sign --ks ~/.android_keystore --ks-pass pass:kelongtu --out "app/build/outputs/apk/fdroid/release/$apk" "app/build/outputs/apk/fdroid/release/unsigned-$apk"; done

