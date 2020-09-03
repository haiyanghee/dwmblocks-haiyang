#!/bin/sh
echo "$(newsboat -x reload print-unread | awk '{ if($1>0) print "📰 " $1}')"
