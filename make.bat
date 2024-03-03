@echo off

cd losslesscut
llc-chapter-converter -format=vorbis .
llc-chapter-converter -format=matroska .

rem mv *.txt vorbis
for %%x in (*.txt) do move "%%x" ..\vorbis\

rem mv *.xml matroska
for %%x in (*.xml) do move "%%x" ..\matroska\

cd ..
