function play --description 'stream twitch by username'
  if test (count $argv) -eq 0
    echo 'error: provide at least 1 argument (torrent/magnet link, twitch linke)'
  else if [ "$argv[1]" = "torrent" ]
    peerflix --mpv $argv[2..-1]
  else if [ "$argv[1]" = "twitch" ]
    mpv "http://www.twitch.com/$argv[2]"
  else
    echo "Action $argv[1] is not a recognized action..."
  end
end
