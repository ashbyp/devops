#!/bin/sh

usage() {
	echo "$0: <-k|--keep-image> \"description of image for dall-e to consume\""
	exit -1
}

keep_image=0
image_description=""


while [[ $# -gt 0 ]]; do
    case "$1" in
    -k|--keep-image)
	    if [ "$image_description" ]; then
	    	usage
	    fi
	    keep_image=1
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

loc=$(dirname "$(readlink -f "$0")")"/"

key=`cat openai_key.txt`

output=`curl https://api.openai.com/v1/images/generations \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer $key" \
	-d "{
          \"prompt\": \"$image_description\",
	  \"n\": 1,
	  \"size\": \"1024x1024\"
        }"`

url=`echo $output | sed  -n 's/.*\(https.*\)" } ] }/\1/p'`

if [ $keep_image -eq 1 ]; then

	if [ -f image4.png ]; then
		mv image4.png image5.png
	fi
	
	if [ -f image3.png ]; then
		mv image3.png image4.png
	fi
	if [ -f image2.png ]; then
		mv image2.png image3.png
	fi
	if [ -f image1.png ]; then
		mv image1.png image2.png
	fi
	if [ -f image.png ]; then
		mv image.png image1.png
	fi
	curl $url -o image.png
	url=$loc/image.png
	echo "Image saved to image,png"
fi

start chrome $url


