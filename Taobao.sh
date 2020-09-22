#!/bin/bash
function delayc
{
sleep 3 
xdotool click 1
}

sleep 3
gpick -s -o > color | delayc
basecolor1=$(cat color)
echo $basecolor1
eval $(xdotool getmouselocation --shell)
x1=$X
y1=$Y
echo $x1 $y1
sleep 4
basecolor2=$(cat color)
echo $basecolor2
eval $(xdotool getmouselocation --shell)
x2=$X
y2=$Y
echo $x2 $y2


for (( i = 0; i <= 30; i++ )) ;
do
	xdotool mousemove ${x1} ${y1}
	gpick -s -o > color | delayc
	varcolor=$(cat color)
	rm color
	echo $varcolor
	if [ "${basecolor1}" == "${varcolor}" ] || ["${basecolor2}" == "${varcolor}" ]; then
		echo "color is same"
		xdotool click 1
		sleep 30
		xdotool click 3
		sleep 10
	else
		echo "Color is not same"
	fi


	xdotool mousemove ${x2} ${y2}
	gpick -s -o > color | delayc
	varcolor=$(cat color)
	rm color
	echo $varcolor
	if [ "${basecolor1}" == "${varcolor}" ] || ["${basecolor2}" == "${varcolor}" ]; then
		echo "color is same"
		xdotool click 1
		sleep 30
		xdotool click 3
		sleep 10
	else
		echo "Color is not same"
	fi
done
