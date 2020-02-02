mkdir coinevo$1
cd coinevo$1
ln -s ../coinevonet coinevonet$1
cp ../coinevonet.ini .
nano coinevonet.ini
cd ..
echo "killall -9 coinevonet$1" >> ../stop.sh
