whiteribbon () {
  $(cd /home/bjorn/projects/airzaar/util/whiteribbon && python2 whiteribbon.py $1)
}

rsc () {
  if [[  "$1" == "airzaar-fe" ]]
  then
      rsync -arhvz --progress /home/bjorn/projects/airzaar/fe/ dmitriy@airzaar:/home/dmitriy/airzaar-dev/fe/ --exclude='node_modules' --exclude='bower_components' --exclude='build'
      ssh airzaar
  elif [[  "$1" == "airzaar-be" ]]
  then
      rsync -arhvz --progress /home/bjorn/projects/airzaar/be/ dmitriy@airzaar:/home/dmitriy/airzaar-dev/be/
      ssh airzaar
  else
      echo 'Project was not found!'
  fi
}
