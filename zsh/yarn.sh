alias y="yarn"
alias yi="yarn install"
alias yrm="yarn remove"
alias yl="yarn link"

alias yr="yarn run"
alias yrd="yarn run dev"
alias yrdd="yarn run dev:debug"
alias yrl="yarn run lint"
alias yrlf="yarn run lint:fix"
alias yrlw="yarn run lint:watch"
alias yrt="yarn run test"
alias yrtd="yarn run test:debug"
alias yrtu="yarn run test:update"
alias yrtw="yarn run test:watch"
alias yrb="yarn run build"
alias yrf="yarn run format"
alias yrs="yarn run start"

alias ya="yarn add"
alias yad="yarn add -D"
alias yga="yarn global add"

alias yu="yarn upgrade"
alias yul="yarn upgrade --latest"
alias yui="yarn upgrade-interactive"
alias ygu="yarn global upgrade"

yadt () {
  for var in "$@"
  do
    yarn add -D $var @types/$var
  done
}

yat () {
  for var in "$@"
  do
    yarn add $var
    yarn add -D @types/$var
  done
}
