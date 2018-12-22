
#!/bin/bash


username=""							#JSS username with API privileges
password=""							#Password for the JSS account
jss=""								#JSS URL
for id in 1 
do
			# Make changes to mobile device app deployment. See api
curl -X PUT -u $username:$password "https://"$jss"/JSSResource/mobiledeviceapplications/id/$id" -H "content-type: text/xml" -d "<mobile_device_application><vpp><vpp_admin_account_id>1</vpp_admin_account_id><assign_vpp_device_based_licenses>true</assign_vpp_device_based_licenses></vpp></mobile_device_application>"
done
