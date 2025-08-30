# Change output name, mode, rate for your monitor use 'xrandr' to see detail
monitor_primary="HDMI-0"
# Please double_check for mode / rate I didn't check in if-condition :>
pri_mode="1920x1080"
pri_rate="74.97"

monitor_secondary="DVI-D-0"
sec_mode="1920x1080"
sec_rate="60.00"

# And so on if you have more than 2 monitor feel free to adjust script

current_outputs=$(xrandr | grep 'connected' | grep -v 'disconnected')

if echo "$current_outputs" | grep -qw "$monitor_primary" && echo "$current_outputs" | grep -qw "$monitor_secondary"; then
	# Set primary monitor
	xrandr --output $monitor_primary --primary
	xrandr --output $monitor_primary --mode $pri_mode --rate $pri_rate
	echo "Set $monitor_primary to $pri_mode @ $pri_rate"	
	
	# Set secondary monitor
	xrandr --output $monitor_secondary --mode $sec_mode --rate $sec_rate
	echo "Set $monitor_secondary to $sec_mode @ $sec_rate"	
	
	# Set position
	xrandr --output $monitor_primary --right-of $monitor_secondary
else
	echo "Monitor setup not recognized check monitor name in 'xrandr' command"
fi

