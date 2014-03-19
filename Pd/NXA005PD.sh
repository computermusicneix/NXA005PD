#!/bin/bash

TITLE="NXA005PD-"`date +"%Y-%m-%d_%H_%M_%S"`
APPDIR=$(dirname "$0")"/nxC053/application.linux32"
DIRFLAC=$TITLE/$TITLE-flac
DIRMP3=$TITLE/$TITLE-mp3
HERE=$(dirname "$0")

echo $TITLE
echo $APPDIR
echo $HERE
echo $PWD

mkdir $HERE/$TITLE
mkdir $HERE/$DIRFLAC
mkdir $HERE/$DIRMP3

for i in `seq 1 4`;
do

	java  -Djava.library.path="$APPDIR:$APPDIR/lib" -cp "$APPDIR/lib/nxC053.jar:$APPDIR/lib/core.jar:$APPDIR/lib/jogl-all.jar:$APPDIR/lib/gluegen-rt.jar:$APPDIR/lib/jogl-all-natives-linux-i586.jar:$APPDIR/lib/gluegen-rt-natives-linux-i586.jar" nxC053 "$@"

done

COUNT=0

for x in $HERE/nxPD*;
do
	$((COUNT=$COUNT+1))
	NEW=$TITLE-$COUNT.wav
	echo $NEW
	mv $x $HERE/$NEW
done

COUNT=0

for x in $PWD/GRAPH*;
do
	$((COUNT=$COUNT+1))
	NEW=$TITLE-$COUNT.jpg
	echo $NEW
	mv $x $HERE/$NEW
done

lame -b320 --ta 'Miquel Parera' --tc 'cc-by-sa' --tt $TITLE-1 --tl  $TITLE --tn 1/4 --ty `date +"%Y"` --ti $HERE/$TITLE-1.jpg $HERE/$TITLE-1.wav $HERE/$TITLE-1.mp3

sleep 1

lame -b320 --ta 'Miquel Parera' --tc 'cc-by-sa' --tt $TITLE-2 --tl  $TITLE --tn 2/4 --ty `date +"%Y"` --ti $HERE/$TITLE-2.jpg $HERE/$TITLE-2.wav $HERE/$TITLE-2.mp3

sleep 1

lame -b320 --ta 'Miquel Parera' --tc 'cc-by-sa' --tt $TITLE-3 --tl  $TITLE --tn 3/4 --ty `date +"%Y"` --ti $HERE/$TITLE-3.jpg $HERE/$TITLE-3.wav $HERE/$TITLE-3.mp3

sleep 1

lame -b320 --ta 'Miquel Parera' --tc 'cc-by-sa' --tt $TITLE-4 --tl  $TITLE --tn 4/4 --ty `date +"%Y"` --ti $HERE/$TITLE-4.jpg $HERE/$TITLE-4.wav $HERE/$TITLE-4.mp3

sox $HERE/$TITLE-1.wav -C 8 $HERE/$TITLE-1.flac
id3v2 -a 'Miquel Parera' -c 'cc-by-sa' -t $TITLE-1 -A $TITLE -T 1/4 -y `date +"%Y"` $HERE/$TITLE-1.flac

sox $HERE/$TITLE-2.wav -C 8 $HERE/$TITLE-2.flac
id3v2 -a 'Miquel Parera' -c 'cc-by-sa' -t $TITLE-2 -A $TITLE -T 2/4 -y `date +"%Y"` $HERE/$TITLE-2.flac

sox $HERE/$TITLE-3.wav -C 8 $HERE/$TITLE-3.flac
id3v2 -a 'Miquel Parera' -c 'cc-by-sa' -t $TITLE-3 -A $TITLE -T 3/4 -y `date +"%Y"` $HERE/$TITLE-3.flac

sox $HERE/$TITLE-4.wav -C 8 $HERE/$TITLE-4.flac
id3v2 -a 'Miquel Parera' -c 'cc-by-sa' -t $TITLE-4 -A $TITLE -T 4/4 -y `date +"%Y"` $HERE/$TITLE-4.flac

for x in $HERE/*.flac;
do
	mv $x $HERE/$DIRFLAC
done

for x in $HERE/*.mp3;
do
	mv $x $HERE/$DIRMP3
done

for x in $HERE/*.jpg;
do
	cp $x $HERE/$DIRFLAC
done

for x in $HERE/*.jpg;
do
	mv $x $HERE/$DIRMP3
done

rm $HERE/$TITLE-1.wav
rm $HERE/$TITLE-2.wav
rm $HERE/$TITLE-3.wav
rm $HERE/$TITLE-4.wav

exit 0


