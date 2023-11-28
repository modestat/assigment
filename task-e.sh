#!/bin/bash 

#download wikipedia page using curl and save it to the file, the -o nor-palities.html tells 'curl' to save the downloaded content to a file named nor-polities.html, you coudl also do it without -o which would then lead the content to be saved directly to the terminal, while -o option provides better control over the downloaded data
curl -o nor-palities.html https://en.wikipedia.org/wiki/List_of_municipalities_of_Norway

#extract table using awk, the table_html is the variable that stores the ectracted content and it can be named anything you would like to
table_html=$(awk '/<table/,/<\/table>/' nor-palities.html)

#debugging: print the extracted content to te temrinal

#create an html file with the extracted table
echo "<html><head><title>Norwegian Municipalities</title></head><body>" > index.html
echo "$table_html" >> index.html
echo "</body></html>" >> index.html