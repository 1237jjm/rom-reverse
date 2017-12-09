
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -b|--boot)
    BOOT_DIR="$2"
    shift # past argument
    shift # past value
    ;;
    -r|--root)
    ROOT_DIR="$2"
    shift # past argument
    shift # past value
    ;;
    -h|--help)
    displayHelp
    shift # past argument
    shift # past value
    ;;
    
esac
done

APK_NAMES=()
apkIndex=0
ODEX_NAMES=()
odexIndex=0
shopt -s globstar

for file in ${ROOT_DIR}/**/*
do 
	if [ ${file: -4} == ".apk" ]
	 APK_NAMES[apkIndex] = ${file: -4}
	 let "apkIndex += 1"
	 apktool d -o ${ROOT_DIR}/out/${file: -4}/ ${file}
	fi
	
	if [ ${file: -5} == ".odex" ]
	 ODEX_NAMES[odexIndex]


function displayHelp {
 echo "Thank you for trying out RomReverse!\n"
 echo "Version : 0.1-alpha\n"
 echo "-b|--boot (required) path to boot.oat file\n"
 echo "-r|--root (required) path to rom  root directory\n"
 echo "\nSmali /Baksmali tools must be installed.\n When providing directory paths please give full path due to issues \n that ive had with smali tool"
echo "\n\n"
}

