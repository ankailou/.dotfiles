function eject --description 'eject volume from computer'
  if test (count $argv) -eq 0
    echo 'error: provide name of volume'
  else if [ "$argv[1]" = [--all] ]
    for drive in /Volumes/*
      diskutil unmount $drive
    end
  else if test -e /Volumes/$argv
    diskutil unmount $argv
  else
    echo 'error: volume is not mounted on this machine'
  end
end
