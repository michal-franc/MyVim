#!/bin/bash

if [ -z "$1" ]
then
  ls ~/Books
  read -p "Which book to open? (uses ripgrep): " pick
  book=$(rg ~/Books/$pick --files)
else
  book=$1
fi

workspace=$2

if [ -z "$2" ]
then
  echo "No workspace supplied - assuming default 10: Book"
  workspace="10: Book"
fi

i3-msg "workspace $workspace; append_layout /home/mfranc/layouts/book.json"

termite -d $HOME/notes/books &
termite &
termite & 
zathura $book &
