function dev --description "enter dev environment"
  if test (count $argv) -eq 0
    cd ~/Documents/dev
  else
    cd ~/Documents/dev/$argv
  end
end
