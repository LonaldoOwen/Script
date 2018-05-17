#!/bin/sh
#学而思网校自动打包脚本

if [ "$#" != "1" ] && [ "$#" != "2" ] ; then 
	echo "tobuild:          ./pack.sh Debug/Release\r\n" 
	echo "clean and build:  ./pack.sh Debug/Release clean\r\n"
	exit 1; 
fi 

buildtype="$1"
cleantype=""


if [ "$#" == "1" ]; then
	buildtype="$1"
fi

if [ "$#" == "2" ]; then
	buildtype="$1"
	cleantype="$2"
fi

if [ "$buildtype" != 'Debug' ] && [ "$buildtype" != 'Release' ]  ; then
	echo "tobuild:          ./pack.sh Debug/Release \r\n" 
	echo "clean and build:  ./pack.sh Debug/Release clean\r\n"
	exit 1;
fi

if [ "$cleantype" != 'clean' ] && [ "$cleantype" != '' ] ; then
	echo "clean and build:  ./pack.sh Debug/Release clean\r\n"
	exit 1;
fi


CURDIR=$(cd $(dirname ${BASH_SOURCE[0]}); pwd )
echo $CURDIR


# 工程名
APP_NAME="ParentsCommunity"
# 编译路径
buildPath="${CURDIR}/../build"
# info.plist路径
project_infoplist_path="$CURDIR/../${APP_NAME}/${APP_NAME}-Info.plist"
#取版本号
bundleShortVersion=$(/usr/libexec/PlistBuddy -c "print CFBundleShortVersionString" "${project_infoplist_path}")
#取build值
bundleVersion=$(/usr/libexec/PlistBuddy -c "print CFBundleVersion" "${project_infoplist_path}")
#获取时间日期
DATE="$(date +%Y-%m-%d-%H-%M)"
#打包路径
PackagePath="${buildPath}/package/${APP_NAME}_V${bundleShortVersion}_${DATE}"
#ipa复制路径
IPAPATH="${buildPath}/ipa"
#ipa的名称
IPANAME="${IPAPATH}/${APP_NAME}_${buildtype}_V${bundleShortVersion}_${DATE}.ipa"
#archiveNAME = "${APP_NAME}_V${bundleShortVersion}_${DATE}archive.xcarchive"
ArchiveName="${buildPath}/archive/${APP_NAME}_${buildtype}_V${bundleShortVersion}_${DATE}.xcarchive"
#ArchiveName="${buildPath}/archive/ParentsCommunity.xcarchive"

echo "IPANAME"
echo "${IPANAME}"
#echo "=================clean build================="

UserFolder=""
UserPASSWD=""

function unlock_keychain() {
	echo "unlock-keychain begin.."
	 #下面这些行的注视永远不要删除防止新安装构建机还要用
	 #NEVER DELETE BELOW LINES 
	 #ifyou not sure where the keychain is just run this
	 #security list-keychains 
	 #on mac sierra changed to this command below only need once,so it's very secure,no need to write the password here
	 #security set-key-partition-list -S apple-tool:,apple: -k ${UserPASSWD} /Users/${UserFolder}/Library/Keychains/login.keychain-db
	 #on early mac version
	 #security unlock-keychain -p ${UserPASSWD} /Users/${UserFolder}/Library/Keychains/login.keychain
	echo "unlock-keychain end.."
}

function make_ipa() {
	unlock_keychain
	# echo "+++++++++++++++++build+++++++++++++++++"
	#xcodebuild -workspace "${APP_NAME}.xcworkspace" -scheme "${APP_NAME}" -destination generic/platform=iOS  -configuration Debug clean \
	xcodebuild -workspace "${APP_NAME}.xcworkspace" -scheme "${APP_NAME}" -destination generic/platform=iOS  -configuration $buildtype $cleantype \
	ONLY_ACTIVE_ARCH=NO \
	-archivePath "${ArchiveName}" \
	archive \

	if test $? -eq 0
	then
		echo "~~~~~~~~~~~~~~~~~~~编译成功~~~~~~~~~~~~~~~~~~~"
		echo "archive 路径: ${ArchiveName}"
		echo "开始导出ipa包..."
	else
		echo "~~~~~~~~~~~~~~~~~~~编译失败~~~~~~~~~~~~~~~~~~~" 
	exit 1
	fi

	# -derivedDataPath "${buildPath}"\
	# SYMROOT="${buildPath}"\
	# OBJROOT="${buildPath}"\

	#echo "+++++++++++++++++ exportipa +++++++++++++++++"
	xcodebuild -exportArchive  -archivePath "${ArchiveName}"  -exportPath "${PackagePath}"  -exportOptionsPlist "${CURDIR}/exportOptionsPlist.plist"
	if test $? -eq 0
	then
		echo "~~~~~~~~~~~~~~~~~~~导出成功~~~~~~~~~~~~~~~~~~~"
		echo "原始包路径: ${PackagePath}"
		echo "开始复制ipa包到路径${IPANAME}..."
	else
		echo "~~~~~~~~~~~~~~~~~~~导出失败~~~~~~~~~~~~~~~~~~~" 
	exit 1
	fi

    mkdir -p "${IPAPATH}"
	cp -rf "${PackagePath}/parents community.ipa" "${IPANAME}"

}

make_ipa 