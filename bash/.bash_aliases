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
