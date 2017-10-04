whiteribbon () {
  $(cd /home/bjorn/projects/airzaar/util/whiteribbon && python2 whiteribbon.py $1)
}

airzaar-commit () {
  whiteribbon deploy
  gaa
  bc -m $1
}

airzaar-be () {
  if [[  "$1" == "exec" ]]
  then
    # example: airzaar-be exec 'User.find_by(email: "melgaardbjorn@gmail.com").destroy'
    ssh airzaar -t "cd /home/dmitriy/airzaar-dev/be/; echo '$2' | rails c"
  elif [[  "$1" == "irb" ]]
  then
    # helper: me = User.find_by(email: 'melgaardbjorn@gmail.com')
    ssh airzaar -t "cd /home/dmitriy/airzaar-dev/be/; rails c"
  elif [[  "$1" == "bash" ]]
  then
    ssh airzaar -t "cd /home/dmitriy/airzaar-dev/be/; bash"
  elif [[  "$1" == "screen" ]]
  then
    ssh airzaar -t "TERM=screen screen -x develops-be"
  elif [[  "$1" == "screen-new" ]]
  then
    ssh airzaar -t "TERM=screen screen -S develops-be"
  elif [[  "$1" == "sync" ]]
  then
    whiteribbon develops
    rsync -arhvz --progress /home/bjorn/projects/airzaar/be/ dmitriy@airzaar:/home/dmitriy/airzaar-dev/be/
    whiteribbon develops-local
  else
    command_list="exec, irb, bash, screen, screen-new, sync"
    echo "Command $1 was not found!"
    echo "Available commands: $command_list"
  fi
}

airzaar-fe () {
  if [[  "$1" == "bash" ]]
  then
    ssh airzaar -t "cd /home/dmitriy/airzaar-dev/fe/; bash"
  elif [[  "$1" == "screen" ]]
  then
    ssh airzaar -t "TERM=screen screen -x develops-fe"
  elif [[  "$1" == "sync" ]]
  then
    whiteribbon develops
    rsync -arhvz --progress /home/bjorn/projects/airzaar/fe/ dmitriy@airzaar:/home/dmitriy/airzaar-dev/fe/ --exclude='node_modules' --exclude='bower_components' --exclude='build'
  elif [[  "$1" == "start" ]]
  then
    whiteribbon develops-local
    yarn run start
  else
    command_list="bash, screen, sync"
    echo "Command $1 was not found!"
    echo "Available commands: $command_list"
  fi
}
