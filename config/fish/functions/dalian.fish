function dalian --description 'copy anime to backup drive'
  if test -e /Volumes/Dalian
    for i in ~/Movies/Backlog/* ~/Movies/Seeding/*
      set -g name (command basename $i)
      switch $name
        case '*.part'
          echo "File '$name' is .part file... Not archived..."
        case '*'
          echo "Archiving Anime Episode: '$name'..."
          cp -n $i /Volumes/Dalian/Anime/$name
      end
    end
    echo "Anime Backup to Dalian complete."
  else
    echo "Dalian isn't home. Try again later."
  end
end
