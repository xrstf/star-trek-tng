@echo off

llc-chapter-converter -format=vorbis .

rem mv *.txt vorbis
for %%x in (*.txt) do move "%%x" vorbis