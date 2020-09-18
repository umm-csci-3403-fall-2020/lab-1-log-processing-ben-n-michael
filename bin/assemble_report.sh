DIRNAME=$1

MAIN=$(pwd)

cd "$dirname" || exit

cat country_dist.html hours_dist.html username_dist.html > temp.html

cd "$main" || exit 

./bin/wrap_contents.sh "$dirname"/temp.html html_components/summary_plots "$dirname"/failed_login_summary.html

rm "$dirname/temp.html"i
