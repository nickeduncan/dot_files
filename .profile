#Sass Alias
alias swm="sass --watch style/main.scss:css/main.css"
alias sw="sass --watch"

#Rails Alias
alias r="rails"
alias s="server"
alias b="bundle"
alias be="bundle exec"
alias bers="bundle exec rails s -p"
alias mig="rake db:migrate"

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
alias gpsh="git push heroku master"
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
alias grsh="git reset HEAD ."
alias grss="git reset --soft"
alias fix="git rebase -i HEAD^"

#Bash Alias
alias ls="ls -FGAlh"
alias hisgrep="history | grep "

#Brew Alias
alias perc="brew services restart percona-server"

#MDLive SSH
alias qa2="ssh deployer@mdlqa2.mdlive.com"
alias qa4="ssh deployer@mdlqa4.mdlive.com"
alias stern="ssh deployer@172.21.1.17"
alias fore="ssh deployer@172.21.3.12"
alias port="ssh deployer@172.21.3.11"
alias prov="ssh deployer@172.21.3.16"

function cdstern() {
	stern
	cd apps/stern/current
}

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
