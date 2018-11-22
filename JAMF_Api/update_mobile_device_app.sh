#!/bin/bash


username="username"							#JSS username with API privileges
password="password"	
jss="jss.url"						#Password for the JSS account
for id in 1 2
do
			# Make changes to mobile device app deployment. See api
curl -X PUT -u $username:$password "https://"$jss"/JSSResource/mobiledeviceapplications/id/$id" -H "content-type: text/xml" -d "<mobile_device_application><general><remove_app_when_mdm_profile_is_removed>false</remove_app_when_mdm_profile_is_removed></general></mobile_device_application>"
done
