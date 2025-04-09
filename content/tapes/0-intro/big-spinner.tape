Require gum
Require glow

Set Theme { "name": "Whimsy", "black": "#535178", "yellow": "#EFD55B", "blue": "#443462", "cyan": "#ABE2D6", "red": "#F08FC3", "purple": "#443462", "white": "#F2E1A6", "brightBlack": "#535178", "brightYellow": "#fdd877", "brightBlue": "#65aef7", "brightPurple": "#aa7ff0", "brightWhite": "#F2E1A6", "background": "#6F336E", "foreground": "#F3D960", "selectionBackground": "#6C347B", "cursorAccent": "#EF8EC5", "cursor": "#B563A8" }
Set WindowBar Colorful

Require clear
Require bash

Set Shell "bash"

Set Width 1200
Set Height 600
Set CursorBlink true

Set FontSize 40
Set Margin 35
Set MarginFill "margin-fill.png"
Set BorderRadius 10
Set Framerate 30

Env GUM_SPIN_TITLE ""

Hide
Sleep 2s
Type `echo "meter" > $GUM_SPIN_SPINNER` Sleep 1s Enter Sleep 1s
Type `echo "Unlocking Challenge 1!" > $GUM_SPIN_TITLE` Sleep 1s  Enter Sleep 1s
Type `echo "15s" > $GUM_SPIN_TIMEOUT` Sleep 1s  Enter Sleep 1s
Type@10ms `clear` Enter
Sleep 2s
Show

Type `gum spin --spinner meter -- ./challenge1_unlock.sh ` Enter
Sleep 10s

Sleep 2s
Hide
Type@10ms `clear` Enter
Sleep 2s
Show

Output intro-0-5.mp4

