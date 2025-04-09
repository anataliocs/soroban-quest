Require gum
Require glow

Set Theme { "name": "Whimsy", "black": "#535178", "yellow": "#EFD55B", "blue": "#443462", "cyan": "#ABE2D6", "red": "#F08FC3", "purple": "#443462", "white": "#F2E1A6", "brightBlack": "#535178", "brightYellow": "#fdd877", "brightBlue": "#65aef7", "brightPurple": "#aa7ff0", "brightWhite": "#F2E1A6", "background": "#6F336E", "foreground": "#F3D960", "selectionBackground": "#6C347B", "cursorAccent": "#EF8EC5", "cursor": "#B563A8" }
Set WindowBar Colorful

Require clear

Set Shell "bash"

Set Width 1200
Set Height 600
Set CursorBlink true

Set FontSize 32
Set Margin 35
Set MarginFill "margin-fill.png"
Set BorderRadius 10
Set Framerate 30

Sleep 2s
Hide
Type@10ms `clear` Enter
Sleep 2s
Show

Env TITLE "🌠 Loading Coding Adventure... 🌠"
Env JOURNAL ""

Type `gum spin --spinner moon --title "$TITLE" -- Sleep 7s` Enter

Sleep 5s

Sleep 2s
Copy `echo "Initial load complete! " ` Sleep 1s
Paste Sleep 1s Enter
Sleep 2s

Sleep 2s
Hide
Type@10ms `clear` Enter
Sleep 2s
Show

Output intro-0-1.mp4

