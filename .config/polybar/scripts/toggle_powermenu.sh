#!/usr/bin/sh
if (($(eww windows | grep *shutdown | wc -l) > 0))
then
  eww close shutdown
  eww close restart
  eww close lock
  eww close sleep
  eww close logout
else
  eww open-many shutdown restart lock sleep logout
fi
