LOCAL_PATH="/home/bjorn/projects/airzaar"
REMOTE_PATH="/home/dmitriy/airzaar-dev"

RSYNC_CRED="dmitriy@airzaar:$REMOTE_PATH"

GITLAB_STATE="deploy"

BE_LOCAL_STATE="develops-local"
BE_REMOTE_STATE="develops"

FE_LOCAL_STATE="develops-local"
FE_REMOTE_STATE="develops"

whiteribbon () {
  (cd $LOCAL_PATH/util/whiteribbon && python whiteribbon.py $1)
}

airzaar-commit () {
  whiteribbon $GITLAB_STATE
  gaa
  #lc -m $1
  gca -m $1
}

airzaar-be () {
  if [[  "$1" == "exec" ]]
  then
    # example: airzaar-be exec 'User.find_by(email: "melgaardbjorn@gmail.com").destroy'
    ssh airzaar -t "cd $REMOTE_PATH/be/; echo '$2' | rails c"
  elif [[  "$1" == "irb" ]]
  then
    # helper: me = User.find_by(email: 'melgaardbjorn@gmail.com')
    ssh airzaar -t "cd $REMOTE_PATH/be/; rails c"
  elif [[  "$1" == "bash" ]]
  then
    ssh airzaar -t "cd $REMOTE_PATH/be/; bash"
  elif [[  "$1" == "screen" ]]
  then
    ssh airzaar -t "TERM=screen screen -x develops-be"
  elif [[  "$1" == "screen-new" ]]
  then
    ssh airzaar -t "TERM=screen screen -S develops-be"
  elif [[ "$1" == "push" ]]
  then
    whiteribbon $BE_REMOTE_STATE
    rsync -arhvz --progress --delete --exclude='vendor' $LOCAL_PATH/be/ $RSYNC_CRED/be/
    whiteribbon $BE_LOCAL_STATE
  elif [[ "$1" == "pull" ]]
  then
    rsync -arhvz --progress --exclude='vendor' $RSYNC_CRED/be/ $LOCAL_PATH/be/
    whiteribbon $GITLAB_STATE
  else
    command_list="exec, irb, bash, screen, screen-new, push, pull"
    echo "Command $1 was not found!"
    echo "Available commands: $command_list"
  fi
}

airzaar-fe () {
  if [[  "$1" == "bash" ]]
  then
    ssh airzaar -t "cd $REMOTE_PATH/fe/; bash"
  elif [[  "$1" == "screen" ]]
  then
    ssh airzaar -t "TERM=screen screen -x develops-fe"
  elif [[  "$1" == "push" ]]
  then
    whiteribbon $FE_REMOTE_STATE
    rsync -arhvz --progress $LOCAL_PATH/fe/ $RSYNC_CRED/fe/ --exclude='node_modules' --exclude='bower_components' --exclude='./build'
  elif [[  "$1" == "start" ]]
  then
    whiteribbon $FE_LOCAL_STATE
    yarn run start
  else
    command_list="bash, screen, push"
    echo "Command $1 was not found!"
    echo "Available commands: $command_list"
  fi
}
