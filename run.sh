#!/bin/sh
#Package and Run
FILE=Dungeon.love
if [ -f "$FILE" ]; then
    echo "$FILE already exists"
else
    echo "building..."
    sleep 1
    zip -r Dungeon.love 'lib' 'src' 'conf.lua' 'main.lua'
    echo "finished packaging"
fi
echo "running..."
sleep .5
love Dungeon.love
echo "done !"