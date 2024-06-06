#!/bin/sh

radiusfactor=240 # 1/th of the image size
rotate="false"   # Rotate if landscape

#color="black"
#color="white"
#color="yellow"

out="shadow-$color"
if [ -z "$color" ] ; then
	out="shadow-invert"
fi
echo "Output folder : $out"

if [ $# -eq 1 ] ; then
    if [ -d "$1" ] ; then
		cd "$1"
	fi
fi
echo "Input folder : $PWD"

if [ ! -d "$out" ] ; then
	mkdir "$out"
fi

find . -mindepth 1 -maxdepth 1 -name "*.png" -type f | while read origpng; do
	origpng=$(basename "$origpng")
	echo "Processing $origpng"
	
	echo "- Average color : $(convert "$origpng" -resize 1x1\! \
		-format "rgb(%[fx:int(255*r+.5)],%[fx:int(255*g+.5)],%[fx:int(255*b+.5)])" info:-)"
	
	inverseColor=$(convert "$origpng" -negate -resize 1x1\! \
		-format "rgb(%[fx:int(255*r+.5)],%[fx:int(255*g+.5)],%[fx:int(255*b+.5)])" info:-)
	if [ -z "$color" ] ; then
		shadowColor="$inverseColor"
	else
		shadowColor="$color"
	fi
	echo "- Shadow color : $shadowColor"
	
	rotate="false"
	w=$(identify -format '%w' "$origpng")
	h=$(identify -format '%h' "$origpng")
	p=$(( h * w )) ; size=$(echo "sqrt($p)" | bc)
	if [ $w -gt $h ] ; then
		landscape="true"
	fi
	echo "- Landscape = $landscape because ${w}x${h} with size=$size"
	
	radius=$(( size / $radiusfactor + 1 ))
	echo "- Shadow radius = $radius"
	
	if [ "$landscape" = "true" -a "$rotate" = "true" ] ; then
		angle="90"
	else
		angle="0"
	fi
	
	echo "- Process picture with rotation of $angle° and shadow radius of $radius"
	

	convert "$origpng" \( +clone -background "$shadowColor" -shadow 50x$radius+0+0 \) +swap \
		-background none  -layers merge +repage \
		/tmp/tokumeino-shadow.png
		
	# A very wide logo sould not be wider than 396x50 ~ 19400pix
	# Resizing in MPIX permits that every logo is the same aparent size (surface)
	convert /tmp/tokumeino-shadow.png /tmp/tokumeino-shadow.png -composite -trim +repage -resize 19400@ -rotate $angle "$out/$origpng"
	
	rm -f /tmp/tokumeino-shadow*

done
