POSITIONAL=()
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
    -l|--lib)
    LIBPATH="$2"
    shift # past argument
    shift # past value
    ;;
    --default)
    DEFAULT=YES
    shift # past argument
    ;;
    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

echo FILE EXTENSION  = "${EXTENSION}"
echo SEARCH PATH     = "${SEARCHPATH}"
echo LIBRARY PATH    = "${LIBPATH}"
echo DEFAULT         = "${DEFAULT}"
echo "Number files in SEARCH PATH with EXTENSION:" $(ls -1 "${SEARCHPATH}"/*."${EXTENSION}" | wc -l)
if [[ -n $1 ]]; then
    echo "Last line of file specified as non-opt/last argument:"
    tail -1 "$1"
fi

function displayHelp {
 echo "Thank you for trying out RomReverse!\n"
 echo "Version : 0.1-alpha\n"
 echo "-b|--boot (required) path to boot.oat file\n"
 echo "-r|--root (required) path to rom  root directory\n"
 echo "\nSmali /Baksmali tools must be installed.\n When providing directory paths please give full path due to issues \n that ive had with smali tool"
echo "\n\n"
}

