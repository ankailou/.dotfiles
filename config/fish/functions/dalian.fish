function dalian --description 'copy anime to backup drive'
  if test -e /Volumes/Dalian
    for i in ~/Movies/Backlog/*
      set -g name (command basename $i)
      switch $name
        case 'Icon*'
          echo "Icon file not archived..."
        case '*.part'
          echo "File '$name' is .part file... Not archived..."
        case '*'
          echo "Archiving Anime Episode: '$name'..."
          cp -n $i /Volumes/Dalian/Anime/$name
      end
    end
    echo "Anime Backup to Dalian complete."
  else if test -e /Volumes/Raziel
    echo "Dalian isn't home. Trying Raziel..."
    for i in ~/Movies/Backlog/*
      set -g name (command basename $i)
      switch $name
        case 'Icon*'
          echo "Icon file not archived..."
        case '*.part'
          echo "File '$name' is .part file... Not archived..."
        case '*'
          echo "Archiving Anime Episode: '$name'..."
          cp -n $i /Volumes/Raziel/Anime/$name
      end
    end
    echo "Anime Backup to Raziel complete."
 else
    echo "No one is home. Try again later."
  end
end
