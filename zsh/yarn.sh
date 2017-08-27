alias y="yarn"
alias yrm="yarn remove"

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
alias yrf="yarn run format"
alias yrs="yarn run start"

alias ya="yarn add"
alias yad="yarn add -D"
alias yga="yarn global add"

alias yu="yarn upgrade"
alias yui="yarn upgrade-interactive"
alias yua="yarn-upgrade-all"
alias ygu="yarn global upgrade"

yat () {
  for var in "$@"
  do
    yarn add $var @types/$var
  done
}
