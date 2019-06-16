#!/bin/dash
myls() {
 echo .
 echo ..
 ls -1 "$folder"
}
choosefilenum() {
 echo "$(myls | head -n $1 | tail -n 1)"
}
fancyls() {
 n=1
 myls | while read file ; do
  /bin/echo -n "$n $file "
  n=$((n+1))
 done
 echo
}
main() {
 if [ -f "$folder" ] ; then
  echo $folder
 else
  >&2 fancyls
  read x
  if [ $x = 1 ] ; then
   echo $folder
  else
   folder="$folder/$(choosefilenum $x)"
   main
  fi
 fi
}
folder=$1
if [ "$folder" = "" ] ; then
 folder=.
fi
if [ "$folder" = "-n" ] ; then
 folder=.
 choosefilenum $2
else
 main
fi
