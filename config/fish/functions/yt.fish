function yt --description 'play youtube water-later playlist'
  if [ "$argv[1]" = "mkv" ]
    # download playlist of videos
    if test (count $argv) -eq 1
      youtube-dl -o "~/Movies/YouTube/%(title)s-%(id)s.%(ext)s" :ytwatchlater
    else
      youtube-dl -o "~/Movies/YouTube/%(title)s-%(id)s.%(ext)s" $argv[2..-1]
    end
  else if [ "$argv[1]" = "mp3" ]
    # download playlist or url into mp3
    if test (count $argv) -eq 1
      echo 'error: provide a url to a niconico video'
    else
      youtube-dl --extract-audio --audio-format mp3 $argv[2..-1]
    end
  else
    # playlist backlog locally or from watchlater
    if test (find ~/Movies/YouTube/ -type f)
      echo 'Playing online backlog...'
      mpv $argv --ytdl "https://www.youtube.com/playlist?list=WL"
    else
      echo 'Playing local backlog...'
      mpv $argv ~/Movies/YouTube/*
      echo 'Clear all files from ~/Movies/Youtube/*? [y/n]'
      read QUERY
      if [ "$QUERY" = "y" ]
        rm -rf ~/Movies/YouTube/*
      end
    end
  end
end
