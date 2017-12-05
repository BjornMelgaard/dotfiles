SSH_PORT="446"
SSH_CRED="deploy@54.190.32.101"

LOCAL_PATH_BE="/home/bjorn/projects/nuuz/nuuz-backend"
REMOTE_PATH_BE="/data/www/stage/nuuz-backend"

LOCAL_PATH_FE="/home/bjorn/projects/nuuz/nuuz-react"
REMOTE_PATH_FE="/data/www/stage/nuuz-react"

RSYNC_CRED="$SSH_USER@$SSH_HOST:$REMOTE_PATH_BE"

nuuz-be () {
  if [[  "$1" == "push" ]]
  then
    rsync -arhvz --progress --delete \
      --exclude='vendor' \
      --exclude='tmp' \
      --exclude='log' \
      --exclude='.ruby-gemset' \
      -e "ssh -p $SSH_PORT" \
      $LOCAL_PATH_BE/ \
      $SSH_CRED:$REMOTE_PATH_BE/
    ssh -p $SSH_PORT $SSH_CRED \
      -t "cd $REMOTE_PATH_BE/; RAILS_ENV=staging rake assets:precompile; sudo /opt/nginx/sbin/nginx -s reload"
  elif [[ "$1" == "pull" ]]
  then
    rsync -arhvz --progress \
      --exclude='vendor' \
      --exclude='log' \
      --exclude='.git' \
      -e "ssh -p $SSH_PORT" \
      $SSH_CRED:$REMOTE_PATH_BE/ \
      $LOCAL_PATH_BE/
  elif [[  "$1" == "bash" ]]
  then
    ssh -p $SSH_PORT $SSH_CRED -t "cd $REMOTE_PATH_BE/; bash"
  elif [[  "$1" == "exec" ]]
  then
    ssh -p $SSH_PORT $SSH_CRED -t "cd $REMOTE_PATH_BE/; $2"
  else
    command_list="exec, bash, push, pull"
    echo "Command $1 was not found!"
    echo "Available commands: $command_list"
  fi
}

nuuz-fe () {
  if [[  "$1" == "push" ]]
  then
    rsync -arhvz --progress --delete \
      --exclude='node_modules' \
      --exclude='src/config.js' \
      -e "ssh -p $SSH_PORT" \
      $LOCAL_PATH_FE/ \
      $SSH_CRED:$REMOTE_PATH_FE/
    ssh -p $SSH_PORT $SSH_CRED \
      -t "cd $REMOTE_PATH_FE/; npm run build; sudo /opt/nginx/sbin/nginx -s reload"
  elif [[ "$1" == "pull" ]]
  then
    rsync -arhvz --progress \
      --exclude='node_modules' \
      --exclude='.git' \
      --exclude='build' \
      -e "ssh -p $SSH_PORT" \
      $SSH_CRED:$REMOTE_PATH_FE/ \
      $LOCAL_PATH_FE/
  elif [[  "$1" == "bash" ]]
  then
    ssh -p $SSH_PORT $SSH_CRED -t "cd $REMOTE_PATH_FE/; bash"
  elif [[  "$1" == "exec" ]]
  then
    ssh -p $SSH_PORT $SSH_CRED -t "cd $REMOTE_PATH_FE/; $2"
  else
    command_list="exec, bash, push, pull"
    echo "Command $1 was not found!"
    echo "Available commands: $command_list"
  fi
}

# resetters
nuuz-local-recreate-dev-db () {
  docker-compose run be_dev bash -c 'rake db:drop && rake db:create && (rake db:migrate || true) && rake db:seed && rake db:schema:dump'
}

nuuz-local-reset-dev-sessions () {
  docker-compose run be_dev rake tmp:clear
}

nuuz-local-recreate-test-db () {
  docker-compose run be_test bash -c 'rake db:drop && rake db:create && rake db:migrate'
}

nuuz-local-reset-dev () {
  nuuz-local-recreate-dev-db
  nuuz-local-reset-dev-sessions
}

nuuz-local-recreate-db-all () {
  nuuz-local-recreate-dev-db
  nuuz-local-recreate-test-db
}

# helpers
# cd /data/www/stage/nuuz-backend
# sudo /opt/nginx/sbin/nginx -s reload
# tail -f /opt/nginx/logs/error.log
# tail -f /opt/nginx/logs/access.log
# RAILS_ENV=staging rake assets:precompile
# pg_dump -U stage_user nuuz-stage > nuuz-stage-`date +%d_%m_%Y`.sql
# psql -U stage_user nuuz-stage
