for img in *.png
do 
    convert "$img" -trim -rotate 180 processed/"$(basename "$img")" ; 
done
