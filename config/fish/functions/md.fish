function md --description "enter md environment"
  if test (count $argv) -eq 0
    cd ~/Documents/doc/md
  else
    cd ~/Documents/doc/md/$argv
  end
end
