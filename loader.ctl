> $5ccb ; Game loader disassembly for Chuckie Egg
> $5ccb ; (https://github.com/mrcook/chuckie-egg-disassembly/)
> $5ccb ;
> $5ccb ; Copyright (c) 2018-2021 Michael R. Cook (this disassembly)
> $5ccb ; Copyright (c) 1984 A&F Software (Chuckie Egg)
> $5ccb ; Chuckie Egg was designed and developed by Nigel Alderton
> $5ccb ;
> $5ccb ; This is the disassembly of tape block #3: the machine code loader, along with
> $5ccb ; the graphics data for populating the loading screen.
> $5ccb @start
@ $5ccb org=$5ef3
b $5ccb BASIC
D $5ccb 10 RANDOMIZE USR 24307 ($5EF3)
B $5ccb,18,8*2,2
b $5cdd Data block at 5CDD
B $5cdd,6,6
b $5ce3 Data block at 5CE3
B $5ce3,8,8
b $5ceb The big "A" and "F" displayed at top of screen (32x16)
B $5ceb,32,8 #HTML[#UDGARRAY2;$5CEB-$5D0A-8(loading_text_big_a)]
B $5d0b,32,8 #HTML[#UDGARRAY2;$5D0B-$5D2A-8(loading_text_big_f)]
b $5d2b "A&FSOTWRE" logo font characters
B $5d2b,16,8 #HTML[#UDGARRAY1;$5D2B-$5D3A-8(loading_logo_font_01_a)]
B $5d3b,16,8 #HTML[#UDGARRAY1;$5D3B-$5D4A-8(loading_logo_font_02_ampersand)]
B $5d4b,16,8 #HTML[#UDGARRAY1;$5D4B-$5D5A-8(loading_logo_font_03_f)]
B $5d5b,16,8 #HTML[#UDGARRAY1;$5D5B-$5D6A-8(loading_logo_font_04_s)]
B $5d6b,16,8 #HTML[#UDGARRAY1;$5D6B-$5D7A-8(loading_logo_font_05_o)]
B $5d7b,16,8 #HTML[#UDGARRAY1;$5D7B-$5D8A-8(loading_logo_font_06_t)]
B $5d8b,16,8 #HTML[#UDGARRAY1;$5D8B-$5D9A-8(loading_logo_font_07_w)]
B $5d9b,16,8 #HTML[#UDGARRAY1;$5D9B-$5DAA-8(loading_logo_font_08_r)]
B $5dab,16,8 #HTML[#UDGARRAY1;$5DAB-$5DBA-8(loading_logo_font_09_e)]
B $5dbb,16,8 #HTML[#UDGARRAY1;$5DBB-$5DCA-8(loading_logo_font_10_space)]
b $5dcb Copyright symbol for loading screen
B $5dcb,8,8 #HTML[#UDG$5DCB(font_copyright_symbol)]
b $5dd3 "CHUKIEG" logo font characters
B $5dd3,32,8 #HTML[#UDGARRAY2;$5DD3-$5DF2-8(loading_logo_font_c)]
B $5df3,32,8 #HTML[#UDGARRAY2;$5DF3-$5E12-8(loading_logo_font_h)]
B $5e13,32,8 #HTML[#UDGARRAY2;$5E13-$5E32-8(loading_logo_font_u)]
B $5e33,32,8 #HTML[#UDGARRAY2;$5E33-$5E52-8(loading_logo_font_k)]
B $5e53,32,8 #HTML[#UDGARRAY2;$5E53-$5E72-8(loading_logo_font_i)]
B $5e73,32,8 #HTML[#UDGARRAY2;$5E73-$5E92-8(loading_logo_font_e)]
B $5e93,32,8 #HTML[#UDGARRAY2;$5E93-$5EB2-8(loading_logo_font_g)]
b $5eb3 Broken egg shell graphics data for loading screen
B $5eb3,32,8 #HTML[#UDGARRAY2;$5EB3-$5ED2-8(loading_screen_broken_egg_up)]
B $5ed3,32,8 #HTML[#UDGARRAY2;$5ED3-$5EF2-8(loading_screen_broken_egg_right)]
c $5ef3 Display the loading screen
C $5ef5,3 Set border (SYSVAR_BORDCR) to $07 (white)
C $5ef8,3 Point #REGhl to the end of ATTRIBUTE_FILE
C $5efb,3 Set #REGbc to $6912 (size of DISPLAY + ATTR)
C $5efe,8 Blank the entire screen
N $5f09 Display the loading screen text
C $5f0d,3 Point #REGde to start of LOADING_SCREEN_DATA area
N $5f20 Add the loading screen colour attributes
C $5f20,3 Point #REGhl to start of ATTRIBUTE_FILE.
c $5f9e Load the error jump routine
C $5f9e,4 Set #REGix to SYSVAR_ERR_SP address
c $5fab Load the rest of the tape and start the game.
N $5fb5 Interesting Note: POKE loaders run the game from here
C $5fb5,3 Continue loading the game from TAPE?
c $5fb8 Run the game
C $5fbb,3 Updates SYSVAR_STKBOT with address $5DC0
C $5fbe,3 Updates SYSVAR_STKEND with address $5DC0
C $5fc1,3 START the game!
c $5fc4 Fill screen area pointed to by #REGhl with value in #REGa
D $5fc4 Used by the routine at #R$5EF3.
R $5fc4 Input: HL attribute address
R $5fc4 A attribute value used for fill
R $5fc4 B length
c $5fc9 Print a character
D $5fc9 Routine at 5FC9
R $5fc9 Used by the routine at #R$5EF3.
C $5fcf,3 Point #REGhl to DISPLAY_FILE
C $5fd2,3 Set #REGbc to 2048 (1/3 of screen)
b $601c Start of data for the loading screen
@ $601c label=LOADING_SCREEN_DATA
B $601c,160,16
t $60bc "IS LOADING" text message
T $60bc,64,32
b $60fc Data block at 60FC
B $60fc,32,16
t $611c Instructions for direction keys
T $611c,160,32
b $61bc Data block at 61BC
B $61bc,32,16
t $61dc Instructions about redefining keys
T $61dc,160,32
b $627c Data block at 627C
B $627c,32,16
t $629c Instructions for hold/abort keys
T $629c,96,32
b $62fc Data block at 62FC
B $62fc,32,16
b $631c Data block at 631C
B $631c,7,7
i $6323