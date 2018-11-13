> $61A8 ; SkoolKit disassembly for Chuckie Egg
> $61A8 ; (https://github.com/mrcook/chuckie-egg-disassembly/)
> $61A8 ;
> $61A8 ; Copyright (c) 2018 Michael R. Cook (this disassembly)
> $61A8 ; Copyright (c) 1984 A&F Software (Chuckie Egg)
> $61A8 ; Chuckie Egg was designed and developed by Nigel Alderton
@ $61A8 start
@ $61A8 org=$A410
s $61A8 Level Buffer (empty level)
D $61A8 Screen map data is copied to this buffer at the start of each new level. Each byte represents a tile ID, with 20 tile GFX in total. #TABLE(default,centre,:w) { =h Byte | =h Tile } { 00 | Blank Tile } { 01 | Ladder #1 (left) } { 02 | Ladder #2 (right) } { 03 | Egg } { 04 | Corn } { 05 | Floor } { A8 | Birdcage: handle #1 } { A9 | Birdcage: handle #2 } { AA | Birdcage: #01 (top) } { AB | Birdcage: #02 (top) } { AC | Birdcage: #03 (top) } { AD | Birdcage: #04 (top) } { AE | Birdcage: #05 (middle) } { AF | Birdcage: #06 (middle) } { B0 | Birdcage: #07 (middle) } { B1 | Birdcage: #08 (middle) } { B2 | Birdcage: #09 (bottom) } { B3 | Birdcage: #10 (bottom) } { B4 | Birdcage: #11 (bottom) } { B5 | Birdcage: #12 (bottom) } TABLE#
@ $61A8 label=level_buffer
  $61A8,672,$02a0
s $6448 This area is unused for gameplay, although it was used during game loading.
  $6448,2688,$0a80
s $6EC8 Current player score.
D $6EC8 Each byte represents one decimal digit of the 6 digit score.
@ $6EC8 label=current_score
  $6EC8,6,$06
s $6ECE Saved score for player 1.
@ $6ECE label=score_p1
  $6ECE,6,$06
s $6ED4 Saved score for player 2.
@ $6ED4 label=score_p2
  $6ED4,6,$06
s $6EDA Saved score for player 3.
@ $6EDA label=score_p3
  $6EDA,6,$06
s $6EE0 Saved score for player 4.
@ $6EE0 label=score_p4
  $6EE0,6,$06
b $6EE6 Current player cleared eggs counter
D $6EE6 Copied from the current player variable on level start, saved to the player variable on dying.
@ $6EE6 label=cleared_eggs
  $6EE6,1,1
b $6EE7 Save cleared eggs count for player 1.
@ $6EE7 label=egg_count_p1
  $6EE7,1,1
b $6EE8 Save cleared eggs count for player 2.
@ $6EE8 label=egg_count_p2
  $6EE8,1,1
b $6EE9 Save cleared eggs count for player 3.
@ $6EE9 label=egg_count_p3
  $6EE9,1,1
b $6EEA Save cleared eggs count for player 4.
@ $6EEA label=egg_count_p4
  $6EEA,1,1
b $6EEB Current player cleared levels counter
D $6EEB Copied from the current player variable on level start, saved to the player variable on dying.
@ $6EEB label=cleared_levels
  $6EEB,1,1
b $6EEC Save levels cleared count for player 1.
@ $6EEC label=level_count_p1
  $6EEC,1,1
b $6EED Save levels cleared count for player 2.
@ $6EED label=level_count_p2
  $6EED,1,1
b $6EEE Save levels cleared count for player 3.
@ $6EEE label=level_count_p3
  $6EEE,1,1
b $6EEF Save levels cleared count for player 4.
@ $6EEF label=level_count_p4
  $6EEF,1,1
b $6EF0 Remaining lives for player 1.
@ $6EF0 label=lives_p1
  $6EF0,1,1
b $6EF1 Remaining lives for player 2.
@ $6EF1 label=lives_p2
  $6EF1,1,1
b $6EF2 Remaining lives for player 3.
@ $6EF2 label=lives_p3
  $6EF2,1,1
b $6EF3 Remaining lives for player 4.
@ $6EF3 label=lives_p4
  $6EF3,1,1
s $6EF4 Unused.
  $6EF4,940,$03ac
s $72A0 Sprite buffer.
@ $72A0 label=sprite_buffer
  $72A0,56,$38
b $72D8 X position of the Farmer.
@ $72D8 label=farmer_pos_x
  $72D8,1,1
b $72D9 Y position of the Farmer.
@ $72D9 label=farmer_pos_y
  $72D9,1,1
b $72DA Animation frame counter.
D $72DA Frame values are from 0 to 3
@ $72DA label=anim_frame
  $72DA,1,1
b $72DB Direction the Farmer is facing.
D $72DB #TABLE(default,centre,:w) { =h Byte | =h Direction } { 00 | Right } { 04 | Left } { 0D | Forward (Climbing) } TABLE#
@ $72DB label=farmer_direction
  $72DB,1,1
b $72DC Unknown variable.
  $72DC,1,1
s $72DD Sprite/background composition buffer
D $72DD Current background tiles are loaded then the sprite data is merged.
@ $72DD label=screen_buffer
  $72DD,72,$48
b $7325 Farmer is airbourne?
D $7325 Values: $00=grounded, $02=airbourne.
@ $7325 label=farmer_airbourne
  $7325,1,1
b $7326 Farmer jumping direction.
D $7326 #TABLE(default,centre,:w) { =h Byte | =h Direction } { 00 | Straight up } { 01 | Right } { FF | Left } TABLE#
@ $7326 label=farmer_jump_dir
  $7326,1,1
b $7327 Variable related to the Farmer jumping.
  $7327,1,1
b $7328 Variable related to the Farmer jumping.
  $7328,1,1
b $7329 Unused?
  $7329,1,1
b $732A Direction Farmer is travelling while airbourne.
D $732A Values: $01=up, $FF=down.
@ $732A label=farmer_air_dir
  $732A,1,1
b $732B Unknown counter variable, but seems related to the ticker text at bottom of screen.
D $732B Counts $08 to $01, and loops.
  $732B,1,1
b $732C Unknown counter variable.
  $732C,1,1
b $732D Menu screen ID.
D $732D ID changes depending on what screen should be displayed, except when on the Instructions screen where the values relate to the selected input type menu. #TABLE(default,centre,:w) { =h Byte | =h state } { 03 | Redefine keys } { 05 | Select input type } { 06 | Intro music } { 0A | Instructions: Input type 1=$06, 2=$05, 3=$03 } TABLE#
@ $732D label=game_state
  $732D,1,1
w $732E Keyboard address for: UP key
@ $732E label=key_up
  $732E,2,2
w $7330 Keyboard address for: DOWN key
@ $7330 label=key_down
  $7330,2,2
w $7332 Keyboard address for: LEFT key
@ $7332 label=key_left
  $7332,2,2
w $7334 Keyboard address for: RIGHT key
@ $7334 label=key_right
  $7334,2,2
w $7336 Keyboard address for: JUMP key
@ $7336 label=key_jump
  $7336,2,2
w $7338 Keyboard address for: Alternative JUMP key
@ $7338 label=key_jump_2
  $7338,2,2
b $733A Total number of players for the current game?
D $733A Possible values are 1, 2, 3, and 4.
@ $733A label=number_of_players
  $733A,1,1
b $733B Current active player.
D $733B Possible values are 1, 2, 3, and 4.
@ $733B label=current_player
  $733B,1,1
b $733C Unknown variable the flips between 1 and 2.
  $733C,1,1
w $733D Screen address of a 6-digit score for the active player.
D $733D Position is calculated from the left with the following tile LSB values: P1=$05, P2=$0C, P3=$13, P4=$1A. Note: the MSB is always $40.
  $733D,2,2
b $733F Bonus: 3 decimal digits.
D $733F This counts down in 10's, so the 4th digit isn't needed.
@ $733F label=bonus_timer
  $733F,3,3
b $7342 Time: 3 decimal digits.
@ $7342 label=main_timer
  $7342,3,3
b $7345 Timer sub-counter.
D $7345 The clock ticks about 20 times per second, and this counter ticks 10 times per clock tick - this info needs clarifying!
@ $7345 label=main_sub_timer
  $7345,1,1
b $7346 Bonus clock sub-counter.
D $7346 The bonus ticks about 7 times per second, and this counter ticks 64 times per clock tick - this info needs clarifying!
@ $7346 label=bonus_sub_timer
  $7346,1,1
b $7347 Unknown variables: seemd to always be $01.
  $7347,1,1
b $7348 Unknown variables: seemd to always be $08.
  $7348,1,1
b $7349 Unknown variables: seemd to always be $98.
  $7349,1,1
b $734A Unknown variable. On level start, counts up from $00 to $05, then remains there for the rest of the level.
  $734A,1,1
b $734B Unknown variable. On level start, counts down from $F to $FB, then remains there for the rest of the level.
  $734B,1,1
b $734C Another counter: counting from $0C to $01.
  $734C,1,1
b $734D Bit. Flips from 0 to 1 when the above counter restarts.
  $734D,1,1
w $734E Unknown variable, seems to hold 0x0505 for the whole level.
  $734E,2,2
b $7350 Unknown variable. Seems to hold $FF the whole level.
  $7350,1,1
b $7351 Unknown variable.
  $7351,1,1
w $7352 Unknown variable.
  $7352,2,2
b $7354 Unknown variable.
  $7354,1,1
b $7355 Unknown variable.
  $7355,1,1
b $7356 Unknown variable.
  $7356,1,1
b $7357 Robot Hens.
D $7357 #TABLE(default,centre,:w) { =h Bytes(n) | =h Meaning } { 0 | X position } { 1 | Y position } { 2 | ? } { 3 | Always $00? } TABLE#
@ $7357 label=robot_hen_1
@ $735B label=robot_hen_2
@ $735F label=robot_hen_3
@ $7363 label=robot_hen_4
@ $7367 label=robot_hen_5
  $7357,20,4
b $736B Another counter: counts from $03 to $01, and loops.
  $736B,1,1
w $736C Another counter: counts $00 to $FF, and loops.
  $736C,2,2
b $736E Unknown.
  $736E,1,1
b $736F Music play state
D $736F Strange that 00 means "play music" - probably need a more appropriate label. #TABLE(default,centre,:w) { =h Byte | =h state } { 00 | play } { 01 | stopped } TABLE#
@ $736F label=music_play_state
  $736F,1,1
b $7370 SFX Timer, when collecting eggs/corn.
@ $7370 label=sfx_timer
  $7370,1,1
b $7371 Unused?
  $7371,2,2
b $7373 State variable for lookup table routine #R$9CEB.
  $7373,1,1
w $7374 Lookup table address saved here by #R$9CEB.
  $7374,2,2
s $7376 Unused.
  $7376,3802,$0eda
w $8250 Keyboard Controls #1: 2, W, 9, 0, Z or M.
@ $8250 label=key_input_type_1
  $8250,12,2
w $825C Keyboard Controls #2: Cursor Keys, 4 or S.
@ $825C label=key_input_type_2
  $825C,12,2
w $8268 Keyboard Controls #3: Q, A, O, P, M or 1.
@ $8268 label=key_input_type_3
  $8268,12,2
s $8274 Really unused?
  $8274,194,$c2
t $8336 Ticker text
D $8336 'press R to redefine keys * press S to start game * press 1, 2 or 3 to select key type'
@ $8336 label=msg_ticker
  $8336,5,5
B $833B,1,1
  $833C,1,1
B $833D,1,1
  $833E,2,2
B $8340,1,1
  $8341,8,8
B $8349,1,1
  $834A,4,4
B $834E,2,1
  $8350,5,5
B $8355,1,1
  $8356,1,1
B $8357,1,1
  $8358,2,2
B $835A,1,1
  $835B,5,5
B $8360,1,1
  $8361,4,4
B $8365,2,1
  $8367,5,5
B $836C,1,1
  $836D,3,3
B $8370,1,1
  $8371,2,2
B $8373,1,1
  $8374,1,1
B $8375,1,1
  $8376,2,2
B $8378,1,1
  $8379,6,6
B $837F,1,1
  $8380,3,3
B $8383,1,1
  $8384,4,4
B $8388,8,1
t $8390 Instructions screen redefine keys text
D $8390 'key types 1 & 2 are present and' 'cannot be changed but the type 3' 'keys are user defineable.      '
@ $8390 label=msg_redefine_text
  $8390,31,31
B $83AF,1,1
  $83B0,6,6
B $83B6,1,1
  $83B7,2,2
B $83B9,1,1
  $83BA,7,7
B $83C1,1,1
  $83C2,3,3
B $83C5,1,1
  $83C6,3,3
B $83C9,1,1
  $83CA,4,4
B $83CE,1,1
  $83CF,4,4
B $83D3,1,1
  $83D4,5,5
B $83D9,1,1
  $83DA,1,1
B $83DB,1,1
  $83DC,1,1
B $83DD,1,1
  $83DE,1,1
B $83DF,1,1
  $83E0,3,3
B $83E3,1,1
  $83E4,6,6
B $83EA,1,1
  $83EB,3,3
B $83EE,2,1
t $83F0 Instructions screen key types table
@ $83F0 label=msg_key_types
  $83F0,96,32
b $8450 Unused data block?
  $8450,46,8*5,6
t $847E Instructions screen KEYS heading
D $847E 'KEYS'
@ $847E label=msg_keys_heading
  $847E,4,4
s $8482 Unused
  $8482,25,$19
t $849B Instructions screen objective text
D $849B 'objective- to collect eggs from the hen-house.'
@ $849B label=msg_instructions_objective
  $849B,3,3
B $849E,1,1
  $849F,10,10
B $84A9,7,1
  $84B0,10,10
B $84BA,1,1
  $84BB,2,2
B $84BD,1,1
  $84BE,7,7
B $84C5,1,1
  $84C6,4,4
B $84CA,1,1
  $84CB,4,4
s $84CF Unused
  $84CF,11,$0b
t $84DA Instructions screen heading
D $84DA 'INSTRUCTIONS'
@ $84DA label=msg_instructions_heading
  $84DA,12,12
b $84E6 Data block at 84e6
  $84E6,10,8,2
b $84F0 Blank tile graphic
D $84F0 address from which the following graphics are accessed.
@ $84F0 label=gfx_tile_blank
  $84F0,8,8
b $84F8 Ladder tile graphic (16x8)
D $84F8 #HTML[#UDGARRAY2;$84F8-$8507-8(gfx_tile_ladder)]
@ $84F8 label=gfx_tile_ladder
  $84F8,16,8
b $8508 Egg item graphic
D $8508 #HTML[#UDG$8508(gfx_item_egg)]
@ $8508 label=gfx_item_egg
  $8508,8,8
b $8510 Corn item graphic
D $8510 #HTML[#UDG$8510(gfx_item_corn)]
@ $8510 label=gfx_item_corn
  $8510,8,8
b $8518 Floor tile graphic
D $8518 #HTML[#UDG$8518(gfx_tile_floor)]
@ $8518 label=gfx_tile_floor
  $8518,8,8
b $8520 Unknown ad unused?
  $8520,40,8
b $8548 "SCORE" label graphic (24x8)
D $8548 #HTML[#UDGARRAY3;$8548-$855F-8(labels_score)]
@ $8548 label=gfx_label_score
  $8548,24,8
b $8560 "PLAYER" label graphic (32x8)
D $8560 #HTML[#UDGARRAY4;$8560-$857F-8(labels_player)]
@ $8560 label=gfx_label_player
  $8560,32,8
b $8580 "TIME" label graphic (24x8)
D $8580 #HTML[#UDGARRAY3;$8580-$8597-8(labels_time)]
@ $8580 label=gfx_label_time
  $8580,24,8
b $8598 "A+F SOFTWARE" logo text (48x8)
D $8598 #HTML[#UDGARRAY6;$8598-$85C7-8(labels_af_software)]
@ $8598 label=gfx_text_afsoftware
  $8598,48,8
b $85C8 "BONUS" label graphic (24x8)
D $85C8 #HTML[#UDGARRAY3;$85C8-$85DF-8(labels_bonus)]
@ $85C8 label=gfx_label_bonus
  $85C8,24,8
b $85E0 "LE" text (8x8) - unknown usage
D $85E0 #HTML[#UDGARRAY3;$85E0-$85E7-8(labels_le)]
@ $85E0 label=gfx_text_le
  $85E0,8,8
b $85E8 Unused?
  $85E8,8,8
b $85F0 Font: A-Z, numbers, punctuation, and other symbols.
D $85F0 #HTML[#FONT:( !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ)$85F0(font_complete)]
@ $85F0 label=font_all
  $85F0,472,8
s $87C8 Unused font space?
  $87C8,48,$30
b $87F8 Font: A-Z bold
D $87F8 #HTML[#FONT:(ABCDEFGHIJKLMNOPQRSTUVWXYZ)$87F8(font_az_bold)]
@ $87F8 label=font_az_bold
  $87F8,208,8
b $88C8 Font: Bullet point graphic
D $88C8 Used to separate the scrolling ticker text: Start, Redefine, Insturctions. #HTML[#UDG$88C8(font_gfx_bullet)]
@ $88C8 label=font_bullet_point
  $88C8,8,8
s $88D0 Unused font space?
  $88D0,16,$10
b $88E0 Font: Registered symbol graphic
D $88E0 #HTML[#UDG$88E0(font_gfx_registered_symbol)]
@ $88E0 label=font_registered_symbol
  $88E0,8,8
b $88E8 Font: Copyright symbol graphic
D $88E8 #HTML[#UDG$88E8(font_gfx_copyright_symbol)]
@ $88E8 label=font_copyright_symbol
  $88E8,8,8
b $88F0 Used but unknown (graphics?) data
  $88F0,120,8
b $8968 "A+F CHUCKIE EGG" text graphic
D $8968 Use as the default name in the high score table. #HTML[#UDGARRAY8;$8968-$89A7-8(text_highscore_default_name)]
@ $8968 label=gfx_text_highscore_default_name
  $8968,64,8
b $89A8 Font: Abbreviations for SP, CS, SS, EN (32x8)
D $89A8 #HTML[#UDGARRAY4;$89A8-$89C7-8(font_gfx_abbreviations)]
@ $89A8 label=font_abbreviation_symbols
  $89A8,32,8
b $89C8 "LEVEL" label graphic (24x8)
D $89C8 #HTML[#UDGARRAY3;$89C8-$89DF-8(labels_level)]
@ $89C8 label=gfx_label_level
  $89C8,24,8
b $89E0 Font: Numbers bold (used in the scores, level, etc.)
D $89E0 #HTML[#FONT:(0123456789)$89E0(font_numbers_bold)]
@ $89E0 label=font_numbers_bold
  $89E0,80,8
b $8A30 Birdcage handle graphic tiles (16x8)
D $8A30 #HTML[#UDGARRAY2;$8A30-$8A3F-8(level_gfx_birdcage_handle)]
@ $8A30 label=gfx_tile_birdcage_handle
  $8A30,16,8
b $8A40 Birdcage graphic tiles (32x24)
D $8A40 #HTML[#UDGARRAY4;$8A40-$8A9F-8(level_gfx_birdcage)]
@ $8A40 label=gfx_tile_birdcage
  $8A40,96,8
b $8AA0 Player "lives" icon graphic
D $8AA0 #HTML[#UDG$8AA0(level_gfx_lives_counter)]
@ $8AA0 label=gfx_icon_lives
  $8AA0,8,8
b $8AA8 High score table "cursor" icon graphic
D $8AA8 #HTML[#UDG$8AA8(level_gfx_highscore_cursor)]
@ $8AA8 label=gfx_icon_highscore_cursor
  $8AA8,8,8
b $8AB0 "UP" heading graphic for instructions screen (24x8)
D $8AB0 #HTML[#UDGARRAY3;$8AB0-$8AC7-8(instructions_heading_up)]
@ $8AB0 label=instructions_heading_up
  $8AB0,24,8
b $8AC8 "DOWN" heading graphic for instructions screen (24x8)
D $8AC8 #HTML[#UDGARRAY3;$8AC8-$8ADF-8(instructions_heading_down)]
@ $8AC8 label=instructions_heading_down
  $8AC8,24,8
b $8AE0 "LEFT" heading graphic for instructions screen (24x8)
D $8AE0 #HTML[#UDGARRAY3;$8AE0-$8AF7-8(instructions_heading_left)]
@ $8AE0 label=instructions_heading_left
  $8AE0,24,8
b $8AF8 "RIGHT" heading graphic for instructions screen (24x8)
D $8AF8 #HTML[#UDGARRAY3;$8AF8-$8B0F-8(instructions_heading_right)]
@ $8AF8 label=instructions_heading_right
  $8AF8,24,8
b $8B10 "JUMP" heading graphic for instructions screen (24x8)
D $8B10 #HTML[#UDGARRAY4;$8B10-$8B2F-8(instructions_heading_jump)]
@ $8B10 label=instructions_heading_jump
  $8B10,32,8
b $8B30 "TYPE" heading graphic for instructions screen (32x8)
D $8B30 #HTML[#UDGARRAY4;$8B30-$8B4F-8(instructions_heading_type)]
@ $8B30 label=instructions_heading_type
  $8B30,32,8
s $8B50 Unknown, unused?
  $8B50,672,$02a0
b $8DF0 Farmer sprites animation data: right facing
@ $8DF0 label=sprites_farmer_right
  $8DF0,128,8
b $8E70 Farmer sprites animation data: left facing
@ $8E70 label=sprites_farmer_left
  $8E70,128,8
b $8EF0 Duck sprites animation data: right facing (2 of 16x16)
@ $8EF0 label=sprites_duck_right
  $8EF0,64,8
b $8F30 Duck sprites animation data: left facing (2 of 16x16)
@ $8F30 label=sprites_duck_left
  $8F30,64,8
b $8F70 Data here is copied to $72A0
  $8F70,32,8
b $8F90 Farmer sprites animation data: climbing stairs
@ $8F90 label=sprites_farmer_climbing
  $8F90,128,8
b $9010 Ostrich sprites data: left facing (16x16)
@ $9010 label=sprites_ostrich_left
  $9010,32,8
b $9030 Ostrich sprites data: right facing (16x16)
@ $9030 label=sprites_ostrich_right
  $9030,32,8
b $9050 Ostrich sprites animation data: climbing (2 of 16x16)
@ $9050 label=sprites_ostrich_climbing
  $9050,64,8
b $9090 Ostrich sprites data: left walking (16x16)
@ $9090 label=sprites_ostrich_left_walk
  $9090,32,8
b $90B0 Ostrich sprites data: right walking (16x16)
@ $90B0 label=sprites_ostrich_right_walk
  $90B0,32,8
b $90D0 Ostrich sprites data: eating left facing (16x16)
@ $90D0 label=sprites_ostrich_eating_left
  $90D0,32,8
b $90F0 Ostrich sprites data: eating right facing (16x16)
@ $90F0 label=sprites_ostrich_eating_right
  $90F0,32,8
b $9110 Some odd graphics/data...unusued?
  $9110,14,8,6
c $911E Runs from start of level, after everything has been rendered.
D $911E Used by the routine at #R$98e6.
  $9128,9 Increment value stored @736C, then set its MSB(?) to $00
  $9133,4 Jump if BIT 0 of the byte stored at address #REGhl is set.
c $9178 Seems to run every loop
D $9178 Used by the routine at #R$911e.
  $91C7,4 If bit 1 of the value stored @736C is set, do not jump to @91DF
c $91CB An alt routine @91DF ?
D $91CB Used by the routine at #R$91df.
c $91DF An alt routine @91CB ?
D $91DF Used by the routines at #R$9178 and #R$91cb.
c $91F3 Seems to run every loop
D $91F3 Used by the routine at #R$9178.
  $9237,4 If bit 1 of the value stored @736C is set, do not jump to @9250
c $923B An alt routine to @9250 ?
D $923B Used by the routine at #R$9250.
c $9250 An alt routine to @923B ?
D $9250 Used by the routines at #R$91f3 and #R$923b.
c $9265 Routine at 9265
D $9265 Used by the routine at #R$9178.
  $9265,3 Backup registers
  $9294,3 Pop all to #REGhl rather than #REGde, #REGhl, #REGbc.
c $9298 Routine to restore (POP) all #REGde, #REGhl, #REGbc registers
D $9298 Used by the routine at #R$9265.
@ $9298 label=Restore16bitRegisters
c $929C Update Ostriches?
D $929C Used by the routines at #R$911e, #R$9178, #R$91f3 and #R$9265.
  $929C,1 POKE to 201 (`RET`) to vanquish Ostriches
c $92C2 Routine at 92c2
D $92C2 Used by the routine at #R$929c.
@ $92F6 ssub=LD HL,$8F90+$7E ; Point #REGhl to end of SPRITES_FARMER_WALK
c $935F Routine at 935f
D $935F Used by the routine at #R$92c2.
@ $9398 ssub=LD HL,$84F0+$07 ; Point #REGhl to last byte of gfx_tile_blank
c $93DD Routine at 93dd
D $93DD Used by the routines at #R$92c2 and #R$935f.
  $93E5,3 Point #REGhl to start of ATTRIBUTE_FILE.
c $93FE Backup/restore #REGaf, so routine can be called safely.
D $93FE Used by the routine at #R$935f.
c $9404 Routine at 9404
D $9404 Used by the routines at #R$92c2 and #R$935f.
  $9404,3 Backup #REGaf, #REGde, #REGbc registers
  $9408,3 Load #REGhl with start of DISPLAY_FILE.
  $940B,3 Load #REGbc with value of 2048 (1/3 of screen)
  $9434,3 Restore #REGaf, #REGde, #REGbc registers
c $9438 Save/restore #REGhl so routine can be called safely
D $9438 Used by the routines at #R$9178, #R$91cb, #R$91df, #R$91f3, #R$923b and #R$9250.
b $943E Data block at 943e
  $943E,29,8*3,5
b $945B Some of these byte are copied to $7357.
  $945B,221,8*27,5
c $9538 Routine at 9538
D $9538 Used by the routines at #R$98e6, #R$a0c8, #R$a22a and #R$a2b5.
c $9584 Routine at 9584
D $9584 Used by the routine at #R$9538.
  $958C,3 Point #REGhl to start of ATTRIBUTE_FILE.
c $95A6 Routine at 95a6
D $95A6 Used by the routine at #R$9538.
s $95C5 Unused?
  $95C5,107,$6b
b $9630 Home screen/high score table text data
D $9630 As displayed after game load, and game over. Note: the screen is loaded bottom to top.
@ $9630 label=home_screen
  $9630,28,8*3,4
M $964C,14 "by n.alderton"
T $964C,2,2
  $964E,2,1
T $9650,10,10
  $965A,14,8,6
M $9668,14 "1 to 4 players"
T $9668,1,1
  $9669,1,1
T $966A,2,2
  $966C,1,1
T $966D,1,1
  $966E,1,1
T $966F,7,7
  $9676,15,8,7
M $9685,12 "of skill for"
T $9685,2,2
  $9687,1,1
T $9688,5,5
  $968D,1,1
T $968E,3,3
  $9691,19,8*2,3
M $96A4,6 "a game"
T $96A4,1,1
  $96A5,1,1
T $96A6,4,4
  $96AA,147,8*18,3
T $973D,8,8 "presents"
  $9745,17,8*2,1
M $9756 "A & F SOFTWARE"
T $9756,1,1
  $9757,1,1
T $9758,1,1
  $9759,1,1
T $975A,1,1
  $975B,1,1
T $975C,8,8
b $9764 Data block at 9764
  $9764,7,7
b $976B Data block at 976b
  $976B,1,1
b $976C Data block at 976c
  $976C,6,6
b $9772 Data block at 9772
  $9772,1,1
b $9773 Data block at 9773
  $9773,1,1
b $9774 Data block at 9774
  $9774,6,6
b $977A Data block at 977a
  $977A,1,1
b $977B Data block at 977b
  $977B,1,1
b $977C Data block at 977c
  $977C,8,8
b $9784 Data block at 9784
  $9784,1,1
b $9785 Data block at 9785
  $9785,2,2
b $9787 Data block at 9787
  $9787,40,8
t $97AF High score table with name/score columns
D $97AF Probably ranked here 1-10.
@ $97AF label=scoreboard
  $97AF,1,1 start byte?
B $97B0,8,1
  $97B8,8,8
B $97C0,8,1
  $97C8,8,8
B $97D0,8,1
  $97D8,8,8
B $97E0,8,1
  $97E8,8,8
B $97F0,8,1
  $97F8,8,8
B $9800,8,1
t $9808 Bottom five of scoreboard
  $9808,8,8
B $9810,8,1
  $9818,8,8
B $9820,8,1
  $9828,8,8
B $9830,8,1
  $9838,8,8
B $9840,8,1
  $9848,7,7
b $984F Unknown/unused bytes.
  $984F,9,8,1
c $9858 Routine at 9858
D $9858 Used by the routines at #R$99dc and #R$ae9c.
  $9858,3 reads SYSVAR_ERR_SP
  $98DC,10 Called after pressing `CAPSHIFT`, and waiting for keyboard A or H.
c $98E6 Routine at 98e6
D $98E6 Used by the routine at #R$9858.
  $98EF,1 POKE to 0 (`NOP`) to get infinite TIME
  $98FC,1 POKE to 0 (`NOP`) to make giant duck very slow
  $98FD,2 POKE to 24 (`JR nnnn`) to vanquish giant duck
  $9925,1 POKE to 0 (`NOP`) to get infinite BONUS
  $9938,1 POKE to `0` (NOP) to slow Ostriches
@ $9955 ssub=LD A,($7336+$01)
  $9955,16 JUMP keypress
@ $9965 ssub=LD A,($7338+$01)
  $9965,16 key_jump_2 keypress
  $9975,24 Load bytes into @72D8 + 77, 78, 79, 80, 82, and 125.
@ $9991 ssub=LD A,($7334+$01)
  $9991,16 RIGHT keypress
@ $99A5 ssub=LD A,($7332+$01)
  $99A5,16 LEFT keypress
c $99DC Jump point
D $99DC Used by the routines at #R$9858 and #R$98e6.
c $99DF Routine at 99df
D $99DF Used by the routine at #R$98e6.
c $9A17 Routine at 9a17
D $9A17 Used by the routine at #R$99df.
c $9A2C Unused code?
c $9A38 Unused code?
b $9A47 Unused?
  $9A47,5,5
c $9A4C Fetches and draws a sprite
D $9A4C Used by the routines at #R$9d08, #R$9e98, #R$a0c8, #R$a278 and #R$a37f.
  $9A53,3 Point #REGhl to the start of the sprites data
  $9A69,16 Copy current sprite to the sprite_buffer
  $9A80,19 Rotate bytes in the sprite_buffer...why?
  $9A95,4 Point #REGix to beginning of screen_buffer
  $9A9A,3 Point #REGhl to beginning of level_buffer
  $9ABB,22 Point #REGhl to one of the GFX tiles (offset from gfx_tile_blank)
  $9AD1,13 Copy GFX tile data to the screen_buffer
  $9AF8,2 Jump back until screen_buffer is holds all tile data.
  $9B05,19 Copy the 48 bytes of screen_buffer to sprite_buffer, merging with the current sprite data there.
  $9B1A,3 Load #REGhl with start of DISPLAY_FILE.
  $9B1D,3 Load #REGbc with value of 2048 (1/3 of screen)
  $9B4E,35 Draw sprite to screen
  $9B90,14 Update sprite colours to $06: INK=yellow, PAPER=black, BRIGHT=0.
@ $9BCB keep
c $9BDE Calculates current position of sprite in ATTRIBUTE_FILE.
D $9BDE Used by the routine at #R$9a4c.
@ $9BDE label=SpritePositionInAttrFile
  $9BE6,3 Point #REGhl to start of ATTRIBUTE_FILE.
s $9BFF Unused
  $9BFF,65,$41
c $9C40 Called when needing to draw a level...works on 1/3 of screen at a time?
D $9C40 Used by the routines at #R$a3a7, #R$a420, #R$a47d, #R$a4c8, #R$a515, #R$a59d, #R$a828, #R$a9ce, #R$aa49, #R$ab19, #R$abad and #R$ae9c.
@ $9C40 label=UpdateScreenGfx
  $9C40,4 Why are these NOPs? Are they ever changed?
  $9C44,4 Backup 16-bit registers.
  $9C48,1 #REGa=screen section: $08=2/3, $10=3/3, else 1/3.
  $9C49,1 Backup #REGhl to #REGde#REGhl
  $9C4A,3 point #REGhl to start of DISPLAY
  $9C4D,3 load #REGbc with 2048 - one third of a screen
  $9C50,4 Update 1/3 of screen?
  $9C54,4 Update 2/3 of screen?
  $9C58,1 Update 3/3 of screen.
  $9C7C,1 Restore #REGhl with value in #REGde
  $9C7D,12 set #REGhl to gfx_tile_blank, then update this section of the screen (address of #REGde) with all GFX tiles.
  $9C89,4 Restore 16-bit registers and RETurn
c $9C8E Unused code? Same as last 3 instructions of previous routine, at $9C8B.
s $9C91 Unused
  $9C91,11,$0b
c $9C9C INTERUPT jump point
s $9C9F Unused
  $9C9F,5,$05
c $9CA4 This routine produces a sound, formed of a square wave.
D $9CA4 Used by the routines at #R$9858, #R$98e6, #R$9d08, #R$9e98 and #R$a62c.
@ $9CA4 label=SoundSquareWave
s $9CB5 Unused
  $9CB5,13,$0d
c $9CC2 Called from an INTERUPT, and basically every game loop?
D $9CC2 Used by the routine at #R$9c9c.
c $9CEB Get address value from the address_lookup_table
D $9CEB Used by the routines at #R$a389, #R$a420, #R$a4c8, #R$a62c, #R$a828, #R$aae4 and #R$b14f.
@ $9CEB label=GetLookupTableAddress
  $9CEB,1 Current known values for #REGa are between $01 and $21.
@ $9CF2 ssub=LD HL,$C8C8-$02 ; Point #REGhl to address_lookup_table - 2 bytes
  $9CF5,4 Increment #REGhl until we get the desired address.
  $9CF9,3 Load #REGde with address from lookup table
  $9CFC,4 Save address to $7374
  $9D02,3 Set $7373 to $01
s $9D06 Unused
  $9D06,2,$02
c $9D08 Routine at 9d08
D $9D08 Used by the routine at #R$98e6.
@ $9D36 ssub=LD A,($7332+$01)
  $9D36,16 LEFT keypress
@ $9D6F ssub=LD A,($7334+$01)
  $9D6F,16 RIGHT keypress
s $9DF1 Unused
  $9DF1,67,$43
c $9E34 Routine at 9e34
D $9E34 Used by the routines at #R$9265, #R$93fe, #R$9438, #R$99df, #R$a30c and #R$b34c.
c $9E57 Unused code?
s $9E59 Unused
  $9E59,13,$0d
c $9E66 Farmer jumping/falling routine
D $9E66 Used by the routine at #R$9858.
@ $9E66 label=FarmerVerticalMovement
c $9E8A Reset mid-air farmer routine
D $9E8A Used by the routine at #R$9e66.
s $9E8D Unused
  $9E8D,11,$0b
c $9E98 Routine at 9e98
D $9E98 Used by the routine at #R$98e6.
@ $9EC7 ssub=LD A,($732E+$01)
  $9EC7,58 UP keypress
@ $9F01 ssub=LD A,($7330+$01)
  $9F01,62 DOWN keypress
s $9F3F Unused
  $9F3F,33,$21
c $9F60 Routine at 9f60
D $9F60 Used by the routine at #R$98e6.
@ $9F8A ssub=LD A,($7332+$01)
  $9F8A,21 LEFT keypress
c $9FB5 Routine at 9fb5
D $9FB5 Used by the routine at #R$9f60.
@ $9FB5 ssub=LD A,($7334+$01)
  $9FB5,15 RIGHT keypress
s $9FDF Unused
  $9FDF,53,$35
c $A014 Routine at a014
D $A014 Used by the routine at #R$98e6.
c $A07B Draw the elevator platforms?
D $A07B Used by the routine at #R$a014.
@ $A07B label=ElevatorPlatformDraw
c $A096 Calculate position of next platform?
D $A096 Used by the routine at #R$a07b.
@ $A096 label=ElevatorPlatformCalculatePos
c $A0A9 Calculations related to elevator position?
D $A0A9 Used by the routine at #R$a014.
@ $A0A9 label=ElevatorCalculatePos
c $A0C0 Unused code?
D $A0C0 Note same as last instructions of previous routine
b $A0C5 Unused bytes/code?
  $A0C5,3,3
c $A0C8 Could be giant duck code or another elevator related routine, called after bigger movement of platform.
D $A0C8 Used by the routine at #R$98e6.
s $A19A Unused
  $A19A,30,$1e
c $A1B8 Routine at a1b8
D $A1B8 Used by the routines at #R$98e6 and #R$a62c.
N $A1C7 This entry point is used by the routine at #R$a1d9.
c $A1D9 Routine at a1d9
D $A1D9 Used by the routine at #R$a1b8.
N $A1DE This entry point is used by the routine at #R$a1b8.
  $A201,16 Display a number from font_numbers_bold
b $A21A Unused code/bytes? (code would be a RET)
  $A21A,2,2
c $A21C Farmer jumping/falling related routine.
D $A21C Used by the routine at #R$9858.
c $A22A Farmer jumping/falling related routine.
D $A22A Used by the routine at #R$a21c.
c $A256 Farmer jumping/falling related routine.
D $A256 Used by the routine at #R$a22a.
c $A278 Farmer lands on a platform?
D $A278 Used by the routine at #R$a256.
c $A294 Farmer jumping/falling related routine.
D $A294 Used by the routine at #R$a22a.
c $A2B5 Routine at a2b5
D $A2B5 Used by the routines at #R$a21c and #R$a294.
c $A30C Farmer jumping/falling related routine.
D $A30C Used by the routine at #R$a2b5.
N $A30F This entry point is used by the routine at #R$a294.
c $A37F Routine at a37f
D $A37F Used by the routines at #R$a294 and #R$a30c.
c $A389 Farmer lands on a platform?
D $A389 Note: exactly same as #R$AAE4, #R$B14F, except for #REGhl address.
@ $A38F ssub=LD HL,$A399-$01
  $A389,9 Load #REGb with #REGr (related to memory refresh), then after processing #REGb will have a value between 1-8.
  $A392,4 Increment #REGhl to required address, and assign #REGa.
  $A396,3 GetLookupTableAddress
b $A399 Small lookup table used by #R$A389 to assign #REGa, for use with GetLookupTableAddress
  $A399,8,8
b $A3A1 Data block at a3a1
  $A3A1,6,6
c $A3A7 Farmer collects an egg/corn...also at start of level.
D $A3A7 Used by the routines at #R$99df, #R$9a17, #R$9a38, #R$a62c and #R$ae9c.
  $A3C5,3 Get current_player
  $A3E3,3 UpdateScreenGfx
b $A40F Unused?
  $A40F,1,1
c $A410 The game has just loaded
D $A410 Used by the routine at #R$9858.
@ $A410 label=GameStart
  $A410,5 Set game_state to "Play Tune" -- POKE @A411 (the address value) to `003` to mute music notes (on game start only)
  $A415,5 Set music_play_state to "play"
  $A41E,2 Interupt Mode: determine when and what an interrupt does
c $A420 Display the home screen, which includes the scoreboard
D $A420 Note: this routine is very similar to the DisplayInstructionsScreen routine.
@ $A420 label=DisplayHomeScreen
  $A420,3 ClearScreen
  $A42B,3 UpdateScreenGfx
  $A43B,3 DisplayScoreboard
  $A43E,3 Point #REGhl to start of ATTRIBUTE_FILE.
  $A443,7 Print "A & F SOFTWARE" text graphic
  $A44A,7 Print "CHUCKIE EGG (c)" text graphic
  $A451,7 Print "a game of skill..." text graphic
  $A458,3 Point #REGhl to theme_tune data
  $A45B,6 If music_play_state is "stopped" then Jump
  $A461,3 else PlayTune
  $A466,3 GetLookupTableAddress
  $A469,5 Set music_play_state to "stopped"
N $A46E This entry point is used by the routine at #R$aa49.
@ $A46E label=SetTickerTextColour
  $A46E,3 Point #REGhl to last line of ATTRIBUTE_FILE.
  $A473,2 Set foreground colour to Cyan, background remains black.
  $A478,5 Sets $732C to $4E ...whatever that is.
c $A47D Scroll ticker text for home screen
D $A47D Note: this routine is very similar to the first half of ScrollText2 routine.
@ $A47D label=ScrollText1
  $A491,3 Point #REGhl to home_screen_ticker_text
  $A49C,4 Set $732C to `$00`
  $A4A8,3 UpdateScreenGfx
  $A4AB,9 Read keyboard and check keypress `S`
  $A4B4,9 Read keyboard and check keypress `R`
  $A4BD,11 Read keyboard and check keypress `I`
c $A4C8 Display the instructions screen
D $A4C8 Note: this routine is very similar to the DisplayHomeScreen routine.
@ $A4C8 label=DisplayInstructionsScreen
  $A4C8,3 ClearScreen
  $A4D3,3 UpdateScreenGfx
  $A4E4,3 Point #REGhl to start of ATTRIBUTE_FILE.
  $A4E9,7 Print instructions headings
  $A4F0,7 Print "KEYS" box
  $A4F7,7 Print "KEY TYPES" text
  $A4FE,7 I saw nothing change visually on the screen.
  $A505,5 Set $732C to `$57`
  $A50A,3 Set game_state to $0A - Instructions screen?
  $A512,3 GetLookupTableAddress
c $A515 Scroll ticker text for instructions screen
D $A515 Note: first half of this routine is very similar ScrollText1 routine.
@ $A515 label=ScrollText2
  $A529,3 Point #REGhl to instructions_screen_ticker_text
  $A534,4 Set $732C to `$00`
  $A540,3 UpdateScreenGfx
  $A54A,9 Read keyboard and check keypress (for what?)
  $A553,9 Read keyboard and check keypress (for what?)
  $A55C,10 Read keyboard row 1..5 (on instructions screen?)
c $A566 Highlight the "input type" line # 1, 2, or 3.
  $A566,1 #REGb also saved to game_state later, at $A57D
  $A567,6 Check the current game_state.
  $A56D,3 Input type #2.
  $A574,3 Input type #3.
  $A579,3 Input type #1 (default).
  $A57D,3 Update game_state value.
  $A582,3 Input type #2.
  $A587,3 Input type #3.
  $A58C,3 Input type #1 (default).
N $A59A This entry point is used by the routine at #R$a515.
c $A59D Initialize a new game
D $A59D Routine to start a new game, first asking for number of players!
@ $A59D label=InitializeGame
  $A5A3,14 Clear the entire DISPLAY_FILE
  $A5B9,3 Point #REGde to choose_number_of_players_text
  $A5BE,21 Scroll text onto screen? vertical-middle of DISPLAY_FILE
  $A5D3,10 Input to get number_of_players for this game
  $A5DD,7 INCrement #REGb until it equals #REGa; the number_of_players
  $A5E4,1 number_of_players (#REGl) = #REGb
  $A5E5,2 current_player (#REGh) = $01
  $A5E7,3 Set total number_of_players and current_player
  $A5EA,10 scroll text off screen
  $A5F6,3 Load #REGde with level_buffer address.
  $A5F9,3 Load #REGbc with size of level data.
  $A5FC,3 Point #REGh; to level_1 address.
  $A5FF,2 Copy level data.
  $A601,3 Why repeat the copy 5 times?
  $A604,10 Reset anim buffer data at $6EC8 (6 bytes) + ANIMBUF1 (24 bytes)
  $A60E,7 Reset all egg counters to $0C (12...why?): from address $6EE6 for 5 bytes
  $A615,7 Reset all cleared levels counters: from address $6EEB for 5 bytes
  $A61C,7 Reset all player lives to 5: from address $6EF0 for 4 bytes
@ $A623 ssub=LD HL,$9F60+$3E ; Address is toward the end of a routine, so we need a big offset.
c $A62C Routine at a62c
D $A62C Used by the routine at #R$a6fe.
  $A62C,3 Get number_of_players
  $A632,3 Get current_player
  $A637,3 GetLookupTableAddress
@ $A63A ssub=LD BC,$AD3F+$0A ; Point #REGbc to the address of "p" from "player 1"
  $A63D,3 Get current_player
@ $A642 ssub=LD ($AD3F+$11),A ; Replace player number in game_over_text with #REGa.
@ $A647 ssub=LD DE,$AD3F+$0A ; Point #REGde to the address of "p" from "player 1"
  $A65F,3 Get current_player
  $A672,3 POKE @A672 to 202 (`JP Z`) to jump to next level on death
  $A6A1,3 Get current_player
@ $A6CD ssub=LD ($AD58+$01),A ; Update LSB of address.
  $A6D9,3 #REGde is loaded with "level " text
  $A6E1,3 Load #REGde with level_buffer address
  $A6E4,3 Load #REGbc with value of 672 (size of level data)
@ $A6E7 ssub=LD HL,$B3B0-$02A0 ; Point #REGhl to level_1-$02A0 (672 bytes).
  $A6F0,1 Add $02A0 (672) to #REGhl, to start read from level_1 address.
c $A6FE Farmer has died!
D $A6FE Used by the routine at #R$a62c.
@ $A6FE label=FarmerKill
  $A701,3 PlayTune
  $A710,3 ClearScreen
  $A725,3 Point #REGde to out_of_time_text
  $A72D,8 copy LEVEL data to level_buffer
  $A735,3 Get current_player
  $A73F,3 Get current_player
  $A755,1 POKE to 182 (`OR (HL)`) to get infinite LIVES
  $A75A,3 Get number_of_players
  $A762,3 Point #REGde to game_over_text
  $A76A,3 Load #REGhl to number_of_players and current_player
  $A773,3 Set current_player
  $A797,3 Get current_player
  $A7A7,3 Get current_player
  $A7AA,15 copy LEVEL data to level_buffer
c $A7BC Related to animation #1
D $A7BC Used by the routine at #R$a6fe.
  $A7C2,11 Point #REGhl to DISPLAY_FILE and reset first 18 bytes
  $A7D6,3 #REGhl=player 1 score
  $A7D9,9 Increment value in (#REGhl) by $30 for 24 bytes.
  $A7E4,3 #REGhl=player 1 score
@ $A7E9 ssub=LD ($AD67+$0B),A ; Change player number in high score text.
  $A7FF,10 check if a score has been entered on scoreboard?
c $A80C Called before loading main screen or highscores?
D $A80C Used by the routine at #R$a7bc.
@ $A811 ssub=LD DE,$97AF+$0A ; Point #REGde to first score value ("001000") on scoreboard.
c $A828 Player enters their name on the highscore table?
D $A828 Used by the routine at #R$a80c.
@ $A828 label=HighScoreEnterName
@ $A82A ssub=LD HL,$97AF+$90 ; Point #REGhl to last score entry (-1 byte) on scoreboard.
@ $A83B ssub=LD DE,$97AF+$9F
@ $A83E ssub=LD HL,$97AF+$8F
  $A841,2 LDDR decrements HL/DE, unlike LDIR, which increments.
  $A844,7 Does this clear the name for the selected highscore?
  $A859,3 Point #REGde to new_high_score_text
  $A862,3 UpdateScreenGfx
  $A86D,3 DisplayScoreboard
  $A870,3 Point #REGhl to start of ATTRIBUTE_FILE.
  $A873,9 Highlight the "Player 1" text in magenta ($03)
  $A87C,6 Highlight the "well done..." message in green (INC A = $04)
  $A882,5 Highlight the "enter initials..." message in red ($02)
  $A88C,3 GetLookupTableAddress
  $A8A6,3 UpdateScreenGfx
  $A8A9,3 reads SYSVAR_KSTATE_4
  $A8B1,3 reads SYSVAR_KSTATE_4
  $A8B8,3 reads SYSVAR_LAST_K (newly pressed key)
  $A8CB,3 UpdateScreenGfx
  $A8DD,3 UpdateScreenGfx
c $A8EC Animated transition
D $A8EC Used by the routines at #R$a929, #R$a968 and #R$a9fa.
@ $A8EC label=TransitionAnimation
c $A921 Possible pause routine
D $A921 Used by the routines at #R$a47d, #R$a515, #R$a62c, #R$a6fe, #R$a929 and #R$a968.
@ $A921 label=PauseRoutine
c $A929 Animated transition #1 (1 square)
D $A929 Used by the routines at #R$a59d and #R$a7bc.
  $A93B,3 Set $732C to `$03`
c $A960 Called when farmer dies
D $A960 Used by the routines at #R$a4c8, #R$a59d, #R$a62c, #R$a6fe and #R$a828.
c $A968 Animated transition #2 (4 squares)
D $A968 Used by the routines at #R$a62c and #R$a7bc.
  $A96B,5 Set $732C to `$09`
  $A9C5,5 Set $732C to `$04`
c $A9CE Prepare to scroll GAME OVER message
D $A9CE Used by the routines at #R$a62c and #R$a6fe.
  $A9CE,10 Update some attribute colours to $04
  $A9DA,3 Point #REGhl to vertical middle of screen
  $A9DD,3 ScrollTickerText
  $A9E7,3 UpdateScreenGfx
  $A9F1,3 Point #REGhl to vertical middle of screen
  $A9F4,3 ScrollTickerText
c $A9FA Animated transition after death...related to animation #1
D $A9FA Used by the routine at #R$a968.
  $AA00,8 Increment value at $732C by `$09`.
c $AA0C Routine at aa0c
D $AA0C Used by the routine at #R$a80c.
c $AA23 Called during animation #1
D $AA23 Used by the routine at #R$a8ec.
  $AA26,3 Point #REGhl to start of PRINTER_BUFFER...why?
c $AA37 Prints a text block to the screen.
D $AA37 Used by the routines at #R$a420, #R$a4c8 and #R$a828.
@ $AA37 label=PrintTextBlock
c $AA49 Redefine keys wizard - read new keys
D $AA49 Used by the routines at #R$a47d and #R$a515.
@ $AA49 label=RedefineKeysWizard
  $AA49,3 ClearScreen
  $AA4C,5 Set game_state to $03 (redefine keys)
  $AA51,10 Clear 10 of the 12 bytes at this address
  $AA60,3 Point #REGde to redefine_keys_wizard_text
  $AA64,3 UpdateScreenGfx
  $AA74,3 UpdateScreenGfx
  $AA80,10 Update colour attributes to $04
@ $AA9A ssub=LD BC,$83F0+$06 ; Point #REGbc to "q" character in msg_key_types
c $AABA Routine at aaba
D $AABA Used by the routine at #R$ab19.
@ $AABA ssub=LD HL,$8268-$01 ; Point #REGhl to key_input_type_3 - 1 byte
N $AAD2 This entry point is used by the routine at #R$aadf.
c $AADF Some kind of pause routine?
D $AADF Used by the routine at #R$aaba.
c $AAE4 Called after death tune
D $AAE4 Note: exactly same as #R$A389, #R$B14F, except for #REGhl address.
@ $AAE6 ssub=LD HL,$ABEA-$01
  $AAE4,9 Load #REGb with #REGr (related to memory refresh), then after processing #REGb will have a value between 1-8.
  $AAED,4 Increment #REGhl to required address, and assign #REGa.
  $AAF1,3 GetLookupTableAddress
c $AAF4 Redefine keys: get key
D $AAF4 Used by the routines at #R$aa49 and #R$ab19.
@ $AAF4 label=RedefineKeysGetKey
N $AAFD This entry point is used by the routine at #R$ab0d.
  $AAFE,15 Read keyboard
c $AB0D Redefine keys: print the key you just pressed?
D $AB0D Used by the routine at #R$aaf4.
@ $AB0D label=RedefineKeysPrintKey
N $AB12 This entry point is used by the routine at #R$aaf4.
c $AB19 Print redefine key direction label?
D $AB19 Used by the routine at #R$aa49.
@ $AB19 label=RedefineKeysPrintDirection
@ $AB33 ssub=LD HL,$AC02+$4C ; Point #REGhl to first address after "jump" in redefine_keys_wizard_text
  $AB51,3 UpdateScreenGfx
c $AB60 Play the theme tune.
D $AB60 Used by the routines at #R$a420, #R$a6fe and #R$ab70.
@ $AB60 label=PlayTune
  $AB6C,1 RST $28 can jump back to AB70
b $AB6D Probably unused. Looks like code but the RST $28 means it's never reached!
  $AB6D,3,3
c $AB70 The above RST $28 returns here!
  $AB79,2 PlayTune
c $AB7B Scroll the ticket text across the screen
D $AB7B Used by the routines at #R$a47d, #R$a515, #R$a59d and #R$a9ce.
@ $AB7B label=ScrollTickerText
c $AB9E Clears the entire screen to black: from bottom to top.
D $AB9E Used by the routines at #R$a420, #R$a4c8, #R$a6fe and #R$aa49.
@ $AB9E label=ClearScreen
c $ABAD Displays scoreboard with heading and names/scores list
D $ABAD Used by the routines at #R$a420 and #R$a828.
@ $ABAD label=DisplayScoreboard
  $ABAD,3 Point #REGde to high_score_heading_text
  $ABB7,3 UpdateScreenGfx
  $ABC0,3 set #REGde to high score table
  $ABC8,3 UpdateScreenGfx
  $ABD6,19 update screen colours
b $ABEA Small lookup table used by #R$AAE4 to assign #REGa, for use with GetLookupTableAddress
  $ABEA,8,8
t $ABF2 High score table heading text data
@ $ABF2 label=high_score_heading_text
  $ABF2,16,16
t $AC02 Wizard instructions for redefining the keys
@ $AC02 label=redefine_keys_wizard_text
  $AC02,82,32,10
t $AC54 Alphabet characters, but out of order
B $AC54,2,1
  $AC56,3,3
B $AC59,1,1
  $AC5A,29,29
B $AC77,1,1
  $AC78,4,4
t $AC7C Home screen ticker text
@ $AC7C label=home_screen_ticker_text
  $AC7C,1,1
B $AC7D,1,1
  $AC7E,22,22
N $AC94 Redefine keys text
  $AC94,1,1
B $AC95,1,1
  $AC96,25,25
N $ACAF Instructions text
  $ACAF,1,1
B $ACB0,1,1
  $ACB1,25,25
t $ACCA Instructions screen ticker text
@ $ACCA label=instructions_screen_ticker_text
  $ACCA,1,1
B $ACCB,1,1
  $ACCC,22,22
N $ACE2 Redefine keys text
  $ACE2,1,1
B $ACE3,1,1
  $ACE4,25,25
N $ACFD Select key type
  $ACFD,1,1
B $ACFE,1,1
  $ACFF,34,34
t $AD21 "1,2,3 or 4 players ?" - choose number of players text data
@ $AD21 label=choose_number_of_players_text
  $AD21,30,30
t $AD3F "game over player 1 " text data
@ $AD3F label=game_over_text
  $AD3F,19,19
t $AD52 "level" text (for current level?)
@ $AD52 label=level_text
  $AD52,6,6
w $AD58 Used as an address.
  $AD58,2,2
t $AD5A "OUT OF TIME !" text data
@ $AD5A label=out_of_time_text
  $AD5A,13,13
t $AD67 Congratulate player on new high score, and instructions.
@ $AD67 label=new_high_score_text
  $AD67,165,15
b $AE0C Chuckie Egg theme tune
D $AE0C Notes for the tune; byte 0: length, byte 1: pitch
@ $AE0C label=theme_tune
  $AE0C,94,2
b $AE6A Death tune, played when the farmer, well, dies.
D $AE6A Notes for the tune; byte 0: length, byte 1: pitch
@ $AE6A label=death_tune
  $AE6A,50,2
c $AE9C Called just before showing new level
D $AE9C Used by the routine at #R$a62c.
  $AE9C,14 Point #REGhl to "end" of ATTRIBUTE_FILE, then blank some or all of the screen
  $AEB2,3 UpdateScreenGfx
  $AECA,1 WARNING! opcode: DAA
  $AF10,3 Get current_player
  $AF21,3 UpdateScreenGfx
  $AF2E,3 UpdateScreenGfx
  $AF3B,3 Get number_of_players
  $AF3E,11 Copy current score to player 1 score
  $AF65,3 Get current_player
  $AFB7,3 Get number_of_players
  $AFCD,3 UpdateScreenGfx
  $B010,3 Get current_player
  $B021,3 Get number_of_players
  $B0A6,3 Set #REGa to current game_state.
  $B0A9,2 Is it set to input type selection?
  $B0AB,5 Point #REGhl to input type #2.
  $B0B0,5 Point #REGhl to input type #3.
  $B0B5,3 Point #REGhl to input type #1 (default).
  $B0B8,8 Update the game input control keys with selected input type stored in #REGhl.
  $B0C6,3 Get current_player
  $B102,10 Players score is a multiple of 10,000 points?
  $B10F,3 Get current_player
  $B112,7 Calculate address of lives variable for current player, and assign to #REGhl
  $B11A,1 Load #REGa with remaining lives of current player
  $B12A,3 UpdateScreenGfx
c $B130 Update colours?
D $B130 Used by the routine at #R$ae9c.
  $B135,3 Point #REGhl to start of ATTRIBUTE_FILE.
c $B14F After death, screen is redrawn, before ostriches/farmer displayed
D $B14F Note: exactly same as #R$A389, #R$AAE4, except for #REGhl address.
N $B14F Does accessing #REGhl instruction before the #REGr have any importance? (see "R Register" https://www.worldofspectrum.org/faq/reference/z80reference.htm)
@ $B14F ssub=LD HL,$B15F-$01
  $B152,6 Load #REGb with #REGr (related to memory refresh), then after processing #REGb will have a value between 1-8.
  $B158,4 Increment #REGhl to required address, and assign #REGa.
  $B15C,3 GetLookupTableAddress
b $B15F Small lookup table used by #R$B14F to assign #REGa, for use with GetLookupTableAddress
  $B15F,8,8
t $B167 Source code remnants
D $B167 The source code here corresponds to the code at end of #R$A566...maybe!
  $B167,9,9
B $B170,1,1
B $B171,1,1 is a double quote character
B $B172,1,1
  $B173,13,13
B $B180,1,1
  $B181,1,1
B $B182,1,1
  $B183,11,11
B $B18E,1,1
  $B18F,1,1
B $B190,1,1
  $B191,10,10
B $B19B,1,1
  $B19C,14,14
B $B1AA,1,1
  $B1AB,13,13
B $B1B8,1,1
  $B1B9,10,10
B $B1C3,1,1
  $B1C4,10,10
B $B1CE,1,1
  $B1CF,1,1
B $B1D0,1,1
  $B1D1,9,9
B $B1DA,1,1
  $B1DB,6,6
B $B1E1,1,1
  $B1E2,1,1
B $B1E3,1,1
  $B1E4,12,12
B $B1F0,1,1
  $B1F1,1,1
B $B1F2,1,1
  $B1F3,4,4
B $B1F7,1,1
  $B1F8,1,1
B $B1F9,1,1
  $B1FA,6,6
b $B200 Data block at b200
  $B200,263,8*32,7
t $B307 Source code remnants
D $B307 The source code here corresponds to the code in middle of #R$A59D.
  $B307,11,11
B $B312,1,1
  $B313,1,1
B $B314,1,1
  $B315,8,8
B $B31D,1,1
  $B31E,1,1
B $B31F,1,1
  $B320,16,16
B $B330,1,1
  $B331,14,14
B $B33F,1,1
  $B340,9,9
B $B349,1,1
  $B34A,2,2
c $B34C Note, label added because Pasmo was complaining.
D $B34C Used by the routine at #R$98e6.
@ $B34C label=LB34C
t $B381 Source code remnants
D $B381 The source code here corresponds to the code in middle of #R$A59D.
  $B381,7,7
B $B388,1,1
  $B389,1,1
B $B38A,1,1
  $B38B,7,7
B $B392,1,1
  $B393,1,1
B $B394,1,1
  $B395,10,10
B $B39F,1,1
  $B3A0,1,1
B $B3A1,1,1
  $B3A2,8,8
B $B3AA,1,1
  $B3AB,5,5
b $B3B0 Level 1 layout data - see level_buffer for byte map
@ $B3B0 label=
  $B3B0,672,32
b $B650 Level 2 layout data - see level_buffer for byte map
@ $B650 label=level_2
  $B650,672,32
b $B8F0 Level 3 layout data - see level_buffer for byte map
@ $B8F0 label=level_3
  $B8F0,672,32
b $BB90 Level 4 layout data - see level_buffer for byte map
@ $BB90 label=level_4
  $BB90,672,32
b $BE30 Level 5 layout data - see level_buffer for byte map
@ $BE30 label=level_5
  $BE30,672,32
b $C0D0 Level 6 layout data - see level_buffer for byte map
@ $C0D0 label=level_6
  $C0D0,672,32
b $C370 Level 7 layout data - see level_buffer for byte map
@ $C370 label=level_7
  $C370,672,32
b $C610 Level 8 layout data - see level_buffer for byte map
@ $C610 label=level_8
  $C610,672,32
t $C8B0 Source code remnants?
D $C8B0 The source code here corresponds to the code at ????.
  $C8B0,9,9
B $C8B9,1,1
  $C8BA,1,1
B $C8BB,1,1
  $C8BC,12,12
w $C8C8 An address lookup table for accessing data blocks.
@ $C8C8 label=address_lookup_table
  $C8C8,66,2
s $C90A unused?
  $C90A,34,$22
b $C92C related to address lookup table
  $C92C,12,8,4
b $C938 related to address lookup table
  $C938,20,8*2,4
b $C94C related to address lookup table
  $C94C,12,8,4
b $C958 related to address lookup table
  $C958,14,8,6
b $C966 related to address lookup table
  $C966,26,8*3,2
b $C980 related to address lookup table
  $C980,12,8,4
b $C98C related to address lookup table
  $C98C,16,8
b $C99C related to address lookup table
  $C99C,16,8
b $C9AC related to address lookup table
  $C9AC,20,8*2,4
b $C9C0 related to address lookup table
  $C9C0,22,8*2,6
b $C9D6 related to address lookup table
  $C9D6,14,8,6
b $C9E4 related to address lookup table
  $C9E4,22,8*2,6
b $C9FA related to address lookup table - when player lands on a platform
  $C9FA,16,8
b $CA0A related to address lookup table
  $CA0A,18,8*2,2
b $CA1C related to address lookup table
  $CA1C,18,8*2,2
b $CA2E related to address lookup table
  $CA2E,24,8
b $CA46 related to address lookup table
  $CA46,16,8
b $CA56 related to address lookup table
  $CA56,16,8
b $CA66 related to address lookup table
  $CA66,18,8*2,2
b $CA78 related to address lookup table - related to playing music?
  $CA78,70,8*8,6
b $CABE related to address lookup table
  $CABE,22,8*2,6
b $CAD4 related to address lookup table
  $CAD4,14,8,6
b $CAE2 related to address lookup table
  $CAE2,24,8
b $CAFA related to address lookup table
  $CAFA,26,8*3,2
b $CB14 related to address lookup table
  $CB14,22,8*2,6
b $CB2A related to address lookup table
  $CB2A,20,8*2,4
b $CB3E related to address lookup table
  $CB3E,18,8*2,2
b $CB50 related to address lookup table
  $CB50,20,8*2,4
b $CB64 related to address lookup table
  $CB64,18,8*2,2
b $CB76 related to address lookup table
  $CB76,10,8,2
b $CB80 related to address lookup table
  $CB80,22,8*2,6
b $CB96 related to address lookup table
  $CB96,26,8*3,2
b $CBB0 related to address lookup table
  $CBB0,20,8*2,4
> $CBB0,1 ; The Pasmo assembler uses this directive when generating a tape image.
> $CBB0,1 ; Use the same address as with the ORG directive, to tell Pasmo where
> $CBB0,1 ; to start running the program from here.
> $CBB0,1 end $A410
i $CBC4
