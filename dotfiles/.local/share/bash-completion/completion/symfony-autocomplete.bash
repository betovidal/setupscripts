#!/bin/env bash

# TODO: This works after launching X, not from tty
# composer, phpspec, symphony, behat...
if command -v symfony-autocomplete &> /dev/null
then
	eval "$(symfony-autocomplete)"
fi
