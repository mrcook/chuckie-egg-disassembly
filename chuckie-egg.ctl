> $5EF3 ; SkoolKit disassembly for Chuckie Egg
> $5EF3 ; (https://github.com/mrcook/chuckie-egg-disassembly/)
> $5EF3 ;
> $5EF3 ; Copyright (c) 2018 Michael R. Cook (this disassembly)
> $5EF3 ; Copyright (c) 1984 A&F Software (Chuckie Egg)
> $5EF3 ; Chuckie Egg was designed and developed by Nigel Alderton
> $5EF3 @start=$5ef3
@ $5EF3 org=$5ef3
c $5EF3 NOTE: this is a hack to get the game assembling. It is actually part of the tape loader routine, which includes some nice set up code to make the game assemble out-of-the-box.
C $5EF5,3 Set border (SYSVAR_BORDCR) to $07 (white)
@ $5EF8 ssub=jp $5fb8       ; NOTE: Replace following opcode
i $5EFB Ignore the rest of the tape loader code/data.
c $5FB8 Tape loader "start" routine.
C $5FBB,3 Set SYSVAR_STKBOT variable
C $5FBE,3 Set SYSVAR_STKEND variable
C $5FC1,3 Start the game!
i $5FC4 Ignore the rest of the tape loader code/data.
i $61A8 Level Buffer (empty level): $02A0 bytes in size.
D $61A8 Screen map data is copied to this buffer at the start of each new level. Each byte represents a tile ID, with 20 tile GFX in total. #TABLE(default,centre,:w) { =h Byte | =h Tile } { 00 | Blank Tile } { 01 | Ladder #1 (left) } { 02 | Ladder #2 (right) } { 03 | Egg } { 04 | Corn } { 05 | Floor } { A8 | Birdcage: handle #1 } { A9 | Birdcage: handle #2 } { AA | Birdcage: #01 (top) } { AB | Birdcage: #02 (top) } { AC | Birdcage: #03 (top) } { AD | Birdcage: #04 (top) } { AE | Birdcage: #05 (middle) } { AF | Birdcage: #06 (middle) } { B0 | Birdcage: #07 (middle) } { B1 | Birdcage: #08 (middle) } { B2 | Birdcage: #09 (bottom) } { B3 | Birdcage: #10 (bottom) } { B4 | Birdcage: #11 (bottom) } { B5 | Birdcage: #12 (bottom) } TABLE#
i $6448 This area is unused for gameplay, although it was used during game loading.
s $6EC8 Current player score.
D $6EC8 Each byte represents one decimal digit of the 6 digit score.
@ $6EC8 label=current_score
S $6EC8,6,$06
s $6ECE Saved score for player 1.
@ $6ECE label=score_p1
S $6ECE,6,$06
s $6ED4 Saved score for player 2.
@ $6ED4 label=score_p2
S $6ED4,6,$06
s $6EDA Saved score for player 3.
@ $6EDA label=score_p3
S $6EDA,6,$06
s $6EE0 Saved score for player 4.
@ $6EE0 label=score_p4
S $6EE0,6,$06
b $6EE6 Current player cleared eggs counter
D $6EE6 Copied from the current player variable on level start, saved to the player variable on dying.
@ $6EE6 label=cleared_eggs
B $6EE6,1,1
b $6EE7 Save cleared eggs count for player 1.
@ $6EE7 label=egg_count_p1
B $6EE7,1,1
b $6EE8 Save cleared eggs count for player 2.
@ $6EE8 label=egg_count_p2
B $6EE8,1,1
b $6EE9 Save cleared eggs count for player 3.
@ $6EE9 label=egg_count_p3
B $6EE9,1,1
b $6EEA Save cleared eggs count for player 4.
@ $6EEA label=egg_count_p4
B $6EEA,1,1
b $6EEB Current player cleared levels counter
D $6EEB Copied from the current player variable on level start, saved to the player variable on dying.
@ $6EEB label=cleared_levels
B $6EEB,1,1
b $6EEC Save levels cleared count for player 1.
@ $6EEC label=level_count_p1
B $6EEC,1,1
b $6EED Save levels cleared count for player 2.
@ $6EED label=level_count_p2
B $6EED,1,1
b $6EEE Save levels cleared count for player 3.
@ $6EEE label=level_count_p3
B $6EEE,1,1
b $6EEF Save levels cleared count for player 4.
@ $6EEF label=level_count_p4
B $6EEF,1,1
b $6EF0 Remaining lives for player 1.
@ $6EF0 label=lives_p1
B $6EF0,1,1
b $6EF1 Remaining lives for player 2.
@ $6EF1 label=lives_p2
B $6EF1,1,1
b $6EF2 Remaining lives for player 3.
@ $6EF2 label=lives_p3
B $6EF2,1,1
b $6EF3 Remaining lives for player 4.
@ $6EF3 label=lives_p4
B $6EF3,1,1
s $6EF4 Unused.
S $6EF4,940,$03ac
s $72A0 Sprite buffer.
@ $72A0 label=sprite_buffer
S $72A0,56,$38
b $72D8 X position of the Farmer.
@ $72D8 label=farmer_pos_x
B $72D8,1,1
b $72D9 Y position of the Farmer.
@ $72D9 label=farmer_pos_y
B $72D9,1,1
b $72DA Animation frame counter.
D $72DA Frame values are from 0 to 3
@ $72DA label=anim_frame
B $72DA,1,1
b $72DB Direction the Farmer is facing.
D $72DB #TABLE(default,centre,:w) { =h Byte | =h Direction } { 00 | Right } { 04 | Left } { 0D | Forward (Climbing) } TABLE#
@ $72DB label=farmer_direction
B $72DB,1,1
b $72DC Unknown variable.
B $72DC,1,1
s $72DD Sprite/background composition buffer
D $72DD Current background tiles are loaded then the sprite data is merged.
@ $72DD label=screen_buffer
S $72DD,72,$48
b $7325 Farmer is airbourne?
D $7325 Values: $00=grounded, $02=airbourne.
@ $7325 label=farmer_airbourne
B $7325,1,1
b $7326 Farmer jumping direction.
D $7326 #TABLE(default,centre,:w) { =h Byte | =h Direction } { 00 | Straight up } { 01 | Right } { FF | Left } TABLE#
@ $7326 label=farmer_jump_dir
B $7326,1,1
b $7327 Variable related to the Farmer jumping.
B $7327,1,1
b $7328 Variable related to the Farmer jumping.
B $7328,1,1
b $7329 Unused?
B $7329,1,1
b $732A Direction Farmer is travelling while airbourne.
D $732A Values: $01=up, $FF=down.
@ $732A label=farmer_air_dir
B $732A,1,1
b $732B Unknown counter variable, but seems related to the ticker text at bottom of screen.
D $732B Counts $08 to $01, and loops.
B $732B,1,1
b $732C Unknown counter variable.
B $732C,1,1
b $732D Menu screen ID.
D $732D ID changes depending on what screen should be displayed, except when on the Instructions screen where the values relate to the selected input type menu. #TABLE(default,centre,:w) { =h Byte | =h state } { 03 | Redefine keys } { 05 | Select input type } { 06 | Intro music } { 0A | Instructions: Input type 1=$06, 2=$05, 3=$03 } TABLE#
@ $732D label=game_state
B $732D,1,1
w $732E Keyboard address for: UP key
@ $732E label=key_up
W $732E,2,2
w $7330 Keyboard address for: DOWN key
@ $7330 label=key_down
W $7330,2,2
w $7332 Keyboard address for: LEFT key
@ $7332 label=key_left
W $7332,2,2
w $7334 Keyboard address for: RIGHT key
@ $7334 label=key_right
W $7334,2,2
w $7336 Keyboard address for: JUMP key
@ $7336 label=key_jump
W $7336,2,2
w $7338 Keyboard address for: Alternative JUMP key
@ $7338 label=key_jump_2
W $7338,2,2
b $733A Total number of players for the current game?
D $733A Possible values are 1, 2, 3, and 4.
@ $733A label=number_of_players
B $733A,1,1
b $733B Current active player.
D $733B Possible values are 1, 2, 3, and 4.
@ $733B label=current_player
B $733B,1,1
b $733C Unknown variable the flips between 1 and 2.
B $733C,1,1
w $733D Screen address of a 6-digit score for the active player.
D $733D Position is calculated from the left with the following tile LSB values: P1=$05, P2=$0C, P3=$13, P4=$1A. Note: the MSB is always $40.
W $733D,2,2
b $733F Bonus: 3 decimal digits.
D $733F This counts down in 10's, so the 4th digit isn't needed.
@ $733F label=bonus_timer
B $733F,3,3
b $7342 Time: 3 decimal digits.
@ $7342 label=main_timer
B $7342,3,3
b $7345 Timer sub-counter.
D $7345 The clock ticks about 20 times per second, and this counter ticks 10 times per clock tick - this info needs clarifying!
@ $7345 label=main_sub_timer
B $7345,1,1
b $7346 Bonus clock sub-counter.
D $7346 The bonus ticks about 7 times per second, and this counter ticks 64 times per clock tick - this info needs clarifying!
@ $7346 label=bonus_sub_timer
B $7346,1,1
b $7347 Unknown variables: seemd to always be $01.
B $7347,1,1
b $7348 Unknown variables: seemd to always be $08.
B $7348,1,1
b $7349 Unknown variables: seemd to always be $98.
B $7349,1,1
b $734A Unknown variable. On level start, counts up from $00 to $05, then remains there for the rest of the level.
B $734A,1,1
b $734B Unknown variable. On level start, counts down from $F to $FB, then remains there for the rest of the level.
B $734B,1,1
b $734C Another counter: counting from $0C to $01.
B $734C,1,1
b $734D Bit. Flips from 0 to 1 when the above counter restarts.
B $734D,1,1
w $734E Unknown variable, seems to hold 0x0505 for the whole level.
W $734E,2,2
b $7350 Unknown variable. Seems to hold $FF the whole level.
B $7350,1,1
b $7351 Unknown variable.
B $7351,1,1
w $7352 Unknown variable.
W $7352,2,2
b $7354 Unknown variable.
B $7354,1,1
b $7355 Unknown variable.
B $7355,1,1
b $7356 Unknown variable.
B $7356,1,1
b $7357 Robot Hens.
D $7357 #TABLE(default,centre,:w) { =h Bytes(n) | =h Meaning } { 0 | X position } { 1 | Y position } { 2 | ? } { 3 | Always $00? } TABLE#
@ $7357 label=robot_hen_1
@ $735B label=robot_hen_2
@ $735F label=robot_hen_3
@ $7363 label=robot_hen_4
@ $7367 label=robot_hen_5
B $7357,20,4
b $736B Another counter: counts from $03 to $01, and loops.
B $736B,1,1
w $736C Another counter: counts $00 to $FF, and loops.
W $736C,2,2
b $736E Unknown.
B $736E,1,1
b $736F Music play state
D $736F Strange that 00 means "play music" - probably need a more appropriate label. #TABLE(default,centre,:w) { =h Byte | =h state } { 00 | play } { 01 | stopped } TABLE#
@ $736F label=music_play_state
B $736F,1,1
b $7370 SFX Timer, when collecting eggs/corn.
@ $7370 label=sfx_timer
B $7370,1,1
b $7371 Unused?
B $7371,2,2
b $7373 State variable for lookup table routine #R$9CEB.
B $7373,1,1
w $7374 Lookup table address saved here by #R$9CEB.
W $7374,2,2
i $7376 Unused.
w $8250 Keyboard Controls #1: 2, W, 9, 0, Z or M.
@ $8250 label=key_input_type_1
W $8250,12,2
w $825C Keyboard Controls #2: Cursor Keys, 4 or S.
@ $825C label=key_input_type_2
W $825C,12,2
w $8268 Keyboard Controls #3: Q, A, O, P, M or 1.
@ $8268 label=key_input_type_3
W $8268,12,2
s $8274 Really unused?
S $8274,194,$c2
t $8336 Ticker text
D $8336 'press R to redefine keys * press S to start game * press 1, 2 or 3 to select key type'
@ $8336 label=msg_ticker
T $8336,90,5:n1:1:n1:2:n1:8:n1:4,n2,5:n1:1:n1:2:n1:5:n1:4,n2:5:n1:3:n1:2:n1:1,n1:2:n1:6:n1:3:n1:4,n8
t $8390 Instructions screen redefine keys text
D $8390 'key types 1 & 2 are present and' 'cannot be changed but the type 3' 'keys are user defineable.      '
@ $8390 label=msg_redefine_text
T $8390,96,31,n1,6:n1:2:n1:7:n1:3:n1:3:n1:4,n1,1:3:n1:5:n1,1:n1:1:n1:1:n1:3:n1:6:n1:3,n2
t $83F0 Instructions screen key types table
@ $83F0 label=msg_key_types
T $83F0,96,32
b $8450 Unused data block?
B $8450,32,8
s $8470 Unused?
S $8470,14,$0e
t $847E Instructions screen KEYS heading
D $847E 'KEYS'
@ $847E label=msg_keys_heading
T $847E,4,4
s $8482 Unused
S $8482,25,$19
t $849B Instructions screen objective text
D $849B 'objective- to collect eggs from the hen-house.'
@ $849B label=msg_instructions_objective
T $849B,14,3:n1:10
B $84A9,7,7
T $84B0,31,10:n1:2:n1:7:n1:4:n1:4
s $84CF Unused
S $84CF,11,$0b
t $84DA Instructions screen heading
D $84DA 'INSTRUCTIONS'
@ $84DA label=msg_instructions_heading
T $84DA,12,12
s $84E6 Unused?
S $84E6,10,$0a
b $84F0 Blank tile graphic
D $84F0 address from which the following graphics are accessed.
@ $84F0 label=gfx_tile_blank
B $84F0,8,8
b $84F8 Ladder tile graphic (16x8)
D $84F8 #HTML[#UDGARRAY2;$84F8-$8507-8(gfx_tile_ladder)]
@ $84F8 label=gfx_tile_ladder
B $84F8,16,8
b $8508 Egg item graphic
D $8508 #HTML[#UDG$8508(gfx_item_egg)]
@ $8508 label=gfx_item_egg
B $8508,8,8
b $8510 Corn item graphic
D $8510 #HTML[#UDG$8510(gfx_item_corn)]
@ $8510 label=gfx_item_corn
B $8510,8,8
b $8518 Floor tile graphic
D $8518 #HTML[#UDG$8518(gfx_tile_floor)]
@ $8518 label=gfx_tile_floor
B $8518,8,8
b $8520 Unknown ad unused?
B $8520,40,8
b $8548 "SCORE" label graphic (24x8)
D $8548 #HTML[#UDGARRAY3;$8548-$855F-8(labels_score)]
@ $8548 label=gfx_label_score
B $8548,24,8
b $8560 "PLAYER" label graphic (32x8)
D $8560 #HTML[#UDGARRAY4;$8560-$857F-8(labels_player)]
@ $8560 label=gfx_label_player
B $8560,32,8
b $8580 "TIME" label graphic (24x8)
D $8580 #HTML[#UDGARRAY3;$8580-$8597-8(labels_time)]
@ $8580 label=gfx_label_time
B $8580,24,8
b $8598 "A+F SOFTWARE" logo text (48x8)
D $8598 #HTML[#UDGARRAY6;$8598-$85C7-8(labels_af_software)]
@ $8598 label=gfx_text_afsoftware
B $8598,48,8
b $85C8 "BONUS" label graphic (24x8)
D $85C8 #HTML[#UDGARRAY3;$85C8-$85DF-8(labels_bonus)]
@ $85C8 label=gfx_label_bonus
B $85C8,24,8
b $85E0 "LE" text (8x8) - unknown usage
D $85E0 #HTML[#UDGARRAY3;$85E0-$85E7-8(labels_le)]
@ $85E0 label=gfx_text_le
B $85E0,8,8
b $85E8 Unused?
B $85E8,8,8
b $85F0 Font: A-Z, numbers, punctuation, and other symbols.
D $85F0 #HTML[#FONT:( !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ)$85F0(font_complete)]
@ $85F0 label=font_all
B $85F0,472,8
s $87C8 Unused font space?
S $87C8,48,$30
b $87F8 Font: A-Z bold
D $87F8 #HTML[#FONT:(ABCDEFGHIJKLMNOPQRSTUVWXYZ)$87F8(font_az_bold)]
@ $87F8 label=font_az_bold
B $87F8,208,8
b $88C8 Font: Bullet point graphic
D $88C8 Used to separate the scrolling ticker text: Start, Redefine, Insturctions. #HTML[#UDG$88C8(font_gfx_bullet)]
@ $88C8 label=font_bullet_point
B $88C8,8,8
s $88D0 Unused font space?
S $88D0,16,$10
b $88E0 Font: Registered symbol graphic
D $88E0 #HTML[#UDG$88E0(font_gfx_registered_symbol)]
@ $88E0 label=font_registered_symbol
B $88E0,8,8
b $88E8 Font: Copyright symbol graphic
D $88E8 #HTML[#UDG$88E8(font_gfx_copyright_symbol)]
@ $88E8 label=font_copyright_symbol
B $88E8,8,8
b $88F0 Used but unknown (graphics?) data
B $88F0,120,8
b $8968 "A+F CHUCKIE EGG" text graphic
D $8968 Use as the default name in the high score table. #HTML[#UDGARRAY8;$8968-$89A7-8(text_highscore_default_name)]
@ $8968 label=gfx_text_highscore_default_name
B $8968,64,8
b $89A8 Font: Abbreviations for SP, CS, SS, EN (32x8)
D $89A8 #HTML[#UDGARRAY4;$89A8-$89C7-8(font_gfx_abbreviations)]
@ $89A8 label=font_abbreviation_symbols
B $89A8,32,8
b $89C8 "LEVEL" label graphic (24x8)
D $89C8 #HTML[#UDGARRAY3;$89C8-$89DF-8(labels_level)]
@ $89C8 label=gfx_label_level
B $89C8,24,8
b $89E0 Font: Numbers bold (used in the scores, level, etc.)
D $89E0 #HTML[#FONT:(0123456789)$89E0(font_numbers_bold)]
@ $89E0 label=font_numbers_bold
B $89E0,80,8
b $8A30 Birdcage handle graphic tiles (16x8)
D $8A30 #HTML[#UDGARRAY2;$8A30-$8A3F-8(level_gfx_birdcage_handle)]
@ $8A30 label=gfx_tile_birdcage_handle
B $8A30,16,8
b $8A40 Birdcage graphic tiles (32x24)
D $8A40 #HTML[#UDGARRAY4;$8A40-$8A9F-8(level_gfx_birdcage)]
@ $8A40 label=gfx_tile_birdcage
B $8A40,96,8
b $8AA0 Player "lives" icon graphic
D $8AA0 #HTML[#UDG$8AA0(level_gfx_lives_counter)]
@ $8AA0 label=gfx_icon_lives
B $8AA0,8,8
b $8AA8 High score table "cursor" icon graphic
D $8AA8 #HTML[#UDG$8AA8(level_gfx_highscore_cursor)]
@ $8AA8 label=gfx_icon_highscore_cursor
B $8AA8,8,8
b $8AB0 "UP" heading graphic for instructions screen (24x8)
D $8AB0 #HTML[#UDGARRAY3;$8AB0-$8AC7-8(instructions_heading_up)]
@ $8AB0 label=instructions_heading_up
B $8AB0,24,8
b $8AC8 "DOWN" heading graphic for instructions screen (24x8)
D $8AC8 #HTML[#UDGARRAY3;$8AC8-$8ADF-8(instructions_heading_down)]
@ $8AC8 label=instructions_heading_down
B $8AC8,24,8
b $8AE0 "LEFT" heading graphic for instructions screen (24x8)
D $8AE0 #HTML[#UDGARRAY3;$8AE0-$8AF7-8(instructions_heading_left)]
@ $8AE0 label=instructions_heading_left
B $8AE0,24,8
b $8AF8 "RIGHT" heading graphic for instructions screen (24x8)
D $8AF8 #HTML[#UDGARRAY3;$8AF8-$8B0F-8(instructions_heading_right)]
@ $8AF8 label=instructions_heading_right
B $8AF8,24,8
b $8B10 "JUMP" heading graphic for instructions screen (24x8)
D $8B10 #HTML[#UDGARRAY4;$8B10-$8B2F-8(instructions_heading_jump)]
@ $8B10 label=instructions_heading_jump
B $8B10,32,8
b $8B30 "TYPE" heading graphic for instructions screen (32x8)
D $8B30 #HTML[#UDGARRAY4;$8B30-$8B4F-8(instructions_heading_type)]
@ $8B30 label=instructions_heading_type
B $8B30,32,8
i $8B50 Unknown, unused?
b $8DF0 Farmer sprites animation data: right facing
@ $8DF0 label=sprites_farmer_right
B $8DF0,128,8
b $8E70 Farmer sprites animation data: left facing
@ $8E70 label=sprites_farmer_left
B $8E70,128,8
b $8EF0 Duck sprites animation data: right facing (2 of 16x16)
@ $8EF0 label=sprites_duck_right
B $8EF0,64,8
b $8F30 Duck sprites animation data: left facing (2 of 16x16)
@ $8F30 label=sprites_duck_left
B $8F30,64,8
b $8F70 Data here is copied to 72A0
B $8F70,32,8
b $8F90 Farmer sprites animation data: climbing stairs
@ $8F90 label=sprites_farmer_climbing
B $8F90,128,8
b $9010 Ostrich sprites data: left facing (16x16)
@ $9010 label=sprites_ostrich_left
B $9010,32,8
b $9030 Ostrich sprites data: right facing (16x16)
@ $9030 label=sprites_ostrich_right
B $9030,32,8
b $9050 Ostrich sprites animation data: climbing (2 of 16x16)
@ $9050 label=sprites_ostrich_climbing
B $9050,64,8
b $9090 Ostrich sprites data: left walking (16x16)
@ $9090 label=sprites_ostrich_left_walk
B $9090,32,8
b $90B0 Ostrich sprites data: right walking (16x16)
@ $90B0 label=sprites_ostrich_right_walk
B $90B0,32,8
b $90D0 Ostrich sprites data: eating left facing (16x16)
@ $90D0 label=sprites_ostrich_eating_left
B $90D0,32,8
b $90F0 Ostrich sprites data: eating right facing (16x16)
@ $90F0 label=sprites_ostrich_eating_right
B $90F0,32,8
b $9110 Some odd graphics/data...unusued?
B $9110,14,8,6
c $911E Move the Ostriches
D $911E Runs from start of level, after everything has been rendered
R $911E Used by the routine at #R$98e6.
C $9128,9 Increment value stored @736C, then set its MSB(?) to $00
C $9133,4 Jump if BIT 0 of the byte stored at address #REGhl is set.
c $9178 Seems to run every loop
D $9178 Used by the routine at #R$911e.
C $91C7,4 If bit 1 of the value stored @736C is set, do not jump to @91DF
c $91CB An alt routine @91DF ?
D $91CB Used by the routine at #R$91df.
c $91DF An alt routine @91CB ?
D $91DF Used by the routines at #R$9178 and #R$91cb.
c $91F3 Seems to run every loop
D $91F3 Used by the routine at #R$9178.
C $9237,4 If bit 1 of the value stored @736C is set, do not jump to @9250
c $923B An alt routine to @9250 ?
D $923B Used by the routine at #R$9250.
c $9250 An alt routine to @923B ?
D $9250 Used by the routines at #R$91f3 and #R$923b.
c $9265 Check if an Ostrich can eat some corn.
D $9265 Used by the routine at #R$9178.
C $9265,3 Backup registers
C $9294,3 Pop all to #REGhl rather than #REGde, #REGhl, #REGbc.
c $9298 Routine to restore (POP) all #REGde, #REGhl, #REGbc registers
D $9298 Used by the routine at #R$9265.
@ $9298 label=Restore16bitRegisters
c $929C Check if player has collided with an Ostrich.
D $929C Used by the routines at #R$911e, #R$9178, #R$91f3 and #R$9265.
C $929C,1 POKE to 201 (`RET`) to vanquish Ostriches
c $92C2 Routine at 92c2
D $92C2 Used by the routine at #R$929c.
@ $92F6 ssub=ld hl,$8f90+$7e ; Point #REGhl to end of SPRITES_FARMER_WALK
c $935F Routine at 935f
D $935F Used by the routine at #R$92c2.
@ $9398 ssub=ld hl,$84f0+$07 ; Point #REGhl to last byte of gfx_tile_blank
c $93DD Get the screen and attributes address of a sprite
D $93DD Used by the routines at #R$92c2 and #R$935f.
R $93DD Input: HL y/x coordinates
R $93DD Output: DE screen address
R $93DD HL attribute address
C $93E5,3 Point #REGhl to start of ATTRIBUTE_FILE.
c $93FE Get room buffer location at the specified coordinate
D $93FE Input: HL y/x coordinate Output: HL address inside the room buffer
c $9404 Get screen address of a sprite
D $9404 Input: HL y/x coordinates Output: HL screen address
C $9404,3 Backup #REGaf, #REGde, #REGbc registers
C $9408,3 Load #REGhl with start of DISPLAY_FILE.
C $940B,3 Load #REGbc with value of 2048 (1/3 of screen)
C $9434,3 Restore #REGaf, #REGde, #REGbc registers
c $9438 Get the gfx at the specified location
D $9438 Used by the routines at #R$9178, #R$91cb, #R$91df, #R$91f3, #R$923b and #R$9250.
c $943E Unused routine?
c $9440 Unused routine?
b $9446 Data block at 9446
B $9446,1,1
c $9447 Unused code?
b $945B Some of these byte are copied to 7357.
B $945B,221,8*27,5
c $9538 Redraw the attributes after a sprite moves
D $9538 Used by the routines at #R$98e6, #R$a0c8, #R$a22a and #R$a2b5.
c $9584 Get an attribute address for the given coordinates
D $9584 Input: DE coordinates to convert Output: HL attribute address
C $958C,3 Point #REGhl to start of ATTRIBUTE_FILE.
c $95A6 Get the location in the room buffer for a coordinate.
D $95A6 Input: HL y/x coordinates to convert Output: HL location in the buffer
s $95C5 Unused?
S $95C5,107,$6b
b $9630 Home screen/high score table text data
D $9630 As displayed after game load, and game over. Note: the screen is loaded bottom to top.
@ $9630 label=home_screen
B $9630,28,8*3,4
T $964C,14,2:n2:10
B $965A,14,8,6
T $9668,14,1:n1:2:n1:1:n1:7
B $9676,15,8,7
T $9685,12,2:n1:5:n1:3
B $9691,19,8*2,3
T $96A4,6,1:n1:4
B $96AA,147,8*18,3
T $973D,8,8
B $9745,17,8*2,1
T $9756,14,1:n1:1:n1:1:n1:8
b $9764 Data block at 9764
B $9764,7,7
b $976B Data block at 976b
B $976B,1,1
b $976C Data block at 976c
B $976C,6,6
b $9772 Data block at 9772
B $9772,1,1
b $9773 Data block at 9773
B $9773,1,1
b $9774 Data block at 9774
B $9774,6,6
b $977A Data block at 977a
B $977A,1,1
b $977B Data block at 977b
B $977B,1,1
b $977C Data block at 977c
B $977C,8,8
b $9784 Data block at 9784
B $9784,1,1
b $9785 Data block at 9785
B $9785,2,2
b $9787 Data block at 9787
B $9787,40,8
t $97AF High score table with name/score columns
@ $97AF label=scoreboard
B $97AF,160,c1:8:c7
b $984F Unknown/unused bytes.
B $984F,9,8,1
c $9858 Run the game
D $9858 Used by the routines at #R$99dc and #R$ae9c.
@ $9858 label=RunGame
C $9858,3 reads SYSVAR_ERR_SP
N $98BE Pause or abort the game if the appropriate keys are pressed
C $98DC,10 Called after pressing `CAPSHIFT`, and waiting for keyboard A or H.
c $98E6 Routine at 98e6
D $98E6 Used by the routine at #R$9858.
C $98EF,1 POKE to 0 (`NOP`) to get infinite TIME
C $98FC,1 POKE to 0 (`NOP`) to make giant duck very slow
C $98FD,2 POKE to 24 (`JR nnnn`) to vanquish giant duck
N $9915 Travel upwards on an elevator
C $9925,1 POKE to 0 (`NOP`) to get infinite BONUS
C $9938,1 POKE to `0` (NOP) to slow Ostriches
N $994F Check for user input
@ $9955 ssub=ld a,($7336+$01)
C $9955,16 JUMP keypress
@ $9965 ssub=ld a,($7338+$01)
C $9965,16 key_jump_2 keypress
C $9975,24 Load bytes into @72D8 + 77, 78, 79, 80, 82, and 125.
@ $9991 ssub=ld a,($7334+$01)
C $9991,16 RIGHT keypress
@ $99A5 ssub=ld a,($7332+$01)
C $99A5,16 LEFT keypress
N $99DC This entry point is used by the routine at #R$9858.
C $99DC,3 Jump point
c $99DF Checks if the player has picked up an egg or some corn
D $99DF Used by the routine at #R$98e6.
c $9A17 Routine at 9a17
D $9A17 Used by the routine at #R$99df.
c $9A2C Unused code?
c $9A38 Unused code?
b $9A47 Unused?
B $9A47,5,5
c $9A4C Fetches and draws a sprite
D $9A4C Used by the routines at #R$9d08, #R$9e98, #R$a0c8, #R$a278 and #R$a37f.
R $9A4C Input: HL y/x coordinates
R $9A4C Output: A is the ID of the sprite to draw
C $9A53,3 Point #REGhl to the start of the sprites data
C $9A69,16 Copy current sprite to the sprite_buffer
C $9A80,19 Rotate bytes in the sprite_buffer...why?
C $9A95,4 Point #REGix to beginning of screen_buffer
C $9A9A,3 Point #REGhl to beginning of level_buffer
C $9ABB,22 Point #REGhl to one of the GFX tiles (offset from gfx_tile_blank)
C $9AD1,13 Copy GFX tile data to the screen_buffer
C $9AF8,2 Jump back until screen_buffer is holds all tile data.
C $9B05,19 Copy the 48 bytes of screen_buffer to sprite_buffer, merging with the current sprite data there.
C $9B1A,3 Load #REGhl with start of DISPLAY_FILE.
C $9B1D,3 Load #REGbc with value of 2048 (1/3 of screen)
C $9B4E,35 Draw sprite to screen
C $9B90,14 Update sprite colours to $06: INK=yellow, PAPER=black, BRIGHT=0.
@ $9BCB keep
c $9BDE Calculates current position of sprite in ATTRIBUTE_FILE.
D $9BDE Input: HL y/x coordinates Output: DE attributes address
@ $9BDE label=SpritePositionInAttrFile
C $9BE6,3 Point #REGhl to start of ATTRIBUTE_FILE.
s $9BFF Unused
S $9BFF,65,$41
c $9C40 Print a string of UDGs
D $9C40 Called when needing to draw a level...works on 1/3 of screen at a time?
R $9C40 Input: DE address of gfx
R $9C40 H is the y position
R $9C40 L is the x position
@ $9C40 label=UpdateScreenGfx
C $9C40,4 Why are these NOPs? Are they ever changed?
C $9C44,4 Backup 16-bit registers.
C $9C48,1 #REGa=screen section: $08=2/3, $10=3/3, else 1/3.
C $9C49,1 Backup #REGhl to #REGde#REGhl
C $9C4A,3 point #REGhl to start of DISPLAY
C $9C4D,3 load #REGbc with 2048 - one third of a screen
C $9C50,4 Update 1/3 of screen?
C $9C54,4 Update 2/3 of screen?
C $9C58,1 Update 3/3 of screen.
C $9C7C,1 Restore #REGhl with value in #REGde
C $9C7D,12 set #REGhl to gfx_tile_blank, then update this section of the screen (address of #REGde) with all GFX tiles.
C $9C89,4 Restore 16-bit registers and RETurn
c $9C8E Unused code? Same as last 3 instructions of previous routine, at 9C8B.
s $9C91 Unused
S $9C91,11,$0b
c $9C9C INTERUPT (IM2) jump point
s $9C9F Unused
S $9C9F,5,$05
c $9CA4 Play a sound
D $9CA4 This routine produces a sound, formed of a square wave.
R $9CA4 Input: H is the frequency
R $9CA4 L is the length of the sound
@ $9CA4 label=SoundSquareWave
s $9CB5 Unused
S $9CB5,13,$0d
c $9CC2 Play Fuller Orator - called from INTERUPT (IM2)
D $9CC2 This routine is called every game loop?
R $9CC2 Used by the routine at #R$9c9c.
c $9CEB Set up a sound to play through the Fuller Orator
D $9CEB Get address value from the address_lookup_table
R $9CEB Input: A sound data
@ $9CEB label=GetLookupTableAddress
C $9CEB,1 Current known values for #REGa are between $01 and $21.
@ $9CF2 ssub=ld hl,$c8c8-$02 ; Point #REGhl to address_lookup_table - 2 bytes, to account for increment
C $9CF5,4 Increment #REGhl until we get the desired address.
C $9CF9,3 Load #REGde with address from lookup table
C $9CFC,4 Save address to 7374
C $9D02,3 Set 7373 to $01
s $9D06 Unused
S $9D06,2,$02
c $9D08 Check for left or right input, and move the player accordingly
D $9D08 Used by the routine at #R$98e6.
@ $9D36 ssub=ld a,($7332+$01)
C $9D36,16 LEFT keypress
@ $9D6F ssub=ld a,($7334+$01)
C $9D6F,16 RIGHT keypress
s $9DF1 Unused
S $9DF1,67,$43
c $9E34 Get the UDG at the specified location
D $9E34 Used by the routines at #R$9265, #R$93fe, #R$9438, #R$99df, #R$a30c and #R$b34c.
R $9E34 Input: HL y/x coordinate
R $9E34 Output: HL address in the room buffer
R $9E34 A holds the relevant UDG
c $9E57 Unused code?
s $9E59 Unused
S $9E59,13,$0d
c $9E66 Checks if there's enough headroom for a jump.
D $9E66 Used by the routine at #R$9858.
R $9E66 Output: A is 1 if there is room, otherwise 0
@ $9E66 label=FarmerVerticalMovement
C $9E8A,1 Reset mid-air farmer routine
s $9E8D Unused
S $9E8D,11,$0b
c $9E98 Move the player onto a ladder
D $9E98 Used by the routine at #R$98e6.
@ $9EC7 ssub=ld a,($732e+$01)
C $9EC7,58 UP keypress
@ $9F01 ssub=ld a,($7330+$01)
C $9F01,62 DOWN keypress
s $9F3F Unused
S $9F3F,33,$21
c $9F60 Move the player off a ladder
D $9F60 Used by the routine at #R$98e6.
@ $9F8A ssub=ld a,($7332+$01)
C $9F8A,21 LEFT keypress
c $9FB5 Routine at 9fb5
D $9FB5 Used by the routine at #R$9f60.
@ $9FB5 ssub=ld a,($7334+$01)
C $9FB5,15 RIGHT keypress
s $9FDF Unused
S $9FDF,53,$35
c $A014 Move the lifts
D $A014 Used by the routine at #R$98e6.
c $A07B Invalidate a lift
D $A07B Used by the routine at #R$a014.
R $A07B Input: HL screen position to invalidate
@ $A07B label=ElevatorPlatformDraw
c $A096 Calculate position of next platform?
D $A096 Used by the routine at #R$a07b.
@ $A096 label=ElevatorPlatformCalculatePos
c $A0A9 Calculations related to elevator position? Draw a lift?
D $A0A9 Used by the routine at #R$a014.
R $A0A9 Input: HL screen position
@ $A0A9 label=ElevatorCalculatePos
c $A0C0 Unused code?
D $A0C0 Note same as last instructions of previous routine
b $A0C5 Unused bytes/code?
B $A0C5,3,3
c $A0C8 Move the mother duck
D $A0C8 Could be giant duck code or another elevator related routine, called after bigger movement of platform.
R $A0C8 Used by the routine at #R$98e6.
N $A16E On level 8 and below, ignore the new position and stick the mother duck to the cage
s $A19A Unused
S $A19A,30,$1e
c $A1B8 Decreases the timer and bonus
D $A1B8 Used by the routines at #R$98e6 and #R$a62c.
N $A1C7 This entry point is used by the routine at #R$a1d9.
c $A1D9 Routine at a1d9
D $A1D9 Used by the routine at #R$a1b8.
N $A1DE This entry point is used by the routine at #R$a1b8.
C $A201,16 Display a number from font_numbers_bold
b $A21A Unused code/bytes? (code would be a RET)
B $A21A,2,2
c $A21C Check if the farmer is falling.
D $A21C See if the player is now in mid-air, and if so, make them fall
R $A21C Used by the routine at #R$9858.
c $A256 Move the player up or down after jumping or falling
D $A256 Used by the routine at #R$a22a.
c $A294 Make the player fall if in mid-air
D $A294 Used by the routine at #R$a22a.
N $A2B5 This entry point is used by the routine at #R$a21c.
c $A30C Farmer jumping/falling related routine.
D $A30C Used by the routine at #R$a2b5.
N $A30F This entry point is used by the routine at #R$a294.
c $A37F Redraw the player's position after moving in mid-air
D $A37F Used by the routines at #R$a294 and #R$a30c.
c $A389 Play a random sound through the Fuller Audiobox
D $A389 Farmer lands on a platform?
R $A389 Note: exactly same as #R$AAE4, #R$B14F, except for #REGhl address.
@ $A38F ssub=ld hl,$a399-$01
C $A389,9 Load #REGb with #REGr (related to memory refresh), then after processing #REGb will have a value between 1-8.
C $A392,4 Increment #REGhl to required address, and assign #REGa.
C $A396,3 GetLookupTableAddress
b $A399 Small lookup table used by #R$A389 to assign #REGa, for use with GetLookupTableAddress
B $A399,8,8
b $A3A1 Data block at a3a1
B $A3A1,6,6
c $A3A7 Update the score
D $A3A7 Farmer collects an egg/corn...also at start of level.
R $A3A7 Used by the routines at #R$99df, #R$9a17, #R$9a38, #R$a62c and #R$ae9c.
N $A3A7 Input: R is the type of object that has scored points
C $A3C5,3 Get current_player
C $A3E3,3 UpdateScreenGfx
b $A40F Unused?
B $A40F,1,1
c $A410 The game has just loaded
D $A410 Used by the routine at #R$9858.
@ $A410 label=GameStart
C $A410,5 Set game_state to "Play Tune" -- POKE @A411 (the address value) to `003` to mute music notes (on game start only)
C $A415,5 Set music_play_state to "play"
C $A41E,2 Interupt Mode: determine when and what an interrupt does
c $A420 Display the home screen, which includes the scoreboard
D $A420 Note: this routine is very similar to the DisplayInstructionsScreen routine.
@ $A420 label=DisplayHomeScreen
C $A420,3 ClearScreen
C $A42B,3 UpdateScreenGfx
C $A43B,3 DisplayScoreboard
C $A43E,3 Point #REGhl to start of ATTRIBUTE_FILE.
C $A443,7 Print "A & F SOFTWARE" text graphic
C $A44A,7 Print "CHUCKIE EGG (c)" text graphic
C $A451,7 Print "a game of skill..." text graphic
C $A458,3 Point #REGhl to theme_tune data
C $A45B,6 If music_play_state is "stopped" then Jump
C $A461,3 else PlayTune
C $A466,3 GetLookupTableAddress
C $A469,5 Set music_play_state to "stopped"
N $A46E This entry point is used by the routine at #R$aa49.
@ $A46E label=SetTickerTextColour
C $A46E,3 Point #REGhl to last line of ATTRIBUTE_FILE.
C $A473,2 Set foreground colour to Cyan, background remains black.
C $A478,5 Sets 732C to $4E ...whatever that is.
c $A47D Scroll ticker text for home screen
D $A47D Note: this routine is very similar to the first half of ScrollText2 routine.
@ $A47D label=ScrollText1
C $A491,3 Point #REGhl to home_screen_ticker_text
C $A49C,4 Set 732C to `$00`
C $A4A8,3 UpdateScreenGfx
N $A4AB Respond to keyboard input
C $A4AB,9 Read keyboard and check keypress `S`
C $A4B4,9 Read keyboard and check keypress `R`
C $A4BD,11 Read keyboard and check keypress `I`
c $A4C8 Display the instructions screen
D $A4C8 Note: this routine is very similar to the DisplayHomeScreen routine.
@ $A4C8 label=DisplayInstructionsScreen
C $A4C8,3 ClearScreen
C $A4D3,3 UpdateScreenGfx
C $A4E4,3 Point #REGhl to start of ATTRIBUTE_FILE.
C $A4E9,7 Print instructions headings
C $A4F0,7 Print "KEYS" box
C $A4F7,7 Print "KEY TYPES" text
C $A4FE,7 I saw nothing change visually on the screen.
C $A505,5 Set 732C to `$57`
C $A50A,3 Set game_state to $0A - Instructions screen?
C $A512,3 GetLookupTableAddress
c $A515 Scroll ticker text for instructions screen
D $A515 Note: first half of this routine is very similar ScrollText1 routine.
@ $A515 label=ScrollText2
C $A529,3 Point #REGhl to instructions_screen_ticker_text
C $A534,4 Set 732C to `$00`
C $A540,3 UpdateScreenGfx
C $A54A,9 Read keyboard and check keypress (for what?)
C $A553,9 Read keyboard and check keypress (for what?)
C $A55C,10 Read keyboard row 1..5 (on instructions screen?)
c $A566 Highlight the "input type" line # 1, 2, or 3.
C $A566,1 #REGb also saved to game_state later, at A57D
C $A567,6 Check the current game_state.
C $A56D,3 Input type #2.
C $A574,3 Input type #3.
C $A579,3 Input type #1 (default).
C $A57D,3 Update game_state value.
C $A582,3 Input type #2.
C $A587,3 Input type #3.
C $A58C,3 Input type #1 (default).
N $A59A This entry point is used by the routine at #R$a515.
c $A59D Initialize a new game
D $A59D Routine to start a new game, first asking for number of players!
@ $A59D label=InitializeGame
C $A5A3,14 Clear the entire DISPLAY_FILE
C $A5B9,3 Point #REGde to choose_number_of_players_text
C $A5BE,21 Scroll text onto screen? vertical-middle of DISPLAY_FILE
C $A5D3,10 Input to get number_of_players for this game
C $A5DD,7 INCrement #REGb until it equals #REGa; the number_of_players
C $A5E4,1 number_of_players (#REGl) = #REGb
C $A5E5,2 current_player (#REGh) = $01
C $A5E7,3 Set total number_of_players and current_player
C $A5EA,10 scroll text off screen
C $A5F6,3 Load #REGde with level_buffer address.
C $A5F9,3 Load #REGbc with size of level data.
C $A5FC,3 Point #REGh; to level_1 address.
C $A5FF,2 Copy level data.
C $A601,3 Why repeat the copy 5 times?
N $A604 Initialize the scores and counters
C $A604,10 Reset anim buffer data at 6EC8 (6 bytes) + ANIMBUF1 (24 bytes)
C $A60E,7 Reset all egg counters to $0C (12...why?): from address 6EE6 for 5 bytes
C $A615,7 Reset all cleared levels counters: from address 6EEB for 5 bytes
C $A61C,7 Reset all player lives to 5: from address 6EF0 for 4 bytes
@ $A623 ssub=ld hl,$9f60+$3e ; Address is toward the end of a routine, so we need a big offset.
c $A62C Routine at a62c
D $A62C Used by the routine at #R$a6fe.
C $A62C,3 Get number_of_players
C $A632,3 Get current_player
C $A637,3 GetLookupTableAddress
@ $A63A ssub=ld bc,$ad3f+$0a ; Point #REGbc to the address of "p" from "player 1"
C $A63D,3 Get current_player
@ $A642 ssub=ld ($ad3f+$11),a ; Replace player number in game_over_text with #REGa.
@ $A647 ssub=ld de,$ad3f+$0a ; Point #REGde to the address of "p" from "player 1"
N $A653 Start this level
C $A65F,3 Get current_player
N $A66E Level has had to end. If there are eggs left, lose a life
C $A672,3 POKE @A672 to 202 (`JP Z`) to jump to next level on death
N $A67B Level complete - give a bonus
C $A6A1,3 Get current_player
@ $A6CD ssub=ld ($ad58+$01),a ; Update LSB of address.
C $A6D9,3 #REGde is loaded with "level " text
C $A6E1,3 Load #REGde with level_buffer address
C $A6E4,3 Load #REGbc with value of 672 (size of level data)
@ $A6E7 ssub=ld hl,$b3b0-$02a0 ; Point #REGhl to level_1-$02A0 (672 bytes).
C $A6F0,1 Add $02A0 (672) to #REGhl, to start read from level_1 address.
c $A6FE Farmer has died!
D $A6FE Used by the routine at #R$a62c.
@ $A6FE label=FarmerKill
C $A701,3 PlayTune
C $A710,3 ClearScreen
C $A725,3 Point #REGde to out_of_time_text
C $A72D,8 copy LEVEL data to level_buffer
C $A735,3 Get current_player
C $A73F,3 Get current_player
C $A755,1 POKE to 182 (`OR (HL)`) to get infinite LIVES
C $A75A,3 Get number_of_players
C $A762,3 Point #REGde to game_over_text
C $A76A,3 Load #REGhl to number_of_players and current_player
C $A773,3 Set current_player
C $A797,3 Get current_player
C $A7A7,3 Get current_player
C $A7AA,15 copy LEVEL data to level_buffer
c $A7BC Related to animation #1
D $A7BC Used by the routine at #R$a6fe.
C $A7C2,11 Point #REGhl to DISPLAY_FILE and reset first 18 bytes
C $A7D6,3 #REGhl=player 1 score
C $A7D9,9 Increment value in (#REGhl) by $30 for 24 bytes.
C $A7E4,3 #REGhl=player 1 score
@ $A7E9 ssub=ld ($ad67+$0b),a ; Change player number in high score text.
C $A7FF,10 check if a score has been entered on scoreboard?
c $A80C Called before loading main screen or highscores?
D $A80C Used by the routine at #R$a7bc.
@ $A811 ssub=ld de,$97af+$0a ; Point #REGde to first score value ("001000") on scoreboard.
c $A828 Player enters their name on the highscore table?
D $A828 Used by the routine at #R$a80c.
@ $A828 label=HighScoreEnterName
@ $A82A ssub=ld hl,$97af+$90 ; Point #REGhl to last score entry (-1 byte) on scoreboard.
@ $A83B ssub=ld de,$97af+$9f
@ $A83E ssub=ld hl,$97af+$8f
C $A841,2 LDDR decrements HL/DE, unlike LDIR, which increments.
C $A844,7 Does this clear the name for the selected highscore?
C $A859,3 Point #REGde to new_high_score_text
C $A862,3 UpdateScreenGfx
C $A86D,3 DisplayScoreboard
C $A870,3 Point #REGhl to start of ATTRIBUTE_FILE.
C $A873,9 Highlight the "Player 1" text in magenta ($03)
C $A87C,6 Highlight the "well done..." message in green (INC A = $04)
C $A882,5 Highlight the "enter initials..." message in red ($02)
C $A88C,3 GetLookupTableAddress
C $A8A6,3 UpdateScreenGfx
C $A8A9,3 reads SYSVAR_KSTATE_4
C $A8B1,3 reads SYSVAR_KSTATE_4
C $A8B8,3 reads SYSVAR_LAST_K (newly pressed key)
C $A8CB,3 UpdateScreenGfx
C $A8DD,3 UpdateScreenGfx
c $A8EC Animated transition
D $A8EC Used by the routines at #R$a929, #R$a968 and #R$a9fa.
@ $A8EC label=TransitionAnimation
c $A921 Pause routine
D $A921 Used by the routines at #R$a47d, #R$a515, #R$a62c, #R$a6fe, #R$a929 and #R$a968.
R $A921 Input: BC time value to pause for
@ $A921 label=PauseRoutine
c $A929 Animated transition #1 (1 square)
D $A929 Used by the routines at #R$a59d and #R$a7bc.
C $A93B,3 Set 732C to `$03`
c $A960 Called when farmer dies
D $A960 Used by the routines at #R$a4c8, #R$a59d, #R$a62c, #R$a6fe and #R$a828.
c $A968 Animated transition #2 (4 squares)
D $A968 Used by the routines at #R$a62c and #R$a7bc.
C $A96B,5 Set 732C to `$09`
C $A9C5,5 Set 732C to `$04`
c $A9CE Prepare to scroll GAME OVER message, and level number?
D $A9CE Used by the routines at #R$a62c and #R$a6fe.
C $A9CE,10 Update some attribute colours to $04
C $A9DA,3 Point #REGhl to vertical middle of screen
C $A9DD,3 ScrollTickerText
C $A9E7,3 UpdateScreenGfx
C $A9F1,3 Point #REGhl to vertical middle of screen
C $A9F4,3 ScrollTickerText
c $A9FA Animated transition after death...related to animation #1
D $A9FA Used by the routine at #R$a968.
C $AA00,8 Increment value at 732C by `$09`.
c $AA0C Routine at aa0c
D $AA0C Used by the routine at #R$a80c.
c $AA23 Get attribute buffer address for a screen coordinate.
D $AA23 Used by the routine at #R$a8ec.
R $AA23 Input: D coordinate to look up
R $AA23 Output: HL attribute address
C $AA26,3 Point #REGhl to start of PRINTER_BUFFER...why?
c $AA37 Prints a text block to the screen.
D $AA37 Used by the routines at #R$a420, #R$a4c8 and #R$a828.
R $AA37 Input: HL base address of the attribute buffer
R $AA37 B width
R $AA37 C height
@ $AA37 label=PrintTextBlock
c $AA49 Redefine keys wizard - read new keys
D $AA49 Used by the routines at #R$a47d and #R$a515.
@ $AA49 label=RedefineKeysWizard
C $AA49,3 ClearScreen
C $AA4C,5 Set game_state to $03 (redefine keys)
C $AA51,10 Clear 10 of the 12 bytes at this address
C $AA60,3 Point #REGde to redefine_keys_wizard_text
C $AA64,3 UpdateScreenGfx
C $AA74,3 UpdateScreenGfx
C $AA80,10 Update colour attributes to $04
@ $AA9A ssub=ld bc,$83f0+$06 ; Point #REGbc to "q" character in msg_key_types
c $AABA Routine at aaba
D $AABA Used by the routine at #R$ab19.
@ $AABA ssub=ld hl,$8268-$01 ; Point #REGhl to key_input_type_3 - 1 byte
N $AAD2 This entry point is used by the routine at #R$aadf.
C $AADF,2 Some kind of pause routine?
c $AAE4 Play a random sound - called after death tune
D $AAE4 Note: exactly same as #R$A389, #R$B14F, except for #REGhl address.
@ $AAE6 ssub=ld hl,$abea-$01
C $AAE4,9 Load #REGb with #REGr (related to memory refresh), then after processing #REGb will have a value between 1-8.
C $AAED,4 Increment #REGhl to required address, and assign #REGa.
C $AAF1,3 GetLookupTableAddress
c $AAF4 Redefine keys: get key
D $AAF4 Used by the routines at #R$aa49 and #R$ab19.
R $AAF4 Output: H the bitfields key matrix tested (input to port FE), or 0 for none
R $AAF4 L the keys pressed, or 0 for none
R $AAF4 E the 'nth' key matrix tested (0-9)
@ $AAF4 label=RedefineKeysGetKey
N $AAFD This entry point is used by the routine at #R$ab0d.
C $AAFE,15 Read keyboard
c $AB0D Redefine keys: print the key you just pressed?
D $AB0D Used by the routine at #R$aaf4.
@ $AB0D label=RedefineKeysPrintKey
N $AB12 This entry point is used by the routine at #R$aaf4.
c $AB19 Print redefine key direction label?
D $AB19 Used by the routine at #R$aa49.
@ $AB19 label=RedefineKeysPrintDirection
@ $AB33 ssub=ld hl,$ac02+$4c ; Point #REGhl to first address after "jump" in redefine_keys_wizard_text
C $AB51,3 UpdateScreenGfx
c $AB60 Play the theme tune, one note at a time.
D $AB60 Used by the routines at #R$a420, #R$a6fe and #R$ab70.
R $AB60 Input: HL pointer to the pitch and length, or 0 to mark the end
@ $AB60 label=PlayTune
C $AB6C,1 RST $28 can jump back to AB70 !?!?
C $AB79,2 Jump back to PlayTune, and play the next note
c $AB7B Scroll the ticket text across the screen
D $AB7B Used by the routines at #R$a47d, #R$a515, #R$a59d and #R$a9ce.
R $AB7B Input: HL screen address to scroll
@ $AB7B label=ScrollTickerText
c $AB9E Clears the entire screen to black: from bottom to top.
D $AB9E Used by the routines at #R$a420, #R$a4c8, #R$a6fe and #R$aa49.
@ $AB9E label=ClearScreen
c $ABAD Displays scoreboard with heading and names/scores list
D $ABAD Used by the routines at #R$a420 and #R$a828.
@ $ABAD label=DisplayScoreboard
C $ABAD,3 Point #REGde to high_score_heading_text
C $ABB7,3 UpdateScreenGfx
C $ABC0,3 set #REGde to high score table
C $ABC8,3 UpdateScreenGfx
C $ABD6,19 update screen colours
b $ABEA Sound directives
D $ABEA Small lookup table used by #R$AAE4 to assign #REGa, for use with GetLookupTableAddress
B $ABEA,8,8
t $ABF2 High score table heading text data
@ $ABF2 label=high_score_heading_text
T $ABF2,16,16
t $AC02 Wizard instructions for redefining the keys
@ $AC02 label=redefine_keys_wizard_text
T $AC02,82,32,10
t $AC54 Alphabet characters, but out of order
B $AC54,40,2:c3:1:c29:1:c4
t $AC7C Home screen ticker text
@ $AC7C label=home_screen_ticker_text
T $AC7C,24,1:n1:22
N $AC94 Redefine keys text
T $AC94,27,1:n1:25
N $ACAF Instructions text
T $ACAF,27,1:n1:25
t $ACCA Instructions screen ticker text
@ $ACCA label=instructions_screen_ticker_text
T $ACCA,24,1:n1:22
N $ACE2 Redefine keys text
T $ACE2,27,1:n1:25
N $ACFD Select key type
T $ACFD,36,1:n1:34
t $AD21 "1,2,3 or 4 players ?" - choose number of players text data
@ $AD21 label=choose_number_of_players_text
T $AD21,30,30
t $AD3F "game over player 1 " text data
@ $AD3F label=game_over_text
T $AD3F,19,19
t $AD52 "level" text (for current level?)
@ $AD52 label=level_text
T $AD52,6,6
w $AD58 Used as an address.
W $AD58,2,2
t $AD5A "OUT OF TIME !" text data
@ $AD5A label=out_of_time_text
T $AD5A,13,13
t $AD67 Congratulate player on new high score, and instructions.
@ $AD67 label=new_high_score_text
T $AD67,165,15
b $AE0C Chuckie Egg theme tune
D $AE0C Notes for the tune; byte 0: length, byte 1: pitch
@ $AE0C label=theme_tune
B $AE0C,94,2
b $AE6A Death tune, played when the farmer, well, dies.
D $AE6A Notes for the tune; byte 0: length, byte 1: pitch
@ $AE6A label=death_tune
B $AE6A,50,2
c $AE9C Run the current level until complete or a duck is hit
D $AE9C Used by the routine at #R$a62c.
C $AE9C,14 Point #REGhl to "end" of ATTRIBUTE_FILE, then blank some or all of the screen
N $AEAA Draw the UDGs
C $AEB2,3 UpdateScreenGfx
N $AEC2 Print the level stats
C $AECA,1 WARNING! opcode: DAA
C $AF10,3 Get current_player
C $AF21,3 UpdateScreenGfx
C $AF2E,3 UpdateScreenGfx
C $AF3B,3 Get number_of_players
C $AF3E,11 Copy current score to player 1 score
C $AF65,3 Get current_player
C $AFB7,3 Get number_of_players
C $AFCD,3 UpdateScreenGfx
C $B010,3 Get current_player
C $B021,3 Get number_of_players
N $B056 Initialize game flags
C $B0A6,3 Set #REGa to current game_state.
C $B0A9,2 Is it set to input type selection?
C $B0AB,5 Point #REGhl to input type #2.
C $B0B0,5 Point #REGhl to input type #3.
C $B0B5,3 Point #REGhl to input type #1 (default).
C $B0B8,8 Update the game input control keys with selected input type stored in #REGhl.
C $B0C6,3 Get current_player
C $B102,10 Players score is a multiple of 10,000 points?
C $B10F,3 Get current_player
C $B112,7 Calculate address of lives variable for current player, and assign to #REGhl
C $B11A,1 Load #REGa with remaining lives of current player
C $B12A,3 UpdateScreenGfx
c $B130 Update the screen colour for the given coordinate.
D $B130 Used by the routine at #R$ae9c.
R $B130 Input: H column
R $B130 L row
C $B135,3 Point #REGhl to start of ATTRIBUTE_FILE.
c $B14F Play a random sound through the Fuller Orator
D $B14F After death, screen is redrawn, before ostriches/farmer displayed Note: exactly same as #R$A389, #R$AAE4, except for #REGhl address.
N $B14F Does accessing #REGhl instruction before the #REGr have any importance? (see "R Register" https://www.worldofspectrum.org/faq/reference/z80reference.htm)
@ $B14F ssub=ld hl,$b15f-$01
C $B152,6 Load #REGb with #REGr (related to memory refresh), then after processing #REGb will have a value between 1-8.
C $B158,4 Increment #REGhl to required address, and assign #REGa.
C $B15C,3 GetLookupTableAddress
b $B15F Fuller Orator allophones
D $B15F Small lookup table used by #R$B14F to assign #REGa, for use with GetLookupTableAddress
B $B15F,8,8
b $B167 Source code remnants
D $B167 The source code here corresponds to the code at end of #R$A566...maybe!
B $B167,153,8*19,1
b $B200 IM2 jump vector
B $B200,263,8*32,7
b $B307 Source code remnants
D $B307 The source code here corresponds to the code in middle of #R$A59D.
B $B307,69,8*8,5
c $B34C Shunt the player to the end of the platform if they're near it
D $B34C Used by the routine at #R$98e6.
@ $B34C label=MovePlayerToEndOfPlatform
b $B381 Source code remnants
D $B381 The source code here corresponds to the code in middle of #R$A59D.
B $B381,47,8*5,7
b $B3B0 Level 1 layout data - see level_buffer for byte map
@ $B3B0 label=level_1
B $B3B0,672,16
b $B650 Level 2 layout data - see level_buffer for byte map
@ $B650 label=level_2
B $B650,672,16
b $B8F0 Level 3 layout data - see level_buffer for byte map
@ $B8F0 label=level_3
B $B8F0,672,16
b $BB90 Level 4 layout data - see level_buffer for byte map
@ $BB90 label=level_4
B $BB90,672,16
b $BE30 Level 5 layout data - see level_buffer for byte map
@ $BE30 label=level_5
B $BE30,672,16
b $C0D0 Level 6 layout data - see level_buffer for byte map
@ $C0D0 label=level_6
B $C0D0,672,16
b $C370 Level 7 layout data - see level_buffer for byte map
@ $C370 label=level_7
B $C370,672,16
b $C610 Level 8 layout data - see level_buffer for byte map
@ $C610 label=level_8
B $C610,672,16
b $C8B0 Source code remnants?
D $C8B0 The source code here corresponds to the code at ????.
B $C8B0,24,9,8,7
w $C8C8 Fuller Orator data lookup table.
D $C8C8 An address lookup table for accessing data blocks.
@ $C8C8 label=address_lookup_table
W $C8C8,66,2
s $C90A unused?
S $C90A,34,$22
b $C92C Fuller Orator data
D $C92C audio related data, with address stored in lookup table
B $C92C,12,8,4
b $C938 audio related data, with address stored in lookup table
B $C938,20,8*2,4
b $C94C audio related data, with address stored in lookup table
B $C94C,12,8,4
b $C958 audio related data, with address stored in lookup table
B $C958,14,8,6
b $C966 audio related data, with address stored in lookup table
B $C966,26,8*3,2
b $C980 audio related data, with address stored in lookup table
B $C980,12,8,4
b $C98C audio related data, with address stored in lookup table
B $C98C,16,8
b $C99C audio related data, with address stored in lookup table
B $C99C,16,8
b $C9AC audio related data, with address stored in lookup table
B $C9AC,20,8*2,4
b $C9C0 audio related data, with address stored in lookup table
B $C9C0,22,8*2,6
b $C9D6 audio related data, with address stored in lookup table
B $C9D6,14,8,6
b $C9E4 audio related data, with address stored in lookup table
B $C9E4,22,8*2,6
b $C9FA audio related data, with address stored in lookup table - when player lands on a platform
B $C9FA,16,8
b $CA0A audio related data, with address stored in lookup table
B $CA0A,18,8*2,2
b $CA1C audio related data, with address stored in lookup table
B $CA1C,18,8*2,2
b $CA2E audio related data, with address stored in lookup table
B $CA2E,24,8
b $CA46 audio related data, with address stored in lookup table
B $CA46,16,8
b $CA56 audio related data, with address stored in lookup table
B $CA56,16,8
b $CA66 audio related data, with address stored in lookup table
B $CA66,18,8*2,2
b $CA78 audio related data, with address stored in lookup table - related to playing music?
B $CA78,70,8*8,6
b $CABE audio related data, with address stored in lookup table
B $CABE,22,8*2,6
b $CAD4 audio related data, with address stored in lookup table
B $CAD4,14,8,6
b $CAE2 audio related data, with address stored in lookup table
B $CAE2,24,8
b $CAFA audio related data, with address stored in lookup table
B $CAFA,26,8*3,2
b $CB14 audio related data, with address stored in lookup table
B $CB14,22,8*2,6
b $CB2A audio related data, with address stored in lookup table
B $CB2A,20,8*2,4
b $CB3E audio related data, with address stored in lookup table
B $CB3E,18,8*2,2
b $CB50 audio related data, with address stored in lookup table
B $CB50,20,8*2,4
b $CB64 audio related data, with address stored in lookup table
B $CB64,18,8*2,2
b $CB76 audio related data, with address stored in lookup table
B $CB76,10,8,2
b $CB80 audio related data, with address stored in lookup table
B $CB80,22,8*2,6
b $CB96 audio related data, with address stored in lookup table
B $CB96,26,8*3,2
b $CBB0 audio related data, with address stored in lookup table
B $CBB0,20,8*2,4
> $CBB0,1 ; The Pasmo assembler uses this directive when generating a tape image.
> $CBB0,1 ; Use the same address as with the ORG directive, to tell Pasmo where
> $CBB0,1 ; to start running the program from here.
> $CBB0,1 end $5ef3
i $CBC4
