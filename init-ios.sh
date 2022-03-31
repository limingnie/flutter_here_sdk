#!/bin/sh
work_dir="$(pwd)"
sdk_dir="ios/Frameworks/heresdk.xcframework/ios-arm64/heresdk.framework/"

# https://blog.csdn.net/fdipzone/article/details/37533129
split_file() {
    name=$1
    tar cvzf - $name | split -d -b 50m - $name.
    rm $name
}

merge_file() {
    name=$1
    cat $name.* > $name.tar.gz
    tar xzvf $name.tar.gz
    rm $name.*
}

process() {
    name=$1
    if [ -f $name ]; then
        echo "split $name..."
        split_file $name
    else
        echo "merge $name..."
        merge_file $name
    fi
}

cd "$sdk_dir" || exit 1

process heresdk

cd "$work_dir" || exit 1
