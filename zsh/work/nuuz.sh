SSH_CRED="-p 446 deploy@54.190.32.101"

LOCAL_PATH="/home/bjorn/work/nuuz-backend"
REMOTE_PATH="/data/www/stage/nuuz-backend"

RSYNC_CRED="$SSH_USER@$SSH_HOST:$REMOTE_PATH"

nuuz-be () {
  if [[  "$1" == "push" ]]
  then
    rsync -arhvz --progress --delete --exclude='vendor' -e 'ssh -p 446' $LOCAL_PATH/ deploy@54.190.32.101:$REMOTE_PATH/
  elif [[ "$1" == "pull" ]]
  then
    rsync -arhvz --progress --exclude='vendor' --exclude='log' -e 'ssh -p 446' deploy@54.190.32.101:$REMOTE_PATH/ $LOCAL_PATH/
  else
    command_list="exec, irb, bash, screen, screen-new, push, pull"
    echo "Command $1 was not found!"
    echo "Available commands: $command_list"
  fi
}

alias nuuz-db-recreate="dcr be_dev bash -c 'rake db:drop && rake db:create && (rake db:migrate || true) && rake db:seed && rake db:schema:dump'"
