# CONVERT ALL JPG TO PNG
echo "CONVERTING JPG TO PNG"
for img in input/*.jpg; do
    file=$(basename "$img")
    filename=${file%.*}
    magick "input/$filename.jpg" "input/$filename.png"
done

echo "REMOVING BACKGROUND"
# REMOVE BACKGROUND
for img in input/*.png; do
    file=$(basename "$img")
    echo "FOR $file"
    magick convert "input/$file" "-fuzz" "5%" "-fill" "magenta" "-draw" "color 0,0 floodfill" "-transparent" "magenta" "output/$file"
done

read