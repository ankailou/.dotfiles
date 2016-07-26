function play --description 'play torrent, stream, or folder'
  if [ (count $argv) -eq 0 ]
    echo 'error: provide at least 1 argument (torrent/magnet, stream id, folder)'
  else if [ "$argv[1]" = "torrent" ]
    peerflix --mpv $argv[2..-1]
  else if [ "$argv[1]" = "twitch" ]
    mpv "http://www.twitch.tv/$argv[2]"
  else if [ "$argv[1]" = "archive" ]
    if [ (count $argv) -eq 1 ]
      mpv ~/Movies/Archive/*
    else
      for kw in $argv[2..-1]
        mpv ~/Movies/Archive/*$kw*
      end
    end
  else if [ "$argv[1]" = "backlog" ]
    if [ (count $argv) -eq 1 ]
      mpv ~/Movies/Backlog/*
    else
      mpv $argv[2..-1] ~/Movies/Backlog/*
    end
  else if [ "$argv[1]" = "yt" ]
    if [ (count $argv) -eq 1 ]
      yt
    else
      yt $argv[2..-1]
    end
  else
    echo "Action $argv[1] is not a recognized action..."
  end
end
