# Game-database-info #

Game database info to be used in creation of xml files or kodi scraper files

## Pending information ##

## Data conversion ##
Bash script to convert csv files to hyperspin style xml. To convert just one csv pass 
the csv filename to the script. To convert all csv files in a folder run the script 
with no arguments.

```
#!/bin/bash
#csv xml function
convcsv2xml()
{
file_in="$1.tmp"
file_out="${1%%.*}.xml"
echo "System:""${1%%.*}"
file_in_csv="$1.tmp.csv"

cp "$1" "$file_in"
cp "$1" "$file_in_csv"
echo clean csv
#clean uo csv
#echo 4stars
#sed -i 's~\*\*\*\*~ ~g' "$file_in_csv"
# ** with space
#echo 2stars
#sed -i 's~\*\*~ ~g' "$file_in_csv"
# trailing spaces
echo trailing space
sed -i 's~ >~>~g' "$file_in_csv"
echo trailing space
sed -i 's~ >~>~g' "$file_in_csv"

echo clean xml
# & with &amp;
echo amp
sed -i 's~\&~\&amp;~g' "$file_in"
# ' with &apos;
echo apos
sed -i "s~'~\&apos;~g" "$file_in"
#  with 
echo quotes
sed -i 's~"~~g' "$file_in"
# <br><br> with space
#echo br br
#sed -i 's~\<br\>\<br\>~ ~g' "$file_in"
# <br> with space
#echo br
#sed -i 's~\<br\>~ ~g' "$file_in"
# **** with space
echo 4stars
sed -i 's~\*\*\*\*~ ~g' "$file_in"
# ** with space
echo 2stars
sed -i 's~\*\*~ ~g' "$file_in"
# trailing spaces
echo trailing space
sed -i 's~ >~>~g' "$file_in"
echo trailing space

echo convert csv to xml

echo '<?xml version="1.0"?>' > "$file_out"
echo '<menu>' >> "$file_out"
echo '  <header>' >> "$file_out"
echo '    <listname>'${1%%.*}'</listname>' >> "$file_out"
echo '    <lastlistupdate></lastlistupdate>' >> "$file_out"
echo '    <listversion>test</listversion>' >> "$file_out"
echo '    <exporterversion></exporterversion>' >> "$file_out"
echo '  </header>' >> "$file_out"

while IFS=$'>' read -r -a arry
do
  echo '  <game name="'${arry[0]}'">' >> "$file_out"
  echo '    <description>'${arry[1]}'</description>' >> "$file_out"
  echo '    <year>'${arry[2]}'</year>' >> "$file_out"
  echo '    <rating>'${arry[3]}'</rating>' >> "$file_out"
  echo '    <manufacturer>'${arry[4]}'</manufacturer>' >> "$file_out"
  echo '    <dev>'${arry[5]}'</dev>' >> "$file_out"
  echo '    <genre>'${arry[6]}'</genre>' >> "$file_out"
  echo '    <score>'${arry[7]}'</score>' >> "$file_out"
  echo '    <player>'${arry[8]}'</player>' >> "$file_out"
  echo '    <story>'${arry[9]}'</story>' >> "$file_out"
  echo '    <enabled>Yes</enabled>' >> "$file_out" #'${arry[10]}' just set to 'Yes'
  echo '    <crc>'${arry[11]}'</crc>' >> "$file_out"
  echo '    <cloneof>'${arry[12]}'</cloneof>' >> "$file_out"
  echo '  </game>' >> "$file_out"
done < "$file_in"
echo '</menu>' >> "$file_out"

rm "$file_in"
}

if [[ "$1" ]] ; then
	convcsv2xml "$1"
else
	for file in *.csv ; do
		convcsv2xml "$file"
	done
fi
```
