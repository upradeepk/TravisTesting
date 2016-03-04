#!/bin/sh
info_plist=$PWD/SampleProject/SampleProject/Info.plist

buildVersion=$(/usr/libexec/PlistBuddy -c "Print CFBundleShortVersionString" $info_plist)
currentbuildNumber=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" $info_plist)

buildNumber=$(($currentbuildNumber + 1))
buildVersionFull="$buildVersion.$buildNumber"

/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $buildNumber" $info_plist
#/usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString $buildVersionFull" $info_plist
