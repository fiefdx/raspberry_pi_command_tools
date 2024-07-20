#!/bin/bash
cmd_path=$(dirname $0)
cd $cmd_path

sudo systemctl restart console-setup

