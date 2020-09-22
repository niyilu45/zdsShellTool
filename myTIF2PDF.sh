#!/bin/bash
for name in `ls *.TIF`; do
	tiff2pdf -o ${name%.TIF}.pdf $name
done
pdftk *.pdf cat output output.pdf
for name in `ls *.TIF`; do
	rm ${name%.TIF}.pdf
done
