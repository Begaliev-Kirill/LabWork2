# LabWork2
## Author
Begaliev Kirill Evgenievich, 24.B82-mm <br>
st129977@student.spbu.ru , tg: @silly_kat
## Description
For now only 4 classes for start develop the game, GameManager prints 10 nullCards for test functions and interactions
## Build
### Program
Builds project and tests that automatically starts
```bash
make && make test
```
### Documentation by doxygen and file with depends (actually uses for makefile, but you can check it if you want to)
```bash
doxygen && make depend
```
## Run
#### Run program
```bash
./bin/game
```
#### Run tests (more than one time after building)
```bash
./testbin/test-game
```
#### Open documentation by doxygen
https://Begaliev-Kirill.github.io/LabWork2/
or use this comands:
```bash
doxygen
export GTK_MODULES=""
xdg-open docs/doxygen/index.html
```
## Cleaning
#### Delete only created files
```bash
make clean
```
#### Delete doxygen's documentation and depends
```bash
make cleandocs
```
#### Delete all created and compiled files
```bash
make cleanall
```
