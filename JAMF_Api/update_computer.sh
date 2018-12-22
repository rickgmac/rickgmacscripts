#!/bin/bash


username=""							#JSS username with API privileges
password=""	
jss=""						#Password for the JSS account
for id in serialnumber
do
			# Make changes to mobile device app deployment. See api
curl -X PUT -u $username:$password "https://"$jss"/JSSResource/computers/serialnumber/$id" -H "content-type: text/xml" -d "<computer><general><remote_management><managed>false</managed></remote_management></general></computer>"
done

curl -s -X GET -u $username:$password "https://"$jss"/JSSResource/mobiledeviceapplications/id/$id" -H "accept: text/xml" | xmllint --format - > /Users/Shared/iosapps.txt
