#!/bin/bash 

#set the locale to norwegian bokmål with UTF-8 encoding
export LC_ALL=nb_NO.UTF-8

#use command curl to fetch the HTML data from the wikiepdia page about norwegian municipalities, and save the retrieved content into a file named nor-palities.txt
curl -H "Accept-Charset: UTF-8" -o nor-palities.txt https://en.wikipedia.org/wiki/List_of_municipalities_of_Norway

#by using AWK, it extracts the HTML content of the table having the "sortable wikitable" class from nor-municipalities.txt, and save the result in the variable table_html
table_html=$(awk '/<table class="sortable wikitable"/,/<\/table>/' nor-palities.txt)

#display/print a confimring notification when running the script, the successful extraction of the table, and then output the HTML content of the table 
echo "Extracted Table:"
echo "$table_html"

#create a HTML named index.html with a basic structure, including the extrcated HTML content inside the body
cat > index.html << HTML
<html>
<head>
<meta charset="UTF-8">
<title>Norwegian Municipalities</title>
</head>
<body>
$table_html
</body>
</html>
HTML