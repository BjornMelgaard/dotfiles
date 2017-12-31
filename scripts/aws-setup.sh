# usage:
# ssh USER@HOST 'bash -s' < SCRIPT

echo "Install setup aws script"

cd ~
echo "PWD: `pwd`"

mkdir -p apps

echo "Will create .bashrc"

cat > ~/.bashrc <<EOF
# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

EOF

