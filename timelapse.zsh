#!env zsh

if [[ -z $1 ]]; then
  echo "Make a timelapse video:
  $0 <source> <destination> <frames>
  <source> - input video name
  <destination> - output video name
  <frames> - number of frames to pull per second (1 fastest, 24 slowest)"
  exit 0
fi

local wd=$PWD
local tmp=`mktemp -d -t fast-forward`
echo ffmpeg -i $1 -r 1 -f image2 ${tmp}/%05d.png
cd $tmp
echo mencoder "mf://*.png" -mf fps=24 -o $wd/$2 -ovc lavc -lavcopts vcodec=msmpeg4v2:vbitrate=8192
cd $wd
