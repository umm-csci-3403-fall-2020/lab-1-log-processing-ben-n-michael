file=$1

nameh="$2_header.html"

namef="$2_footer.html"

output=$3

cat "$nameh" "$file" "$namef" > "$output"
