rvm-new-project () {
  ruby_version='2.4.0'
  curdir=${PWD##*/}
  gemset_name=${2:-$curdir}
  rvm --create --ruby-version ruby-$ruby_version@$gemset_name
}

