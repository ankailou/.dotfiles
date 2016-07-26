# Function for general convenience
function mkd; mkdir -p "$argv"; cd "$argv"; end
function c;  tr -d '\n' | pbcopy $argv; end

# Running State Functions
function ps;    command ps -SAcr -o 'uid,pid,ppid,time,rss,command'; end
function psef;  ps -ef | grep $argv; end

# Open Functions
function o;    open $argv; end
function oo;   open . $argv; end
function oa;   open -a $argv; end
function ios;  open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app; end
function pman; man -t $argv | open -f -a /Applications/Preview.app; end

# Goto Folder
function dl;     cd ~/Downloads; end
function drive;  cd ~/Google\ Drive; end

# General Housekeeping & Utilities
function sleep;    pmset sleepnow; end
function ss;       sudo open -a /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app; end

function osc;      ssh osu0275@oakley.osc.edu; end
function stdlinux; ssh loua@stdlinux.cse.ohio-state.edu; end

function flush;    dscacheutil -flushcache $argv; end
function cleanup;  sudo find . -type f -name '*.DS_Store' -ls -delete; end
function empty-trash --description 'empty OS X trash folders'
  sudo rm -rfv /Volumes/*/.Trashes
  sudo rm -rfv ~/.Trash
  sudo rm -rfv /private/var/log/asl/*.asl
end
function spoton;  sudo mdutil -a -i on; end
function spotoff; sudo mdutil -a -i off; end
function remoteon; sudo launchctl load -w /System/Library/LaunchDaemons/ssh.plist; end
function remoteoff; sudo launchctl unload -w /System/Library/LaunchDaemons/ssh.plist; end

function screenon
  sudo launchctl load -w /System/Library/LaunchDaemons/ssh.plist
  sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.screensharing.plist
end

function screenoff
  sudo launchctl unload -w /System/Library/LaunchDaemons/ssh.plist
  sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.screensharing.plist
end

# Public Key
function public-key; pbcopy < ~/.ssh/id_rsa.pub; end
