; SkoolKit disassembly for Chuckie Egg
; (https://github.com/mrcook/chuckie-egg-disassembly/)
;
; Copyright (c) 2018 Michael R. Cook (this disassembly)
; Copyright (c) 1984 A&F Software (Chuckie Egg)
; Chuckie Egg was designed and developed by Nigel Alderton
@ $61A8 start
@ $61A8 org=$A410
b $61A8 Level Buffer
D $61A8 Screen map data is copied to this buffer at the start of each new level. Each byte represents a tile ID, with 20 tile GFX in total. #TABLE(default,centre,:w) { =h Byte | =h Tile } { 00 | Blank Tile } { 01 | Ladder #1 (left) } { 02 | Ladder #2 (right) } { 03 | Egg } { 04 | Corn } { 05 | Floor } { A8 | Birdcage: handle #1 } { A9 | Birdcage: handle #2 } { AA | Birdcage: #01 (top) } { AB | Birdcage: #02 (top) } { AC | Birdcage: #03 (top) } { AD | Birdcage: #04 (top) } { AE | Birdcage: #05 (middle) } { AF | Birdcage: #06 (middle) } { B0 | Birdcage: #07 (middle) } { B1 | Birdcage: #08 (middle) } { B2 | Birdcage: #09 (bottom) } { B3 | Birdcage: #10 (bottom) } { B4 | Birdcage: #11 (bottom) } { B5 | Birdcage: #12 (bottom) } TABLE#
@ $61A8 label=LEVEL_BUFFER
  $61A8,672,32
s $6448 This area is unused for gameplay, although it was used during game loading.
b $6EC8 Buffer releated to ANIMBUF1?
b $6EC9
b $6ECA
b $6ECB
b $6ECC
b $6ECD
b $6ECE Animation Buffer #1
D $6ECE Buffer used for animating a sprite (?)
@ $6ECE label=ANIMBUF1
b $6EE6 Current player cleared eggs counter
D $6EE6 Copied from the current player variable on level start, saved to the player variable on dying.
@ $6EE6 label=CUR_EGG_COUNT
b $6EE7 Save cleared eggs count for player 1.
@ $6EE7 label=P1_EGG_COUNT
b $6EE8 Save cleared eggs count for player 2.
@ $6EE8 label=P2_EGG_COUNT
b $6EE9 Save cleared eggs count for player 3.
@ $6EE9 label=P3_EGG_COUNT
b $6EEA Save cleared eggs count for player 4.
@ $6EEA label=P4_EGG_COUNT
b $6EEB Current player cleared levels counter
D $6EEB Copied from the current player variable on level start, saved to the player variable on dying.
@ $6EEB label=CUR_LEVEL_COUNT
b $6EEC Save levels cleared count for player 1.
@ $6EEC label=P1_LEVEL_COUNT
b $6EED Save levels cleared count for player 2.
@ $6EED label=P2_LEVEL_COUNT
b $6EEE Save levels cleared count for player 3.
@ $6EEE label=P3_LEVEL_COUNT
b $6EEF Save levels cleared count for player 4.
@ $6EEF label=P4_LEVEL_COUNT
b $6EF0 Remaining lives for player 1.
@ $6EF0 label=P1_LIVES
b $6EF1 Remaining lives for player 2.
@ $6EF1 label=P2_LIVES
b $6EF2 Remaining lives for player 3.
@ $6EF2 label=P3_LIVES
b $6EF3 Remaining lives for player 4.
@ $6EF3 label=P4_LIVES
s $6EF4 Unused by game.
b $72A0 Animation Buffer #2
D $72A0 Buffer used for animating a sprite (?)
@ $72A0 label=ANIMBUF2
b $72D8 Farmer's current X,Y position
@ $72D8 label=POSITION
b $72DA Possibly unused data block.
b $72DD Animation Buffer #3
D $72DD Buffer used for animating a sprite?
@ $72DD label=ANIMBUF3
b $7325
b $7326
b $7327
b $7328
b $7329
b $732A
b $732B
b $732C A variable possibly releated to SCR_STATE below
D $732C Some possible values (guesses) are given in the table below: #TABLE(default,centre,:w) { =h Byte | =h meaning } { 00 | ?? } { 03 | ?? } { 04 | ?? } { 09 | ?? } { 4E | ?? } { 57 | ?? } { nn+09 | ?? } TABLE#
b $732D Current game/screen state (maybe)
D $732D Some possible values (guesses) are given in the table below: #TABLE(default,centre,:w) { =h Byte | =h state } { 03 | Redefine keys screen/input type selected } { 06 | Play Music } { 0A | Instructions screen } TABLE#
@ $732D label=SCR_STATE
b $732E Keyboard address for the UP key: row address+1
@ $732E label=KEY_UP
b $7330 Keyboard address for the DOWN key: row address+1
@ $7330 label=KEY_DOWN
b $7332 Keyboard address for the LEFT key: row address+1
@ $7332 label=KEY_LEFT
b $7334 Keyboard address for the RIGHT key: row address+1
@ $7334 label=KEY_RIGHT
b $7336 Keyboard address for the JUMP key: row address+1.
@ $7336 label=KEY_JUMP
b $7338 Another keyboard address??
b $733A Total number of players for the current game?
D $733A Possible values are 1, 2, 3, and 4.
@ $733A label=NUMBER_OF_PLAYERS
b $733B Current active player.
D $733B Possible values are 1, 2, 3, and 4.
@ $733B label=CURRENT_PLAYER
b $733C
b $733E
b $733F
b $7343
b $7345 Time remaining for level
D $7345 This may not be correct!
@ $7345 label=TIME_REMAINING
b $7346 Bonus remaining for level
D $7346 This may not be correct!
@ $7346 label=BONUS_REMAINING
b $7347
b $7348
b $7349
b $734A
b $734B
b $734C
b $734E
b $7352
b $7353
b $7354
b $7355
b $7357 Possibly 20 bytes from this address are used
s $7359 These are probably used.
b $736B
b $736C stores a 2 byte value
b $736E
b $736F Music play state
D $736F Strange that 00 means "play music" - probably need a more appropriate label. #TABLE(default,centre,:w) { =h Byte | =h state } { 00 | play } { 01 | stopped } TABLE#
@ $736F label=MUSIC_PLAY_STATE
b $7370
b $7371
b $7373
b $7374
s $7375 Unused
b $8223
s $8225 Really unused?
b $8231
s $8233 Really unused?
b $8250 These bytes are copied to @732E
b $825C These bytes are copied to @732E
b $8268 These bytes are copied to @732E
s $8274 Really unused?
t $8336 Ticker text
D $8336 'press R to redefine keys * press S to start game * press 1, 2 or 3 to select key type'
@ $8336 label=MSG_TICKER
t $8390 Instructions screen redefine keys text
D $8390 'key types 1 & 2 are present and' 'cannot be changed but the type 3' 'keys are user defineable.      '
@ $8390 label=MSG_REDEFINE_TEXT
t $83F0 Instructions screen key types table
@ $83F0 label=MSG_KEY_TYPES
  $83F0,96,32
b $8450 Unused data block?
t $847E Instructions screen KEYS heading
D $847E 'KEYS'
@ $847E label=MSG_KEYS_HEADING
s $8482 Unused
t $849B Instructions screen objective text
D $849B 'objective- to collect eggs from the hen-house.'
@ $849B label=MSG_INSTRUCTIONS_OBJECTIVE
s $84CF Unused
t $84DA Instructions screen heading
D $84DA 'INSTRUCTIONS'
@ $84DA label=MSG_INSTRUCTIONS_HEADING
b $84E6
b $84F0 Blank tile graphic
D $84F0 address from which the following graphics are accessed.
@ $84F0 label=GFX_TILE_BLANK
b $84F8 Ladder tile graphic (16x8)
D $84F8 #HTML[#UDGARRAY2;$84F8-$8507-8(gfx_tile_ladder)]
@ $84F8 label=GFX_TILE_LADDER
b $8508 Egg item graphic
D $8508 #HTML[#UDG$8508(gfx_item_egg)]
@ $8508 label=GFX_ITEM_EGG
b $8510 Corn item graphic
D $8510 #HTML[#UDG$8510(gfx_item_corn)]
@ $8510 label=GFX_ITEM_CORN
b $8518 Floor tile graphic
D $8518 #HTML[#UDG$8518(gfx_tile_floor)]
@ $8518 label=GFX_TILE_FLOOR
b $8520 Unknown ad unused?
b $8548 "SCORE" label graphic (24x8)
D $8548 #HTML[#UDGARRAY3;$8548-$855F-8(labels_score)]
@ $8548 label=GFX_LABEL_SCORE
b $8560 "PLAYER" label graphic (32x8)
D $8560 #HTML[#UDGARRAY4;$8560-$857F-8(labels_player)]
@ $8560 label=GFX_LABEL_PLAYER
b $8580 "TIME" label graphic (24x8)
D $8580 #HTML[#UDGARRAY3;$8580-$8597-8(labels_time)]
@ $8580 label=GFX_LABEL_TIME
b $8598 "A+F SOFTWARE" logo text (48x8)
D $8598 #HTML[#UDGARRAY6;$8598-$85C7-8(labels_af_software)]
@ $8598 label=GFX_TEXT_AFSOFTWARE
b $85C8 "BONUS" label graphic (24x8)
D $85C8 #HTML[#UDGARRAY3;$85C8-$85DF-8(labels_bonus)]
@ $85C8 label=GFX_LABEL_BONUS
b $85E0 "LE" text (8x8) - unknown usage
D $85E0 #HTML[#UDGARRAY3;$85E0-$85E7-8(labels_le)]
@ $85E0 label=GFX_TEXT_LE
b $85E8 Unused?
b $85F0 Font: A-Z, numbers, punctuation, and other symbols.
D $85F0 #HTML[#FONT:( !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ)$85F0(font_complete)]
@ $85F0 label=FONT_ALL
s $87C8 Unused font space?
b $87F8 Font: A-Z bold
D $87F8 #HTML[#FONT:(ABCDEFGHIJKLMNOPQRSTUVWXYZ)$87F8(font_az_bold)]
@ $87F8 label=FONT_AZ_BOLD
b $88C8 Font: Bullet point graphic
D $88C8 Used to separate the scrolling ticker text: Start, Redefine, Insturctions. #HTML[#UDG$88C8(font_gfx_bullet)]
@ $88C8 label=FONT_BULLET_POINT
s $88D0 Unused font space?
b $88E0 Font: Registered symbol graphic
D $88E0 #HTML[#UDG$88E0(font_gfx_registered_symbol)]
@ $88E0 label=FONT_REGISTERED_SYMBOL
b $88E8 Font: Copyright symbol graphic
D $88E8 #HTML[#UDG$88E8(font_gfx_copyright_symbol)]
@ $88E8 label=FONT_COPYRIGHT_SYMBOL
b $88F0 Unknown graphics/data
b $8968 "A+F CHUCKIE EGG" text graphic
D $8968 Use as the default name in the high score table. #HTML[#UDGARRAY8;$8968-$89A7-8(text_highscore_default_name)]
@ $8968 label=GFX_TEXT_HIGHSCORE_DEFAULT_NAME
b $89A8 Font: Abbreviations for SP, CS, SS, EN (32x8)
D $89A8 #HTML[#UDGARRAY4;$89A8-$89C7-8(font_gfx_abbreviations)]
@ $89A8 label=FONT_ABBREVIATION_SYMBOLS
b $89C8 "LEVEL" label graphic (24x8)
D $89C8 #HTML[#UDGARRAY3;$89C8-$89DF-8(labels_level)]
@ $89C8 label=GFX_LABEL_LEVEL
b $89E0 Font: Numbers bold (used in the scores, level, etc.)
D $89E0 #HTML[#FONT:(0123456789)$89E0(font_numbers_bold)]
@ $89E0 label=FONT_NUMBERS_BOLD
b $8A30 Birdcage handle graphic tiles (16x8)
D $8A30 #HTML[#UDGARRAY2;$8A30-$8A3F-8(level_gfx_birdcage_handle)]
@ $8A30 label=GFX_TILE_BIRDCAGE_HANDLE
b $8A40 Birdcage graphic tiles (32x24)
D $8A40 #HTML[#UDGARRAY4;$8A40-$8A9F-8(level_gfx_birdcage)]
@ $8A40 label=GFX_TILE_BIRDCAGE
b $8AA0 Player "lives" icon graphic
D $8AA0 #HTML[#UDG$8AA0(level_gfx_lives_counter)]
@ $8AA0 label=GFX_ICON_LIVES
b $8AA8 High score table "cursor" icon graphic
D $8AA8 #HTML[#UDG$8AA8(level_gfx_highscore_cursor)]
@ $8AA8 label=GFX_ICON_HIGHSCORE_CURSOR
b $8AB0 "UP" heading graphic for instructions screen (24x8)
D $8AB0 #HTML[#UDGARRAY3;$8AB0-$8AC7-8(instructions_heading_up)]
@ $8AB0 label=INSTRUCTIONS_HEADING_UP
b $8AC8 "DOWN" heading graphic for instructions screen (24x8)
D $8AC8 #HTML[#UDGARRAY3;$8AC8-$8ADF-8(instructions_heading_down)]
@ $8AC8 label=INSTRUCTIONS_HEADING_DOWN
b $8AE0 "LEFT" heading graphic for instructions screen (24x8)
D $8AE0 #HTML[#UDGARRAY3;$8AE0-$8AF7-8(instructions_heading_left)]
@ $8AE0 label=INSTRUCTIONS_HEADING_LEFT
b $8AF8 "RIGHT" heading graphic for instructions screen (24x8)
D $8AF8 #HTML[#UDGARRAY3;$8AF8-$8B0F-8(instructions_heading_right)]
@ $8AF8 label=INSTRUCTIONS_HEADING_RIGHT
b $8B10 "JUMP" heading graphic for instructions screen (24x8)
D $8B10 #HTML[#UDGARRAY4;$8B10-$8B2F-8(instructions_heading_jump)]
@ $8B10 label=INSTRUCTIONS_HEADING_JUMP
b $8B30 "TYPE" heading graphic for instructions screen (32x8)
D $8B30 #HTML[#UDGARRAY4;$8B30-$8B4F-8(instructions_heading_type)]
@ $8B30 label=INSTRUCTIONS_HEADING_TYPE
s $8B50 Unknown, unused?
b $8DF0 Farmer sprites graphic data (but things are not quite right)
D $8DF0 #HTML[#UDGARRAY1;$8DF0-$8EEF-8(farmer_sprites)]
@ $8DF0 label=SPRITES_FARMER
b $8EF0 Hen sprites graphic data: right with mouth open (8x32)
D $8EF0 #HTML[#UDGARRAY1;$8EF0-$8F0F-8(hen_sprites_right_mouth)]
@ $8EF0 label=SPRITES_HEN_RIGHT_MOUTH
b $8F10 Hen sprites graphic data: right (8x32)
D $8F10 #HTML[#UDGARRAY1;$8F10-$8F2F-8(hen_sprites_right)]
@ $8F10 label=SPRITES_HEN_RIGHT
b $8F30 Hen sprites graphic data: left with mouth open (8x32)
D $8F30 #HTML[#UDGARRAY1;$8F30-$8F4F-8(hen_sprites_left_mouth)]
@ $8F30 label=SPRITES_HEN_LEFT_MOUTH
b $8F50 Hen sprites graphic data: left (8x32)
D $8F50 #HTML[#UDGARRAY1;$8F50-$8F6F-8(hen_sprites_left)]
@ $8F50 label=SPRITES_HEN_LEFT
s $8F70 Unused space?
b $8F90 Farmer sprites graphic data: climbing stairs (but things are not quite right)
D $8F90 #HTML[#UDGARRAY1;$8F90-$900F-8(farmer_sprites_climbing)]
@ $8F90 label=SPRITES_FARMER_WALK
b $9010 Robot Hen sprites graphic data: facing left (8x32)
D $9010 #HTML[#UDGARRAY1;$9010-$902F-8(emu_sprites_left)]
@ $9010 label=SPRITES_ROBOT_HEN_LEFT
b $9030 Robot Hen sprites graphic data: facing right (8x32)
D $9030 #HTML[#UDGARRAY1;$9030-$904F-8(emu_sprites_right)]
@ $9030 label=SPRITES_ROBOT_HEN_RIGHT
b $9050 Robot Hen sprites graphic data: climbing (8x32 x2)
D $9050 #HTML[#UDGARRAY1;$9050-$908F-8(emu_sprites_climbing)]
@ $9050 label=SPRITES_ROBOT_HEN_CLIMBING
b $9090 Robot Hen sprites graphic data: walking left (8x32)
D $9090 #HTML[#UDGARRAY1;$9090-$90AF-8(emu_sprites_left_walk)]
@ $9090 label=SPRITES_ROBOT_HEN_LEFT_WALK
b $90B0 Robot Hen sprites graphic data: walking walk (8x32)
D $90B0 #HTML[#UDGARRAY1;$90B0-$90CF-8(emu_sprites_right_walk)]
@ $90B0 label=SPRITES_ROBOT_HEN_RIGHT_WALK
b $90D0 Some odd graphics/data...unusued?
c $911E Runs from start of level, after everything has been rendered.
  $9128,9 Increment value stored @736C, then set its MSB(?) to $00
  $9133,4 Jump if BIT 0 of the byte stored at address #REGhl is set.
c $9178 Seems to run every loop
  $91C7,4 If bit 1 of the value stored @736C is set, do not jump to @91DF
c $91CB An alt routine @91DF ?
c $91DF An alt routine @91CB ?
c $91F3 Seems to run every loop
  $9237,4 If bit 1 of the value stored @736C is set, do not jump to @9250
c $923B An alt routine to @9250 ?
c $9250 An alt routine to @923B ?
c $9265
  $9265,3 Backup registers
  $9294,3 Pop all to #REGhl rather than #REGde, #REGhl, #REGbc.
c $9298 Routine to restore (POP) all #REGde, #REGhl, #REGbc registers
@ $9298 label=RESTORE_16BIT_REGISTERS
c $929C Update Robot Hens?
  $929C,1 POKE to 201 (`RET`) to vaniquish Robot Hens
c $92C2
c $935F
  $9398,3 set #REGhl to last byte of GFX_TILE_BLANK
c $93DD
  $93E5,3 Point #REGhl to start of ATTRIBUTE_FILE.
c $93FE Backup/restore #REGaf, so routine can be called safely.
c $9404
  $9404,3 Backup #REGaf, #REGde, #REGbc registers
  $9408,3 Load #REGhl with start of DISPLAY_FILE.
  $940B,3 Load #REGbc with value of 2048 (1/3 of screen)
  $9434,3 Restore #REGaf, #REGde, #REGbc registers
c $9438 Save/restore #REGhl so routine can be called safely
b $943E
b $945B Some of these byte are copied to $7357.
c $9538
c $9584
  $958C,3 Point #REGhl to start of ATTRIBUTE_FILE.
c $95A6
s $95C5 Unused?
b $9630 Home screen/high score table text data
D $9630 As displayed after game load, and game over. Note: the screen is loaded bottom to top.
@ $9630 label=HOME_SCREEN
T $964C "by n.alderton"
B $965A
T $9668 "1 to 4 players"
B $9676
T $9685 "of skill for"
B $9691
T $96A4 "a game"
B $96AA
T $973D "presents"
B $9745
T $9756 "A & F SOFTWARE"
b $9764
b $976B
b $976C
b $9772
b $9773
b $9774
b $977A
b $977B
b $977C
b $9784
b $9785
b $9787
t $97AF High score table with name/score columns
D $97AF Probably ranked here 1-10.
@ $97AF label=SCOREBOARD
  $97AF,1,1 start byte?
t $9808 Bottom five of scoreboard
b $984F Unknown/unused bytes.
c $9858
  $9858,3 reads SYSVAR_ERR_SP
  $98DC,10 Called after pressing `CAPSHIFT`, and waiting for keyboard A or H.
c $98E6
  $98EF,1 POKE to 0 (`NOP`) to get infinite TIME
  $98FC,1 POKE to 0 (`NOP`) to make giant duck very slow
  $98FD,2 POKE to 24 (`JR nnnn`) to vaniquish giant duck
  $9925,1 POKE to 0 (`NOP`) to get infinite BONUS
  $9938,1 POKE to `0` (NOP) to slow Robot Hens
  $9958,2 JUMP keypress
  $9975,24 Load bytes into @72D8 + 77, 78, 79, 80, 82, and 125.
c $99DC Jump point
c $99DF
c $9A17
c $9A2C Unused code?
c $9A38 Unused code?
b $9A47 Unused?
c $9A4C
  $9A53,3 set #REGhl=SPRITES_FARMER
  $9A69,16 draw SPRITES_FARMER in ANIMBUF2?
  $9ABB,3 set #REGhl=GFX_TILE_BLANK
  $9B1A,3 Load #REGhl with start of DISPLAY_FILE.
  $9B1D,3 Load #REGbc with value of 2048 (1/3 of screen)
c $9BDE Something to do with updatng colours?
  $9BE6,3 Point #REGhl to start of ATTRIBUTE_FILE.
s $9BFF Unused
c $9C40 Called when needing to draw a level...works on 1/3 of screen at a time?
  $9C40,4 Why are these NOPs? Are they ever changed?
@ $9C40 label=UPDATE_SCREEN_GFX
  $9C44,4 Backup 16-bit registers.
  $9C48,1 #REGa=screen section: $08=2/3, $10=3/3, else 1/3.
  $9C49,1 Backup #REGhl to #REGde#REGhl
  $9C4A,3 point #REGhl to start of DISPLAY
  $9C4D,3 load #REGbc with 2048 - one third of a screen
  $9C50,4 Update 1/3 of screen?
  $9C54,4 Update 2/3 of screen?
  $9C58,1 Update 3/3 of screen.
  $9C7C,1 Restore #REGhl with value in #REGde
  $9C7D,12 set #REGhl to GFX_TILE_BLANK, then update this section of the screen (address of #REGde) with all GFX tiles.
  $9C89,4 Restore 16-bit registers and RETurn
c $9C8E Unused code? Same as last 3 instructions of previous routine, at #R$9C8B.
s $9C91 Unused
c $9C9C INTERUPT jump point
s $9C9F Unused
c $9CA4 This routine produces a sound, formed of a square wave.
@ $9CA4 label=MAKE_SOUND
s $9CB5 Unused
c $9CC2 Called from an INTERUPT, and basically every game loop?
c $9CEB Called during level draw/clear.
s $9D06 Unused
c $9D08
s $9DF1 Unused
c $9E34
c $9E57 Unused code?
s $9E59 Unused
c $9E66 Farmer jumping/falling routine
@ $9E66 label=FARMER_VERTICAL_MOVEMENT
c $9E8A Reset mid-air farmer routine
s $9E8D Unused
c $9E98
  $9ECA,58 UP keypress
  $9F04,59 DOWN keypress
s $9F3F Unused
c $9F60
  $9F8D,17 LEFT/RIGHT keypress
c $9F9E
c $9F9F
c $9FB5
s $9FDF Unused
c $A014
c $A07B Draw the elevator platforms?
@ $A07B label=DRAW_ELEVATOR_PLATFORM
c $A096 Calculate position of next platform?
@ $A096 label=CALCULATE_ELEVATOR_PLATFORM_POSITION
c $A0A9 Calculations related to elevator position?
@ $A0A9 label=CALCULATE_EVELVATOR_POSITION
c $A0C0 Unused code?
D $A0C0 Note same as last instructions of previous routine
b $A0C5 Unused bytes/code?
c $A0C8 Could be giant duck code or another elevator related routine, called after bigger movement of platform.
s $A19A Unused
c $A1B8
c $A1D9
  $A201,16 Display a number from FONT_NUMBERS_BOLD
b $A21A Unused code/bytes? (code would be a RET)
c $A21C Farmer jumping/falling related routine.
c $A22A Farmer jumping/falling related routine.
c $A256 Farmer jumping/falling related routine.
c $A278 Farmer lands on a platform?
c $A294 Farmer jumping/falling related routine.
c $A2B5
c $A30C Farmer jumping/falling related routine.
c $A37F
c $A389 Farmer lands on a platform?
c $A399 Unused code?
c $A3A2 Unused code?
s $A3A5 Unused
c $A3A7 Farmer collects an egg/corn...also at start of level.
  $A3E3,3 UPDATE_SCREEN_GFX
b $A40F Unused?
c $A410 The game has just loaded
@ $A410 label=START
  $A410,5 Set SCR_STATE to "Play Tune" POKE @A411 (the address value) to `003` to mute music notes
  $A415,5 Set MUSIC_PLAY_STATE to "play"
  $A41E,2 Interupt Mode: determine when and what an interrupt does
c $A420 Display the home screen, which includes the scoreboard
D $A420 Note: this routine is very similar to the DISPLAY_SCREEN_INSTRUCTIONS routine.
@ $A420 label=DISPLAY_SCREEN_HOME
  $A420,3 CLEAR_SCREEN
  $A42B,3 UPDATE_SCREEN_GFX
  $A43B,3 DISPLAY_SCOREBOARD
  $A43E,3 Point #REGhl to start of ATTRIBUTE_FILE.
  $A443,7 Print "A & F SOFTWARE" text graphic
  $A44A,7 Print "CHUCKIE EGG (c)" text graphic
  $A451,7 Print "a game of skill..." text graphic
  $A458,3 Point #REGhl to THEME_TUNE data
  $A45B,6 If MUSIC_PLAY_STATE is "stopped" then Jump
  $A461,3 else PLAY_TUNE
  $A469,5 Set MUSIC_PLAY_STATE to "stopped"
c $A46E
  $A46E,10 update some colours
c $A47D Scroll ticker text for home screen
D $A47D Note: this routine is very similar to the first half of SCROLL_TEXT_2 routine.
@ $A47D label=SCROLL_TEXT_1
  $A491,3 Point #REGhl to HOME_SCREEN_TICKER_TEXT
  $A49C,4 Set $732C to `$00`
  $A4A8,3 UPDATE_SCREEN_GFX
  $A4AB,9 Read keyboard and check keypress `S`
  $A4B4,9 Read keyboard and check keypress `R`
  $A4BD,11 Read keyboard and check keypress `I`
c $A4C8 Display the instructions screen
D $A4C8 Note: this routine is very similar to the DISPLAY_SCREEN_HOME routine.
@ $A4C8 label=DISPLAY_SCREEN_INSTRUCTIONS
  $A4C8,3 CLEAR_SCREEN
  $A4D3,3 UPDATE_SCREEN_GFX
  $A4E4,3 Point #REGhl to start of ATTRIBUTE_FILE.
  $A4E9,7 Print intructions headings
  $A4F0,7 Print "KEYS" box
  $A4F7,7 Print "KEY TYPES" text
  $A4FE,7 I saw nothing change visually on the screen.
  $A505,5 Set $732C to `$57`
  $A50A,3 Set SCR_STATE to $0A - Instructions screen?
c $A515 Scroll ticker text for instructions screen
D $A515 Note: first half of this routine is very similar SCROLL_TEXT_1 routine.
@ $A515 label=SCROLL_TEXT_2
  $A529,3 Point #REGhl to INSTRUCTIONS_SCREEN_TICKER_TEXT
  $A534,4 Set $732C to `$00`
  $A540,3 UPDATE_SCREEN_GFX
  $A54A,9 Read keyboard and check keypress (for what?)
  $A553,9 Read keyboard and check keypress (for what?)
  $A55C,10 Read keyboard row 1..5 (on instructions screen?)
c $A566 Highlight the "input type" line # 1, 2, or 3.
  $A566,1 #REGb also saved to SCR_STATE later, at $A57D
  $A567,6 Check the current SCR_STATE
  $A56D,3 Input type #1
  $A574,3 Input type #2
  $A579,3 Input type #3
  $A57D,3 Update SCR_STATE with
  $A582,3 Input type #1
  $A587,3 Input type #2
  $A58C,3 Input type #3
c $A59D Initialize a new game
D $A59D Routine to start a new game, first asking for number of players!
@ $A59D label=INIT_GAME
  $A5A3,14 Clear the entire DISPLAY_FILE
  $A5B9,3 Point #REGde to CHOOSE_NUMBER_OF_PLAYERS_TEXT
  $A5BE,21 Scroll text onto screen? vertical-middle of DISPLAY_FILE
  $A5D3,10 Input to get NUMBER_OF_PLAYERS for this game
  $A5DD,7 INCrement #REGb until it equals #REGa; the NUMBER_OF_PLAYERS
  $A5E4,1 NUMBER_OF_PLAYERS (#REGl) = #REGb
  $A5E5,2 CURRENT_PLAYER (#REGh) = $01
  $A5E7,3 Set total and current player(s). Note: $733B is CURRENT_PLAYER
  $A5EA,10 scroll text off screen
  $A5F6,3 Load #REGde with LEVEL_BUFFER address.
  $A5F9,3 Load #REGbc with size of level data.
  $A5FC,3 Point #REGh; to LEVEL_1 address.
  $A5FF,2 Copy level data.
  $A601,3 Why repeat the copy 5 times?
  $A604,10 Reset anim buffer data at $6EC8 (6 bytes) + ANIMBUF1 (24 bytes)
  $A60E,7 Reset all egg counters to $0C (12...why?): from address $6EE6 for 5 bytes
  $A615,7 Reset all cleared levels counters: from address $6EEB for 5 bytes
  $A61C,7 Reset all player lives to 5: from address $6EF0 for 4 bytes
c $A62C
  $A62C,3 NUMBER_OF_PLAYERS
  $A632,19 Does some stuff with CURRENT_PLAYER value
  $A647,3 #REGde points to address for "player 1" text
  $A672,3 POKE @A672 to 202 (`JP Z`) to jump to next level on death
  $A6A1,3 CURRENT_PLAYER
  $A6D9,3 #REGde is loaded with "level " text
  $A6E1,3 Load #REGde with LEVEL_BUFFER address
  $A6E4,3 Load #REGbc with value of 672 (size of level data)
  $A6E7,3 NOTE: $B110 is not read from. First, 672 is added to the address.
  $A6F0,1 $B110 + $02A0 = LEVEL_1 address, which is where the reading starts.
c $A6FE Farmer has died!
@ $A6FE label=KILL_FARMER
  $A701,3 PLAY_TUNE
  $A710,3 CLEAR_SCREEN
  $A725,3 Point #REGde to OUT_OF_TIME_TEXT
  $A72D,18 copy LEVEL data to LEVEL_BUFFER
  $A73F,3 CURRENT_PLAYER
  $A755,1 POKE to 182 (`OR (HL)`) to get infinite LIVES
  $A762,3 Point #REGde to GAME_OVER_TEXT
  $A773,3 CURRENT_PLAYER
  $A797,3 CURRENT_PLAYER
  $A7A7,3 CURRENT_PLAYER
  $A7AA,15 copy LEVEL data to LEVEL_BUFFER
c $A7BC Related to animation #1
  $A7C2,11 Point #REGhl to DISPLAY_FILE and reset first 18 bytes
  $A7D6,12 Increment value in (#REGhl) by $30 for 24 bytes.
  $A7FF,10 check if a score has been entered on scoreboard?
c $A80C Called before loading main screen or highscores?
c $A828 Player enters their name on the highscore table?
@ $A828 label=ENTER_NEW_HIGH_SCORE_NAME
  $A83B,8 Seems to move a highscore to different position. NOTE: LDDR decrements HL/DE, unlike LDIR, which increments them
  $A844,7 Does this clear the name for the selected highscore?
  $A859,3 Point #REGde to NEW_HIGH_SCORE_TEXT
  $A862,3 UPDATE_SCREEN_GFX
  $A86D,3 DISPLAY_SCOREBOARD
  $A870,3 Point #REGhl to start of ATTRIBUTE_FILE.
  $A873,9 Highlight the "Player 1" text in magenta ($03)
  $A87C,6 Highlight the "well done..." message in green (INC A = $04)
  $A882,5 Highlight the "enter initials..." message in red ($02)
  $A8A6,3 UPDATE_SCREEN_GFX
  $A8A9,3 reads SYSVAR_KSTATE_4
  $A8B1,3 reads SYSVAR_KSTATE_4
  $A8B8,3 reads SYSVAR_LAST_K (newly pressed key)
  $A8CB,3 UPDATE_SCREEN_GFX
  $A8DD,3 UPDATE_SCREEN_GFX
c $A8EC Animated transition
@ $A8EC label=TRANSITION_ANIMATION
c $A921 Possible pause routine
@ $A921 label=PAUSE_ROUTINE
c $A929 Animated transition #1 (1 square)
  $A93B,3 Set $732C to `$03`
c $A960 Called when farmer dies
  $A965,2 POKE @A965 to 0 (`NOP`) and @A966 to 201 (`RET`) to prevent music from being player
c $A968 Animated transition #2 (4 squares)
  $A96B,5 Set $732C to `$09`
  $A9C5,5 Set $732C to `$04`
c $A9CE Prepare to scroll GAME OVER message
  $A9CE,10 Update some attribute colours to $04
  $A9DA,3 Point #REGhl to vertical middle of screen
  $A9DD,3 SCROLL_TICKER_TEXT
  $A9E7,3 UPDATE_SCREEN_GFX
  $A9F1,3 Point #REGhl to vertical middle of screen
  $A9F4,3 SCROLL_TICKER_TEXT
c $A9FA Animated transition after death...related to animation #1
  $AA00,8 Increment value at $732C by `$09`.
c $AA0C
c $AA23 Called during animation #1
  $AA26,3 Point #REGhl to start of PRINTER_BUFFER...why?
c $AA37 Prints a text block to the screen.
@ $AA37 label=PRINT_TEXT
c $AA49 Redefine keys wizard - read new keys
@ $AA49 label=REDEFINE_KEYS_WIZARD
  $AA49,3 CLEAR_SCREEN
  $AA51,10 Clear 10 of the 12 bytes at this address
  $AA60,3 Point #REGde to REDEFINE_KEYS_WIZARD_TEXT
  $AA64,3 UPDATE_SCREEN_GFX
  $AA74,3 UPDATE_SCREEN_GFX
  $AA80,10 Update colour attributes to $04
c $AABA
c $AADF Some kind of pause routine?
c $AAE4 Called after death tune
  $AAE6,3 address $ABE9 not used, but data block starting at $ABEA
  $AAED,1 #REGhl will be at least $ABEA here
c $AAF4 Redefine keys: get key
@ $AAF4 label=REDEFINE_KEYS_GET_KEY
  $AAFE,15 Read keyboard
c $AB0D Redefine keys: print the key you just pressed?
@ $AB0D label=REDEFINE_KEYS_PRINT_KEY
c $AB19 Print redefine key direction label?
@ $AB19 label=REDEFINE_KEYS_PRINT_DIRECTION
  $AB33,3 end of REDEFINE_KEYS_WIZARD_TEXT
  $AB51,3 UPDATE_SCREEN_GFX
c $AB60 Play the theme tune.
@ $AB60 label=PLAY_TUNE
  $AB6C,1 RST $28 can jump back to AB70
b $AB6D Probably unused. Looks like code but the RST $28 means it's never reached!
c $AB70 The above RST $28 returns here!
  $AB79,2 PLAY_TUNE
c $AB7B Scroll the ticket text across the screen
@ $AB7B label=SCROLL_TICKER_TEXT
c $AB9E Clears the screen to black: from bottom to top.
@ $AB9E label=CLEAR_SCREEN
c $ABAD Displays scoreboard with heading and names/scores list
@ $ABAD label=DISPLAY_SCOREBOARD
  $ABAD,3 Point #REGde to HIGH_SCORE_HEADING_TEXT
  $ABB7,3 UPDATE_SCREEN_GFX
  $ABC0,3 set #REGde to high score table
  $ABC8,3 UPDATE_SCREEN_GFX
  $ABD6,19 update screen colours
t $ABEA Not sure if this data is used directly, but the address is used (by #R$AAE4) as a base to later data
t $ABF2 High score table heading text data
@ $ABF2 label=HIGH_SCORE_HEADING_TEXT
t $AC02 Wizard instructions for redefining the keys
@ $AC02 label=REDEFINE_KEYS_WIZARD_TEXT
  $AC02,82,32,10
t $AC54 Alphabet characters, but out of order
t $AC7C Home screen ticker text
@ $AC7C label=HOME_SCREEN_TICKER_TEXT
N $AC94 Redefine keys text
N $ACAF Instructions text
t $ACCA Instructions screen ticker text
@ $ACCA label=INSTRUCTIONS_SCREEN_TICKER_TEXT
N $ACE2 Redefine keys text
N $ACFD Select key type
t $AD21 "1,2,3 or 4 players ?" - choose number of players text data
@ $AD21 label=CHOOSE_NUMBER_OF_PLAYERS_TEXT
t $AD3F "game over player 1 " text data
@ $AD3F label=GAME_OVER_TEXT
t $AD52 "level" text (for current level?)
@ $AD52 label=LEVEL_TEXT
b $AD58 Address $9F9E is stored here, which points to a single opcode: `RET NZ`.
b $AD59 this value is updated
t $AD5A "OUT OF TIME !" text data
@ $AD5A label=OUT_OF_TIME_TEXT
t $AD67 Congratulate player on new high score, and instructions.
@ $AD67 label=NEW_HIGH_SCORE_TEXT
  $AD67,165,15
b $AE0C Chuckie Egg theme tune
D $AE0C Notes for the tune; byte 0: length, byte 1: pitch
@ $AE0C label=THEME_TUNE
  $AE0C,94,2
b $AE6A Death tune, played when the farmer, well, dies.
D $AE6A Notes for the tune; byte 0: length, byte 1: pitch
@ $AE6A label=DEATH_TUNE
  $AE6A,50,2
c $AE9C Called just before showing new level
  $AE9C,14 Point #REGhl to end of ATTRIBUTE_FILE, then blank some or all of the screen
  $AEB2,3 UPDATE_SCREEN_GFX
  $AECA,1 WARNING! opcode: DAA
  $AF21,3 UPDATE_SCREEN_GFX
  $AF2E,3 UPDATE_SCREEN_GFX
  $AF3E,11 Copy 6 bytes
  $AFCD,3 UPDATE_SCREEN_GFX
  $B0A6,18 choose which 12-bytes to use
  $B12A,3 UPDATE_SCREEN_GFX
c $B130 Update colours?
  $B135,3 Point #REGhl to start of ATTRIBUTE_FILE.
c $B14F After death, screen is redrawn, before hens/farmer displayed
  $B158,1 #REGhl is first incremented to $B15F before being used.
b $B15F
t $B167 Source code remnants
D $B167 The source code here corresponds to the code at #R$A58A...maybe!
B $B171,1 is a double quote character
D $B173 The source code here corresponds to the code at #R$A58C.
b $B200
t $B307 Source code remnants
D $B307 The source code here corresponds to the code at #R$A5C5.
c $B34C
t $B381 Source code remnants
D $B381 The source code here corresponds to the code at #R$A5D7.
b $B3B0 Level 1 layout data - see LEVEL_BUFFER for byte map
@ $B3B0 label=LEVEL_1
  $B3B0,672,32
b $B650 Level 2 layout data - see LEVEL_BUFFER for byte map
@ $B650 label=LEVEL_2
  $B650,672,32
b $B8F0 Level 3 layout data - see LEVEL_BUFFER for byte map
@ $B8F0 label=LEVEL_3
  $B8F0,672,32
b $BB90 Level 4 layout data - see LEVEL_BUFFER for byte map
@ $BB90 label=LEVEL_4
  $BB90,672,32
b $BE30 Level 5 layout data - see LEVEL_BUFFER for byte map
@ $BE30 label=LEVEL_5
  $BE30,672,32
b $C0D0 Level 6 layout data - see LEVEL_BUFFER for byte map
@ $C0D0 label=LEVEL_6
  $C0D0,672,32
b $C370 Level 7 layout data - see LEVEL_BUFFER for byte map
@ $C370 label=LEVEL_7
  $C370,672,32
b $C610 Level 8 layout data - see LEVEL_BUFFER for byte map
@ $C610 label=LEVEL_8
  $C610,672,32
t $C8B0 Source code remnants
D $C8B0 The source code here corresponds to the code at ????.
c $C8C9 This seems to be a return table...where does it end?
@ $C8C9 label=RETURN_TABLE
b $C8DC Does this contain code, data, or is just unused?
s $CBC4 Unused
s $FF18 NOTE: snapshot from FUSE has data here.
i $FF58 RESERVED MEMORY for User defined graphics (UDG)
