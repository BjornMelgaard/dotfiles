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

delete-rounds () {
  mysql --user=rgs --password=rgs --host=127.0.0.1 --port=3306 rgs <<EOF
TRUNCATE \`rgs\`.\`transactions\`;
DELETE FROM \`rgs\`.\`rounds\`;
EOF
}
