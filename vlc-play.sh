#!/bin/bash
cmd_path=$(dirname $0)
cd $cmd_path

vlc --gain=0.005 "$@"
