# Chuckie Egg game disassembly

A disassembly of the classic 8-bit computer game [Chuckie Egg](https://en.wikipedia.org/wiki/Chuckie_Egg), released in 1983 for the 48K [ZX Spectrum](http://en.wikipedia.org/wiki/ZX_Spectrum).

[This W.I.P. disassembly](https://github.com/mrcook/chuckie-egg-disassembly/) has been created from the raw binary data of the original ZX Spectrum cassette tape, using the [SkoolKit](http://skoolkit.ca) Spectrum game disassembly toolkit.


## The Game

Chuckie Egg is an addictive platformer in which you have to navigate your hero, Hen-House Harry, around each level collecting all 12 eggs, and as much corn as you can, all while avoiding the nasty ostriches and crazy duck.

    Who'd  have  thought  a  country  farmyard
    could be so stressful? You must collect the
    eggs  before the nasties get out and eat up
    all your  corn. Watch  out  for  the  crazy
    duck -- if she gets out of the cage, you're
    in real trouble!

The game consists of eight unique levels, which rotate indefinitely.

After completing all 8 levels you play them again while being pursued by the giant uncaged duck - thankfully there are no ostriches around for this run. If you make it to the third pass, then both the ostriches and duck are after you! There are additional ostriches to contend with for the fourth pass, and finally for the fifth time, the duck and ostriches move at a greater speed.

Once you complete all 40 levels, you get to replay the last eight indefinitely.

Chuckie Egg was designed and developed by Nigel Alderton, and published by A&F Software in 1984.


## Project Completeness

This is very much a **Work In Progress** effort.

- I believe all the data/code blocks have been split correctly.
- All text data has been annotated.
- Most graphics have been annotated (tiles, sprites, fonts, etc.).
- A good number of variables are understood and annotated (player lives, egg count, the farmers X/Y position, etc.) - but more work needs to be done here.
- The levels are annotated.
- Various buffers (levels, sprite animation) are annotated.
- Data for the two tunes (intro, death) are annotated.
- Many of the routines are either known, or I have a good idea of what they do. Some have detailed annotations, but plenty don't yet.


## Copyright Information

Chuckie Egg is copyright (c) 1984 A&F Software.

This disassembly is copyright (c) 2018 Michael R. Cook.
