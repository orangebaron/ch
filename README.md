# ch (choose)
a tool that lets you choose files/folders in the shell without using tab or ls

prints the user interaction parts with stdErr instead of stdOut so you can use stdOut in commands to select stuff (see examples below)
## examples:
run directly:
```
$ ch
1 . 2 .. 3 aFile 4 aFolder
$ 4
1 . 2 .. 3 anotherFile
$ 3
./aFolder/anotherFile
```
use in another command:
```
$ cat $(ch)
1 . 2 .. 3 aFile 4 aFolder
$ 4
1 . 2 .. 3 anotherFile
$ 3
this is the text that's in anotherFile
```
select a folder:
```
$ ls -l $(ch)
1 . 2 .. 3 aFile 4 aFolder
$ 4
1 . 2 .. 3 anotherFile
$ 1
total 4
-rw-r--r-- 1 uwe uwe 39 Jun 16 17:16 anotherFile
```
works with `cd`:
```
$ cd $(ch)
1 . 2 .. 3 aFile 4 aFolder
$ 4
1 . 2 .. 3 anotherFile
$ 1
ls -l
total 4
-rw-r--r-- 1 uwe uwe 39 Jun 16 17:16 anotherFile
```
choose a file by number if you know it already:
```
$ ls $(ch -n 4)
anotherFile
```
choose from a directory other than pwd:
```
$ ls $(ch /)
1 . 2 .. 3 bin 4 boot 5 dev 6 etc 7 home 8 iface 9 lib 10 lib32 11 lib64 12 media 13 mnt 14 opt 15 proc 16 root 17 run 18 sbin 19 sys 20 tmp 21 usr 22 var
$ 7
1 . 2 .. 3 uwe
$ 1
uwe
```
move up a directory:
```
$ ch /home
1 . 2 .. 3 uwe
$ 2
1 . 2 .. 3 bin 4 boot 5 dev 6 etc 7 home 8 iface 9 lib 10 lib32 11 lib64 12 media 13 mnt 14 opt 15 proc 16 root 17 run 18 sbin 19 sys 20 tmp 21 usr 22 var
$ 7
1 . 2 .. 3 uwe
$ 1
/home/../home
```
add quotes when choosing something with spaces in its name:
```
$ ls "$(ch ..)"
1 . 2 .. 3 a b c
$ 3
1 . 2 .. 3 aFile 4 aFolder
$ 1
aFile aFolder
```
