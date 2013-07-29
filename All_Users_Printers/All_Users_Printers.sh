#!/bin/sh
## postflight

dseditgroup -o edit -a everyone -t group _lpadmin


exit 0		## Success
exit 1		## Failure
