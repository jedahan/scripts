#!env bash
PULSEAUDIO_HOSTNAME=mythbox
echo "Starting Sound on $PULSEAUDIO_HOSTNAME"
echo "Redirecting Sound to myth"
osascript ./mac2myth.scpt

echo
echo "Control C to bring the sound back"
echo
echo "Sending Sound to $PULSEAUDIO_HOSTNAME"
esd -tcp -bind ::1 & sleep 5 && (esdrec -s ::1 | esdcat -s $PULSEAUDIO_HOSTNAME )
echo "Bring Sound back to local speakers"
osascript ./mac2mac.scpt
echo "Sound daemon will terminate automatically on $PULSEAUDIO_HOSTNAME"
