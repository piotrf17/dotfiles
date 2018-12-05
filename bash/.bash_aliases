# bash aliases

# Some more ls aliases.
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Nice valgrind defaults.
alias memgrind='valgrind --tool=memcheck --leak-check=yes --leak-resolution=high -v --log-file=memgrind.info --error-limit=no --num-callers=8'
alias callgrind='valgrind --tool=callgrind -v'

# Random tools.
alias blaze='bazel'
alias lines='find . -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.cxx" -o -name "*.cc" | xargs wc -l'

### Radio Stations ###
# Radio Free Asia
alias radio_rfa='mplayer mms://a1545.l2130853544.c21308.g.lm.akamaistream.net/D/1545/21308/v0001/reflector:53544 -cache 256'
alias radio_rfa2='mplayer mms://a652.l2130856651.c21308.g.lm.akamaistream.net/D/652/21308/v0001/reflector:56651 -cache 256'
