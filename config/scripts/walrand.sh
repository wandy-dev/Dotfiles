#!/bin/bash
ls ~/Wallpapers |sort -R |tail -n1 |while read file; do
	wal -c -i ~/Wallpapers/"$file" && cp ~/Wallpapers/"$file" ~/.config/wall.png
done
