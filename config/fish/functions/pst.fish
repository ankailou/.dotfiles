function pst --description "archive/load teams to Google Drive"
  if test (count $argv) -eq 0
    # prompt user for more input
    echo 'No arguments specified. Please input action (archive, load [gen, [gen,]])'
    read ACTION
    pst $ACTION
  else if [ "$argv[1]" = "archive" ]
    # archive all teams into Google Drive folder
    for i in ~/Documents/My\ Games/Pokemon\ Showdown/Teams/*;
      set -l team (command basename $i)
      switch $team
        case '*ORAS*' '*XY*'
          set -g gen 'Generation VI'
        case '*BW*'
          set -g gen 'Generation V'
        case '*DPP*'
          set -g gen 'Generation IV'
        case '*ADV*'
          set -g gen 'Generation III'
        case '*GSC*'
          set -g gen 'Generation II'
      end
      if [ $gen != '' ]
        echo "Archiving $gen Team: '$team'..."
        cp $i ~/Google\ Drive/Pokemon/$gen/$team
        set -g gen ''
      else
        echo "No generation specified... '$team' not archived..."
      end
    end
    echo "Pokemon Showdown! Team Archive complete."
  else if [ "$argv[1]" = "load" ]
    # load teams from Google Drive folder by generation
    if test (count $argv) -eq 1
      echo 'No generations specified. Please input generation [2-6]'
      read GEN
      psd load $GEN
    else
      echo "Loading generations: $argv[2..-1]"
      for i in $argv[2..-1]
        # get generation
        switch $i
          case '2'
            set -g gen 'Generation II'
          case '3'
            set -g gen 'Generation III'
          case '4'
            set -g gen 'Generation IV'
          case '5'
            set -g gen 'Generation V'
          case '6'
            set -g gen 'Generation VI'
          case '*'
            echo "Generation $i not found in archive..."
        end
        # load teams
        echo "Loading Generation $i Teams..."
        for team in ~/Google\ Drive/Pokemon/$gen/*
           set -l name (command basename $team)
           echo "Loading Generation $gen Team: $name"
           cp $team ~/Documents/My\ Games/Pokemon\ Showdown/Teams/$name
        end
      end
    end
  else
    # invalid/unsupported command
    echo 'Action specified is no supported...'
  end
end
