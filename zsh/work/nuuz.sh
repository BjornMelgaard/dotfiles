SSH_CRED="-p 446 deploy@54.190.32.101"

LOCAL_PATH="/home/bjorn/work/nuuz-backend"
REMOTE_PATH="/data/www/stage/nuuz-backend"

RSYNC_CRED="$SSH_USER@$SSH_HOST:$REMOTE_PATH"

nuuz-be () {
  if [[  "$1" == "push" ]]
  then
    rsync -arhvz --progress --delete --exclude='vendor' --exclude='.ruby-gemset' -e 'ssh -p 446' $LOCAL_PATH/ deploy@54.190.32.101:$REMOTE_PATH/
  elif [[ "$1" == "pull" ]]
  then
    rsync -arhvz --progress --exclude='vendor' --exclude='log' -e 'ssh -p 446' deploy@54.190.32.101:$REMOTE_PATH/ $LOCAL_PATH/
  elif [[  "$1" == "bash" ]]
  then
    ssh $SSH_CRED -t "cd $REMOTE_PATH/; bash"
  elif [[  "$1" == "exec" ]]
  then
    ssh $SSH_CRED -t '${2}'
  else
    command_list="exec, irb, bash, screen, screen-new, push, pull"
    echo "Command $1 was not found!"
    echo "Available commands: $command_list"
  fi
}

alias nuuz-db-recreate="dcr be_dev bash -c 'rake db:drop && rake db:create && (rake db:migrate || true) && rake db:seed && rake db:schema:dump'"

nuuz-local-recreate-db () {
  docker-compose run be_dev bash -c 'rake db:drop && rake db:create && (rake db:migrate || true) && rake db:seed && rake db:schema:dump'
  docker-compose run be_test bash -c 'rake db:drop && rake db:create && rake db:migrate'
}

# helpers
# cd /data/www/stage/nuuz-backend
# sudo /opt/nginx/sbin/nginx -s reload
# tail -f /opt/nginx/logs/error.log
# tail -f /opt/nginx/logs/access.log
# RAILS_ENV=staging rake assets:precompile
# pg_dump -U stage_user nuuz-stage > nuuz-stage-`date +%d_%m_%Y`.sql
# psql -U stage_user nuuz-stage
