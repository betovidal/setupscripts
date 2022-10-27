#!/usr/bin/env bash

STREPO=$HOME/Repos/st
REMOTE_PATCHES=(
	"https://st.suckless.org/patches/colors_at_launch/st-colors-at-launch-0.8.4.diff"
)
TMPBRANCH="temporal_branch"
THIS_SCRIPT_PATH="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";
if [ -z "$THIS_SCRIPT_PATH" ]; then
	# Fallback to this dir if anything goes wrong (which will probably
	# make something else go wrong afterwards).
	THIS_SCRIPT_PATH=".";
fi
PATCHES_PATH="$THIS_SCRIPT_PATH/patches/st"

if [ ! -d $STREPO ]; then
	echo "st repo does not exist"
	exit
fi

echo "Configuring st..."
# I know there's the -C parameter in git, I just want to make sure before
# cleaning and resetting everything. It'll also be less verbose.
pushd $STREPO

git clean -df
git reset --hard
git checkout -b "$TMPBRANCH"
git branch -D master
git checkout master
git pull
git branch -D "$TMPBRANCH"
for remote_patch in $REMOTE_PATCHES; do
	echo "Applying remote patch: $remote_patch"
	curl "$remote_patch" | git apply -v
done
# If directory exists, apply all patches (assume they can be applied in any
# order. Will require more thought otherwise.
if [ -d "$PATCHES_PATH" ]; then
	for patch in "$PATCHES_PATH/"*.patch; do
		echo "Applying local patch: $patch"
		git apply "$patch" -v
	done
fi

sudo make clean install

popd
