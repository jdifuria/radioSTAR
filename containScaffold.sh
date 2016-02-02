#!/bin/bash/
# This script will add Bootstrap container divs to all pages in a specific view's scaffold
sed -i '1i\<div class="container">' edit.html.erb
sed -i '1i\<div class="container">' index.html.erb
sed -i '1i\<div class="container">' new.html.erb
sed -i '1i\<div class="container">' _form.html.erb
sed -i '1i\<div class="container">' show.html.erb
sed -i "\$a</div>" edit.html.erb
sed -i "\$a</div>" index.html.erb
sed -i "\$a</div>" new.html.erb
sed -i "\$a</div>" _form.html.erb
sed -i "\$a</div>" show.html.erb
echo "Your views for $(basename "$PWD") now are wrapped in container divs"
