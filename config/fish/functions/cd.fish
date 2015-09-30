function cd --description "auto-ls for each cd"
  if [ -n $argv[1] ]
    builtin cd $argv[1]
  else
    builtin cd ~
  end
  # display list for pwd
  la
end

# Parent Directory Functions
function ..;    cd ..; end
function ...;   cd ../..; end
function ....;  cd ../../..; end
function .....; cd ../../../..; end
