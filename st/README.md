# st (Simple Terminal)

## Patches:

- alpha 
- Ligatures
- sixel 
- scrollback
- Clipboard
- Alpha(Transparency)
- Boxdraw
- w3m
- font2
- right click paste
- st desktop entry
- newterm
- anysize
- anygeometry
- xresources
- sync patch ( Better draw timing to reduce flicker/tearing and improve animation smoothness )
- live reload ( change colors/fonts on the fly )
  and more...
  <br>

## How to apply Xresources and live-reload ?

```
 #make an alias for this command

alias load="kill -USR1 $(pidof st)"
alias  use="xrdb merge"

command : use Xresourcesfile && load

```
## Xresources live-reload demo

<img src="https://github.com/siduck76/dotfiles/blob/master/rice%20flex/live-reloadXresources.gif"> <br><br>

<b>DON'T SKIP THE README, if you want to have a similar setup / know default keybinds.<br><br></b>

## Dependencies : <br>


```

#arch (most of these are already installed on arch distros)
xbps-install libXft-devel libX11-devel harfbuzz-devel libXext-devel libXrender-devel libXinerama-devel
 

#Debian (and ubuntu probably)
apt install build-essential libxft-dev libharfbuzz-dev 

```

## Install <br>

`cd st (this repo) `<br>
`sudo make install `<br>

## Default Keybindings<br>

<pre>
ctrl + shift + c        Copy  <br>
ctrl + shift + v        Paste <br>
alt  + comma            Zoom in <br>
alt  + .                Zoom out <br>
alt  + g                Reset Zoom<br>
alt  + s                Increase Transparency<br>
alt  + a                Decrease Transparency<br>
alt  + m                Reset Transparency<br>
copy anything and right click on the terminal ( will paste the copied thing ) 
mod + shift + enter    open a new terminal with same cwd ( current working directory )
alt + k                 scroll down 
alt + j                 scroll up
</pre>

you can change all of these in config.h
<br>
