#!/bin/sh

#######################################################################
#         Greps serial number and sets computer HostName             #
#######################################################################

# Set your custom HostName prefix - edit below
prefix="companyname"


# Grep Serial Number
serialNumber=`ioreg -l | grep IOPlatformSerialNumber|awk '{print $4}' | cut -d \" -f 2`


# Set hostname and computername
scutil --set HostName $prefix-$serialNumber
scutil --set LocalHostName $prefix-$serialNumber
scutil --set ComputerName $prefix-$serialNumber
