#!/bin/bash

for i in 1.5.{12..24}; do
	COMMIT=$(git log --branches --grep "automatic post-release commit for mutt-$i" --format="%h")
	if [ -z "$COMMIT" ]; then
		echo "Can't find log for mutt-$i"
		exit
	fi
	git checkout -b mutt/$i $COMMIT
done

