mouse='Razer DeathAdder Elite'

for id in $(xinput list | grep "$mouse" | grep 'pointer' | grep -oP '(?<=id=).[\0-\9]+') 
do
	xinput set-prop $id 'Coordinate Transformation Matrix' 1 0 0 0 1 0 0 0 1
	#xinput set-prop $id 'libinput Accel Speed' -0.4
done;



