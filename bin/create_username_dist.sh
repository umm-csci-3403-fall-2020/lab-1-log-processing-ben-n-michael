!# /usr/bin/env bash

dir=$1
start=$(pwd)
cd "$dir" || exit
start2=$(pwd)

cat */failed_login_data.txt | awk 'match($0, /([a-zA-Z]+) ([0-9]+) ([0-9]+) ([a-zA-Z_0-9.-]+) ([0-9.]+)/, groups) {print groups[4]}' | sort | uniq -c | awk 'match($0, /[ ]+([0-9]+) ([a-zA-Z_0-9.-]+)/, groups) {print "data.addRow([\x27"groups[2]"\x27, "groups[1]"]);"}' > temp.html

cd "$start" || exit

./bin/wrap_contents.sh "$start2"/temp.html "$start"/html_components/username_dist "$start2"/username_dist.html

rm "$start2/temp.html"
