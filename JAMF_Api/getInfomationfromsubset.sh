#!/bin/bash

#!/bin/bash


username=""							#JSS username with API privileges
password=""							#Password for the JSS account
jss=""								#JSS URL
for id in 1 
do
			# Get a subset of infomation from record. Modify based on what info you need.
			# Will write record to text file and then over right on the next run
curl -X GET -u $username:$password "https://"$jss"/JSSResource/mobiledeviceapplications/id/$id/subset/general" -H "accept: text/xml" | xmllint --format - > /Users/Shared/iosapps.txt

			#read the text file to get specific infomation for the above line
catagory=$(xmllint --xpath '//mobile_device_application/general/category/name/text()' /Users/Shared/iosapps.txt)

			#write out the specified infomation from the above. will not over right the previous text
echo "$catagory - $id" >> /Users/Shared/iosappscatagories.txt
done
