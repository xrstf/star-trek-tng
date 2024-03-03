@echo off

cd losslesscut
llc-chapter-converter -format=vorbis .
llc-chapter-converter -format=matroska .

rem mv *.txt vorbis
for %%x in (*.txt) do move "%%x" ..\chapters\vorbis\

rem mv *.xml matroska
for %%x in (*.xml) do move "%%x" ..\chapters\matroska\

rem cp *.llc edl
for %%x in (*.llc) do copy "%%x" ..\edl\

cd ..

cd edl
llc-to-edl .
for %%x in (*.llc) do del "%%x"

cd ..
