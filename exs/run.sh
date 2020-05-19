#!/bin/bash
cd $(dirname "$0")
for f in *
do
    if [ $f != 'run.sh' ]
    then
        echo $f
        ../minor $f
    fi
done
