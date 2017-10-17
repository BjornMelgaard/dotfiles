pm2-start () {
  pm2 start --no-daemon ./pm2/$1.json
}

operator-start () {
  $(cd /home/bjorn/projects/slots && yarn run dev:operator)
}

rgs-start () {
  $(cd /home/bjorn/projects/rgs-decoupled && yarn run dev:local)
}

slots-restart () {
  pm2 kill
  operator-start &
  rgs-start
}

rgs-delete-rounds () {
  mysql --user=root --password=rgs --host=127.0.0.1 --port=3306 rgs <<EOF
TRUNCATE \`rgs\`.\`transactions\`;
DELETE FROM \`rgs\`.\`rounds\`;
EOF
}

# SELECT @@global.sql_mode
rgs-set-global () {
  mysql --user=root --password=rgs --host=127.0.0.1 --port=3306 rgs <<EOF
SET global sql_mode = 'NO_ENGINE_SUBSTITUTION';
EOF
}
