DIRNAME=$1
 
MAIN=$(pwd)

cd "$DIRNAME" || exit

HERE=$(pwd)


cat */failed_login_data.txt | awk 'match($0, /([a-zA-Z]+) ([0-9]+) ([0-9]+) ([a-zA-z0-9_.-]+) ([0-9.]+)/, groups) {print groups[5]}' | sort > text.txt

join "$HERE"/text.txt "$MAIN"/etc/country_IP_map.txt | awk '{print $2,$1}' | sort | awk '{print $1}' | uniq -c | awk 'match($0, /[ ]+([0-9]+) ([A-Z]+)/, groups) {print "data.addRow([\x27"groups[2]"\x27, "groups[1]"]);"}' > temp.html

cd "$MAIN" || exit

./bin/wrap_contents.sh "$HERE"/temp.html "$MAIN"/html_components/country_dist "$HERE"/country_dist.html

rm "$HERE/temp.html"
rm "$HERE/text.txt"
