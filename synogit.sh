#!/bin/bash

COMMAND_LINE_OPTIONS_HELP="
Command line options:\n
  -s server       ssh host\n
  -p port         ssh port, default 22\n
  -u user         ssh user, default admin\n
  -r repository   name of git repository to create\n
  -d path         directory where to create the project, default /volume1/git\n
\n
e.g. `basename $0` -s 192.168.1.467 -r myrepo\n
"

error () {
    echo -e $COMMAND_LINE_OPTIONS_HELP
    exit -1
}

while getopts s:r:u:p:d flag
do
	case "${flag}" in
		s) optserver=${OPTARG};;
		p) optport=${OPTARG};;
		u) optuser=${OPTARG};;
		r) optrepo=${OPTARG};;
		d) optgitdir=${OPTARG};;
		*) error;;
	esac
done

if [ -z "${optserver}" ]; then
	echo "server option is missing"; error
fi
if [ -z "${optrepo}" ]; then
	echo "repository is missing"; error
fi

server=${optuser:=admin}@$optserver
port=${optport:=22}
repo=${optrepo}
gitdir=${optgitdir:=/volume1/git}

echo "Connecting to $server on port $port and create repository $repo..."

ssh $server -p $port "
  cd $gitdir
  mkdir $repo
  chown git $repo
  cd $repo
  git init --bare
  sudo chown -R git *
"
echo "created repo $repo."

echo "Trying to push intial commit ..."

git clone ssh://git@${optserver}/${gitdir}/${repo}
cd $repo
touch README.md
git add README.md
git commit -m "initial commit"
git push
cd -
