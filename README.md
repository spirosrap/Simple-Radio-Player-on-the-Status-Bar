# Simple Status-Bar Radio Player 
### Start/stop your favorite internet radio station with this simple status bar app.

## Installation

* [Install VLC](http://www.videolan.org/vlc/)
* Create this simple bash script:
```
#!/usr/bin/env bash

/Applications/VLC.app/Contents/MacOS/VLC -I rc "$@"
```
* Save this to /usr/local/bin and then make it executable

```
chmod +x /usr/local/bin/vlc
```
* Run the app.
* You can change the radio station from the variable ```url``` in the app delegate.
