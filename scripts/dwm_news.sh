#!/bin/sh
#echo "$(newsboat -x reload print-unread | awk '{ if($1>0) print "📰 " $1}')"

unread="$(newsboat -x reload print-unread | awk '{print  $1}')"

printf "📰 %s" "$unread"
if [ $unread -gt 0 ] 
then
	notify-send "📰 Newsboat" "New news for today." &
fi
