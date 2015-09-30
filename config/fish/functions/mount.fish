function mount --description 'mount volume on computer'
  if test (count $argv) -eq 0
    echo 'error: provide name of volume'
  else if test -e /Volumes/$argv
    echo 'error: volume is already present on this machine'
  else
    diskutil mount $argv
  end
end
