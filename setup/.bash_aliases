alias ll='ls -lah'
alias tmuxw='tmux new-session -s work "tmux source-file ~/.tmux/work"'
alias youtubevorbis="youtube-dl --extract-audio --audio-format vorbis"
alias youtubemp3="youtube-dl --extract-audio --audio-format mp3"
# Based on https://askubuntu.com/questions/564567/how-to-download-playlist-to-mp3-format-with-youtube-dl/668028#668028
alias youtubeplaylist="youtube-dl --extract-audio --audio-format vorbis --sleep-interval 30 -i"
# Add the txt file name at the end
alias youtubebatchfile="youtube-dl --extract-audio --audio-format vorbis --sleep-interval 30 -i --batch-file"
# disk usage sorted
alias dus='du -hd1|sort -hr'
# Disable Ctrl-S ctrl-Q in terminals
stty -ixon
# Paths for git run
export PATH=~/.npm-global/bin:$PATH
# Paths for python modules
export FOREST_PULLER_CACHE="$HOME/rp/puller_cache/"
export PYTHONPATH="$HOME/repos/bioeconomy_notes/src/":$PYTHONPATH
export PYTHONPATH="$HOME/repos/forest_puller/":$PYTHONPATH
export PYTHONPATH="$HOME/repos/cbmcfs3_runner/":$PYTHONPATH

