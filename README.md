# Star Trek TNG Chapters

This repository is based around my backup of my
[Star Trek: The Next Generation](https://en.wikipedia.org/wiki/Star_Trek:_The_Next_Generation) BluRays.
It primarily contains chapter information that I manually enhanced.

## TL;DR

Download this and use the `.edl` files with mpv to play your local Star Trek files, without
ever having to re-watch the intro/outro ever again!

## Why?

I like to watch Star Trek. It's my kind of ASMR while working or having a nap on the
couch. Star Trek is a mostly quiet SciFi show, perfect for unobtrusive background noise.

However, the _intros_ are very, very loud. And if you're binge watching, also kind of
repetitive. But most importantly they are distractiling loud, with the Enterprise swooshing
and zooming through space and the music swelling more and more in the background.

To add insult to injury, Netflix's intro-skip functionality was, for some unknown reason,
set to jump 2 seconds before the end of each intro, right into the loudest part of it.

So I was looking for a way to auto-skip the intros and outros and so I built this.

## How?

* Buy the Star Trek BluRay box sets.
* (optional: cancel your Netflix subscription)
* Use [MakeMKV](https://makemkv.com/) to rip every disk to your storage of choice.
  This leaves you with 1 `.mkv` file per episode.
* Use [Handbrake](https://handbrake.fr/) to shrink down the video files to save on storage space.
  Make sure Handbrake keeps the chapter information in the video files.

Now you have all episodes with the original chapters, set by some guy/girl somewhere at Paramount.
Each episode has a number of chapter markers, but there is one important marker missing: the
beginning of each intro.

So I manually went to add this marker to every episode:

* Use [lossless-cut](https://github.com/mifi/lossless-cut) to open each file.
* Nagivate to the moment the intro starts.
* Split the current segment. Name the first part "Chapter 1" and the intro part "Intro".
* Rename the last segment to "Outro".

This left me with 1 `.llc` file per `.mkv` file. All of these are in `losslesscut/`.

I then hacked together a bunch of Go programs that took these llc files and converted them to
Matroska chapters (see `chapters/matroska/`). These were then embedded into the `.mkv` files,
so now every episode has effectively 1 additional chapter marker (for the beginning of the intro).

Another Go program then generated `.edl` files, one per episode, that instructs mpv, my media
player, to skip over the unwanted segments.

And that's it! Now instead of adding the `.mkv` files to my playlist or double clicking on them,
just use the `.edl` files instead. And enjoy Star Trek even more :-)
