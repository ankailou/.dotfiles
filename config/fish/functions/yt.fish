function yt --description 'play youtube water-later playlist'
  if [ "$argv[1]" = "video" ]
    # download playlist of videos
    if test (count $argv) -eq 1
      youtube-dl -o "~/Movies/YouTube/%(title)s-%(id)s.%(ext)s" :ytwatchlater
    else
      youtube-dl -o "~/Movies/YouTube/%(title)s-%(id)s.%(ext)s" $argv[2..-1]
    end
  else if [ "$argv[1]" = "audio" ]
    # download playlist or url into mp3
    if test (count $argv) -eq 1
      echo 'error: provide a url to a niconico video'
    else
      youtube-dl -o "~/Music/%(title)s-%(id)s.%(ext)s" --extract-audio --audio-format mp3 $argv[2..-1]
    end
  else
    echo 'Playing online backlog...'
    mpv --ytdl "https://www.youtube.com/playlist?list=WL"
  end
end
