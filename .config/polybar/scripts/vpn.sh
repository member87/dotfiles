#!/bin/sh

if command -v protonvpn-cli &> /dev/null 
then
	if (($(protonvpn-cli s | grep -i "No active" | wc -l) > 0)); 
	then
		CONNECTED="%{F#666}disconnected%{F-}"
	else
    CONNECTED=$(protonvpn-cli s | grep "IP" | cut -d ' ' -f3)
	fi
else
	CONNECTED="%{F#666}disconnected%{F-}"
fi


echo "$CONNECTED"
