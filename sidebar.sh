#!/bin/bash

DIR="${0%/*}"

for p in $DIR/git/*.patch; do

	MUTT="${p##*/sidebar-}"
	MUTT="${MUTT%-*}"

	DATE="${p##*-}"
	DATE="${DATE%.*}"

	git checkout -b sidebar/$DATE mutt/$MUTT
	git am --committer-date-is-author-date $p
done

