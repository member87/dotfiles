#!/bin/sh



if command -v nordvpn &> /dev/null 
then
	if (($(nordvpn status | grep -i disconnected | wc -l) > 0)); 
	then
		CONNECTED="%{F#666}disconnected%{F-}"
	else
		IP="$(dig +short myip.opendns.com @resolver1.opendns.com)"
	        CONNECTED="$IP"
	fi
else
	CONNECTED="%{F#666}disconnected%{F-}"
fi


echo "$CONNECTED"
