#Sass Alias
alias swm="sass --watch style/main.scss:css/main.css"
alias sw="sass --watch"

#Rails Alias
alias r="rails"
alias s="server"
alias b="bundle"
alias be="bundle exec"
alias bers="bundle exec rails s -p"

#VIM Alias
alias v="vim"

#TMUX Alias
alias ta="tmux attach"

#Git Alias
alias g="git status"
alias ga="git add"
alias gc="git commit"
alias gco="git checkout"
alias gpl="git pull --ff-only"
alias gps="git push origin"
alias gtree="git log --graph --decorate --oneline --all"
alias gka="gitk --all &"
alias gd="git diff"
alias gb="git branch"
alias gl="git log --decorate --oneline"
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gst="git stash"
alias gi="git init"
alias gpsu="git push --set-upstream origin"
alias gr="git rebase"
alias gcp="git cherry-pick"
alias grs="git reset --hard"

#Bash Alias
alias ls="ls -FGAlh"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
