#!/bin/sh

usage() {
    echo "Usage: $0 <options> \"description of image for dall-e to consume\""
    echo
    echo "Options:"
    echo "   -k|--keep-image"
    echo "   -a|--api-key openai_api_key"
    echo "   -s|--size (s)mall|(m)edium|(l)arge"
    exit -1
}

keep_image=0
api_key=""
image_description=""
size="1024x1024"
images_to_keep=10

while [[ $# -gt 0 ]]; do
    case "$1" in
        -k|--keep-image)
            if [ "$image_description" ]; then
                usage
            fi
            keep_image=1
            shift
        ;;
        -a|--api-key)
            if [ "$image_description" ]; then
                usage
            fi
            shift
            api_key=$1
            shift
        ;;
        -s|--size)
            if [ "$image_description" ]; then
                usage
            fi
            shift
            case $1 in
                s|small) size="256x256"
                ;;
                m|medium) size="512x512"
                ;;
                l|large) size="1024x1024"
                ;;
                *) usage
                ;;
            esac
            shift
        ;;
        *)
            if [ "$image_description" ]; then
                image_description="$image_description $1"
            else
                image_description=$1
            fi
            
            shift
        ;;
    esac
done


if [ "$image_description" == "" ]; then
    usage
fi

echo "Generating image: \"$image_description\""

loc=$(dirname "$(readlink -f "$0")")""

if [ "$api_key" == "" ]; then
    echo "Loading api key from $loc/openai_key.txt"
    api_key=`cat $loc/openai_key.txt`
fi

output=`curl https://api.openai.com/v1/images/generations \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $api_key" \
-d "{
     \"prompt\": \"$image_description\",
     \"n\": 1,
     \"size\": \"$size\"
}"`

url=`echo $output | sed  -n 's/.*\(https.*\)" } ] }/\1/p'`
if [ "$url" == "" ]; then
    echo "URL for image not found in output:"
    echo $output
    exit -1
fi

if [ $keep_image -eq 1 ]; then
    seq_to=$((images_to_keep-1))   
    for i in `seq $seq_to -1 1`
    do
        j=$((i+1))
        if [ -f "image$i.png" ]; then
            mv "image$i.png" "image$j.png"
        fi
    done
    if [ -f image.png ]; then
        mv image.png image1.png
    fi
    curl $url -o image.png
    url=$loc/image.png
    echo "Image saved to $loc/image.png"
fi

start chrome $url
