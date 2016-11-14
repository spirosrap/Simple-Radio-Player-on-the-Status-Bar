# Simple Status-Bar Radio Player 
### Start/stop your favorite internet radio station with this simple status bar app.

## Installation

* [Install VLC](http://www.videolan.org/vlc/)
* Create a simple bash script:
cdt
#!/usr/bin/env bash

/Applications/VLC.app/Contents/MacOS/VLC -I rc "$@"
cdt
