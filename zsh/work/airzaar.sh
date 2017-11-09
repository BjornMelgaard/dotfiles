LOCAL_PATH="/home/bjorn/projects/airzaar"
SSH_USER="dmitriy"

# airzaar
SSH_HOST="airzaar"
REMOTE_PATH="/home/$SSH_USER/airzaar-dev"

# strayos
# SSH_HOST="strayos"
# REMOTE_PATH="/home/$SSH_USER/strayos"

RSYNC_CRED="$SSH_USER@$SSH_HOST:$REMOTE_PATH"

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

# useful aliases:
# alias rake="bundle exec rake"
airzaar-be () {
  if [[  "$1" == "exec" ]]
  then
    # example: airzaar-be exec 'User.find_by(email: "melgaardbjorn@gmail.com").destroy'
    ssh $SSH_HOST -t "cd $REMOTE_PATH/be/; echo '$2' | rails c"
  elif [[  "$1" == "irb" ]]
  then
    # helper: me = User.find_by(email: 'melgaardbjorn@gmail.com')
    ssh $SSH_HOST -t "cd $REMOTE_PATH/be/; rails c"
  elif [[  "$1" == "bash" ]]
  then
    ssh $SSH_HOST -t "cd $REMOTE_PATH/be/; bash"
  elif [[  "$1" == "screen" ]]
  then
    ssh $SSH_HOST -t "TERM=screen screen -x develops-be"
  elif [[  "$1" == "screen-new" ]]
  then
    ssh $SSH_HOST -t "TERM=screen screen -S develops-be"
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
    ssh $SSH_HOST -t "cd $REMOTE_PATH/fe/; bash"
  elif [[  "$1" == "screen" ]]
  then
    ssh $SSH_HOST -t "TERM=screen screen -x develops-fe"
  elif [[  "$1" == "screen-new" ]]
  then
    ssh $SSH_HOST -t "TERM=screen screen -S develops-fe"
  elif [[  "$1" == "push" ]]
  then
    whiteribbon $FE_REMOTE_STATE
    rsync -arhvz --progress $LOCAL_PATH/fe/ $RSYNC_CRED/fe/ --delete --exclude='node_modules' --exclude='bower_components' --exclude='./build'
  elif [[  "$1" == "start" ]]
  then
    whiteribbon $FE_LOCAL_STATE
    yarn run start
  else
    command_list="bash, screen, screen-new, push"
    echo "Command $1 was not found!"
    echo "Available commands: $command_list"
  fi
}
