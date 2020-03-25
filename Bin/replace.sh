echo "Replacing... $1 $2 -> $3"
find . -name $1 -print0 | xargs -0 sed -i "" "s/$2/$3/g"
