# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias memgrind='valgrind --tool=memcheck --leak-check=yes --leak-resolution=high -v --log-file=memgrind.info --error-limit=no --num-callers=8'

### Radio Stations ###
# Radio Free Asia
alias radio_rfa='mplayer mms://a1545.l2130853544.c21308.g.lm.akamaistream.net/D/1545/21308/v0001/reflector:53544 -cache 256'
alias radio_rfa2='mplayer mms://a652.l2130856651.c21308.g.lm.akamaistream.net/D/652/21308/v0001/reflector:56651 -cache 256'
