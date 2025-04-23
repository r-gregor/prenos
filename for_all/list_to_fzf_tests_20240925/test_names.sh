#! /usr/bin/env bash

### Name:	Scriptname ...
### Author:	Author ... 
### Date:	 
### Decription:
### 
### 
### 

names="Gregor\nTadeja\nMark\nZala\nŠpela\nSisi\n"
# case "$(printf "Gregor\nTadeja\nSisi\n" |fzf --reverse)" in
case "$(printf ${names} | fzf --inline-info --reverse)" in
	"Gregor") echo "Oči" ;;
	"Tadeja") echo "Mami" ;;
	"Mark") echo "Sin" ;;
	"Zala") echo "Hči" ;;
	"Špela") echo "Hči" ;;
	"Sisi") echo " ... mačka ..." ;;
	+) echo "WTF?" ;;
esac
