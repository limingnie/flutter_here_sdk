#!/bin/sh
work_dir="$(pwd)"
sdk_dir="ios/Frameworks/heresdk.xcframework/ios-arm64/heresdk.framework/"

delete_input_file=0

# https://blog.csdn.net/fdipzone/article/details/37533129
split_file() {
    name=$1
    tar cvzf - $name | split -d -b 50m - $name.
    if [ $delete_input_file -eq 1 ]; then
        rm $name
    fi
}

merge_file() {
    name=$1
    cat $name.* >$name.tar.gz
    tar xzvf $name.tar.gz
    rm $name.tar.gz
    if [ $delete_input_file -eq 1 ]; then
        rm $name.*
    fi
}

print_help() {
    echo "Usage: init-ios.sh [options] split|merge"
    echo "  merge                     Merge file"
    echo "  split                     Split file"
    echo "Options:"
    echo "  --delete-input-file       Delete the input file after split or merge"
    echo "  -h, --help                Show this help message and exit"
}

cd "$sdk_dir" || exit 1

process heresdk

while test $# -gt 0; do
    case "$1" in
        merge)
            merge_file heresdk
            ;;
        split)
            split_file heresdk
            ;;
        --delete-input-file)
            delete_input_file=1
            ;;
        -h | --help)
            print_help
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            echo ""
            print_help
            exit 1
            ;;
    esac
    shift
done

cd "$work_dir" || exit 1
