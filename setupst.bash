#!/usr/bin/env bash

STREPO=$HOME/Repos/st
PATCH="https://st.suckless.org/patches/colors_at_launch/st-colors-at-launch-0.8.4.diff"
TMPBRANCH="temporal_branch"

if [ ! -d $STREPO ]; then
	echo "st repo does not exist"
	exit
fi

echo "Configuring st..."
# I know there's the -C parameter in git, I just want to make sure before
# cleaning and resetting everything. It'll also be less verbose.
cd $STREPO

git clean -df
git reset --hard
git checkout -b "$TMPBRANCH"
git branch -D master
git checkout master
git pull
git branch -D "$TMPBRANCH"
curl "$PATCH" | git apply -v

sudo make clean install

cd -
