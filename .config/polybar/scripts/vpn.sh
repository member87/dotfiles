#!/bin/sh



if command -v protonvpn-cli &> /dev/null 
then
	if (($(protonvpn-cli status | grep -i "No active" | wc -l) > 0)); 
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
