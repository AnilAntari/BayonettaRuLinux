#!/usr/bin/env bash

[ -x "$(command -v bsdtar)" ] && TAR="bsdtar" || TAR="tar"

echo '
--------------------------
|                        |
|                        |
|  Bayonetta Ru Linux    |
|                        |
|                        |
--------------------------
'

VER="1.0"

LINK="https://github.com/AnilAntari/BayonettaRuLinux/releases/download/$VER/generic.tar.gz"
GAMEPATH="$HOME/.local/share/Steam/steamapps/common/Bayonetta"

[ -d "$GAMEPATH" ] && {
	echo "Игра была найдена в ${GAMEPATH}"
} || {
	read -rp "Игра не была найдена в $GAMEPATH, укажите путь к игре: " GAMEPATH
	[ -d "$GAMEPATH" ] || { echo "Игра не была найдена в $GAMEPATH, выход " ; exit 1 ; }
}

echo "Загрузка"
wget "$LINK"

$TAR -xzvf generic.tar.gz

xdelta3 -d -f -s $GAMEPATH/data/data00_jp.cpk generic/data00_jp.cpk.delta $GAMEPATH/data/data00_jp_RUS.cpk
rm $GAMEPATH/data/data00_jp.cpk
mv $GAMEPATH/data/data00_jp_RUS.cpk $GAMEPATH/data/data00_jp.cpk
chmod 775 $GAMEPATH/data/data00_jp.cpk

xdelta3 -d -f -s $GAMEPATH/data/data00_us.cpk generic/data00_us.cpk.delta $GAMEPATH/data/data00_us_RUS.cpk
rm $GAMEPATH/data/data00_us.cpk
mv $GAMEPATH/data/data00_us_RUS.cpk $GAMEPATH/data/data00_us.cpk
chmod 775 $GAMEPATH/data/data00_us.cpk

xdelta3 -d -f -s $GAMEPATH/data/data01.cpk generic/data01.cpk.delta $GAMEPATH/data/data01_RUS.cpk
rm $GAMEPATH/data/data01.cpk
mv $GAMEPATH/data/data01_RUS.cpk $GAMEPATH/data/data01.cpk
chmod 755 $GAMEPATH/data/data01.cpk

xdelta3 -d -f -s $GAMEPATH/data/data02.cpk generic/data02.cpk.delta $GAMEPATH/data/data02_RUS.cpk
rm $GAMEPATH/data/data02.cpk
mv $GAMEPATH/data/data02_RUS.cpk $GAMEPATH/data/data02.cpk
chmod 755 $GAMEPATH/data/data02.cpk

xdelta3 -d -f -s $GAMEPATH/data/data03.cpk generic/data03.cpk.delta $GAMEPATH/data/data03_RUS.cpk
rm $GAMEPATH/data/data03.cpk
mv $GAMEPATH/data/data03_RUS.cpk $GAMEPATH/data/data03.cpk
chmod 755 $GAMEPATH/data/data03.cpk

xdelta3 -d -f -s $GAMEPATH/data/data10.cpk generic/data10.cpk.delta $GAMEPATH/data/data10_RUS.cpk
rm $GAMEPATH/data/data10.cpk
mv $GAMEPATH/data/data10_RUS.cpk $GAMEPATH/data/data10.cpk
chmod 755 $GAMEPATH/data/data10.cpk

xdelta3 -d -f -s $GAMEPATH/data/data11.cpk generic/data11.cpk.delta $GAMEPATH/data/data11_RUS.cpk
rm $GAMEPATH/data/data11.cpk
mv $GAMEPATH/data/data11_RUS.cpk $GAMEPATH/data/data11.cpk
chmod 755 $GAMEPATH/data/data11.cpk

xdelta3 -d -f -s $GAMEPATH/data/data12.cpk generic/data12.cpk.delta $GAMEPATH/data/data12_RUS.cpk
rm $GAMEPATH/data/data12.cpk
mv $GAMEPATH/data/data12_RUS.cpk $GAMEPATH/data/data12.cpk
chmod 755 $GAMEPATH/data/data12.cpk

xdelta3 -d -f -s $GAMEPATH/data/data13.cpk generic/data13.cpk.delta $GAMEPATH/data/data13_RUS.cpk
rm $GAMEPATH/data/data13.cpk
mv $GAMEPATH/data/data13_RUS.cpk $GAMEPATH/data/data13.cpk
chmod 755 $GAMEPATH/data/data13.cpk

rm -r generic && rm generic.tar.gz

echo "Готово"
