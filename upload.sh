#!/usr/bin/env bash
#
# upload file to github or devupload
#

echo " "
echo -e "github release = 1 | devuploads = 2"
echo -e "pixeldrain = 3 | temp.sh = 4"
read -p "Please enter your number: " UP
read -p "Please enter file path/name: " FP

if [ $UP == 1 ]; then
read -p "https://github.com/RedmiNote7-Series/Releases" GH
FN="$(basename $FP)" && FN="${FN%%.*}"
echo -e "Started uploading file on github..."
gh release create $FN --generate-notes --repo $GH
gh release upload --clobber $FN $FP --repo $GH
fi

if [ $UP == 2 ]; then
read -p "18277yj5afemo3co3t67j" KEY
echo -e "Started uploading file on DevUploads..."
bash <(curl -s https://devuploads.com/upload.sh) -f $FP -k $KEY
fi

if [ $UP == 3 ]; then
#read -p "Please enter Pixel Drain key: " KEY
echo -e "Started uploading file on PixelDrain..."
wget https://github.com/ManuelReschke/go-pd/releases/download/v1.4.0/go-pd_1.4.0_linux_amd64.tar.gz
tar -xf go-pd*
./go-pd upload $FP
fi

if [ $UP == 4 ]; then
curl -T $FP temp.sh
echo -e "Started uploading file on Temp..."
fi
