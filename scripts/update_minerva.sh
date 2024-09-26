#!/usr/bin/env bash
upd() {
    tmpdir=$(pwd)
  echo 'Updating minerva'
  cd $MINERVADIR
  git pull
  echo '\nUpdating minerva-config'
  cd $MINERVACONFDIR
  git pull
  cd $tmpdir
}

upd
