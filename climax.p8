pico-8 cartridge // http://www.pico-8.com
version 42
__lua__

#include gameloop/initialize_climax.lua
#include gameloop/draw_climax.lua
#include gameloop/collisions.lua
#include gameloop/update_climax.lua
#include gameloop/climax.lua
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000088888800000000008888880000000000888888000000000088888800000
00000000000000000000099999900000000009999990000000000999999000000000888888880000000088888888000000008888888800000000888888880000
000000000000000000009999999900000000999999990000000099999999000000088ff88ff8800000088ff88ff8800000088ff88ff8800000088ff88ff88000
000009999990000000099ff99ff9900000099ff99ff9900000099ff99ff990000008f22ff22f80000008f22ff22f80000008f22ff22f80000008f22ff22f8000
000099f99f9900000009ffffffff90000009ffffffff90000009ffffffff900000f8ff1fff1f8f0000f8ff1fff1f8f0000f8ff1fff1f8f0000f8ff1fff1f8f00
000f9ffffff9f00000f9ff1fff1f9f0000f9ff1fff1f9f0000f9ff1fff1f9f0000f8ffffffff8f0000f8ffffffff8f0000f8ffffffff8f0000f8ffffffff8f00
000f9f1fff19f00000f9ffffffff9f0000f9ffffffff9f0000f9ffffffff9f000008fff11fff80000008fff11fff80000008fff11fff80000008fff11fff8000
00009ffffff900000009fff111ff90000009fff111ff90000009fff111ff9000000088ffff880000000088ffff880880000088ffff880000000088ffff880000
00009ff111f90000000099ffff990000000099ffff990000000099ffff9900000000088888800000000008888880088000000888888000000000088888800000
000009ffff9000000000099999900900000009999990090000000999999009000000008888000000000000888800880000000088880000000000008888000000
00000099990000000000009999009000000000999900900000000099990090000000888888880000000088888888800000008888888800000000888888880000
0000099ff99000000000099ff99900000000099ff99900000000099ff99900000008808888088000000880888800000000088088880880000008808888088000
0000909ff90900000000909ff90000000000909ff90000000000909ff90000000008808888008800000880888800000000088088880088000008808888008800
00009099990090000009009999000000000900999900000000090099990000000000008008808800000000800880000000000080088088000000008008808800
00000090090000000000009005500000000000900550000000000090055000000000088008800000000008800555000000000880088000000000088008800000
00000550055000000000055000000000000005500000000000000550000000000000555005550000000055500000000000005550055500000000555005550000
00000000000000000000000000000000000000000000000000000000000000000000088888800000000008888880000000000888888000000000088888800000
00000000000000000000000000000000000000000000000000000000000000000000888888880000000088888888000000008888888800000000888888880000
000000000000000000000000000000000000000000000000000000000000000000088ff88ff8800000088ff88ff8800000088ff88ff8800000088ff88ff88000
00000999999000000000099999900000000009999990000000000999999000000008f22ff22f80000008f22ff22f80000008f22ff22f80000008f22ff22f8000
000099f99f990000000099f99f990000000099f99f990000000099f99f99000000f8ff1fff1f8f0000f8ff1fff1f8f0000f8ff1fff1f8f0000f8ff1fff1f8f00
000f9ffffff9f000000f9ffffff9f000000f9ffffff9f000000f9ffffff9f00000f8ffffffff8f0000f8ffffffff8f0000f8ffffffff8f0000f8ffffffff8f00
000f9f1fff19f000000f9f1fff19f000000f9f1fff19f000000f9f1fff19f0000008fff11fff80000008fff11fff80000008fff11fff80000008fff11fff8000
00009ffffff9000000009ffffff9000000009ffffff9000000009ffffff90000000088ffff880000000088ffff880000000088ffff880000000088ffff880000
00009ff111f9000000009ff111f9000000009ff111f9000000009ff111f900000000088888800000000008888880000000000888888000000000088888800000
000009ffff900000000009ffff900000000009ffff900000000009ffff9000000000008888000000000000888800000000000088880000000000008888000000
00000099990000000000009999000000000000999900000000000099990000000000888888880000000088888888000000008888888800000000888888880000
0000099ff99000000000099ff99000000000099ff99000000000099ff99000000008808888088000000880888808800000088088880880000008808888088000
0000909ff90900000000909ff90900000000909ff90900000000909ff90900000008808888008800000880888800880000088088880088000008808888008800
00009099990090000000909999009000000090999900900000009099990090000000008008808800000000800880000000000088088088000000008808808800
00000090055000000000009000900000000000550900000000000090090000000000088005550000000008800088000000000055588000000000008808800000
00000550000000000000055000500000000000000550000000000550050000000000555000000000000055500055500000000000055500000000000000000000
00000000000000000000000000000000000000000000111111110000000000000000000000000000000000000000000000000000000000000000000000000000
00000444444000000000044444400000000000000111666666661110000000000000000000000000000000000000000000000000000000000000000000000000
00004444444400000000444444440000000000011666666666666611100000000000000000000000000000000000000000000000000000000000000000000000
000449944ff44000000449944ff44000000000166666666666666666610000000000000000000000000000000000000000000000000000000000000000000000
00049ff9ffff400000049ff9ffff4000000001666666666666666666661000000000000000000000000000000000000000000000000000000000000000000000
00f49f19ff1f4f0000f49f19ff1f4f00000016666666666666666666666100000000000000000000000000000000000000000000000000000000000000000000
00f9f99fffff4f0000f9f99fffff4f00000166666666666666666666666610000000000000000000000000000000000000000000000000000000000000000000
0004fff111ff40000004fff111ff4000001666666666666666666666666661000000000000000000000000005000500000000000000000000000000050005000
000044ffff440000000044ffff440000001666666666666666666666666661000000000000000000000000059505950000000000000000000000000595059500
00000884488004000000044444400400016666666666666666666666666666100000000000000000000000599555950000000000000000000000005995559500
00000048840040000000004444004000016666666666666666666666666666100005000000000000000005995999950000050000000000000000059959999500
00000448f44400000000044ff4440000016666666666666666666666666666100059500000000000000005999978995000595000000000000000059999789950
00004048f40000000000404ff4000000166666666666666666666666666666610599500000000000000059995999915005995000000000000000599959999150
00004044440000000000404444000000166666666666666666666666666666615995000005555555555599959991995059950000055555555555999599919950
00000040040000000000004004000000166666666666666666666666666666615950000559999999999999999599115059500005599999999999999995991150
00000550055000000000055005500000166666666666666666666666666666615950005999959995999999999999950059500059999599959999999999999500
00000000000000000000000000000000166666666666666666666666666666615995005999999999999955999955500059950059999999999999559999555000
00000000000000000000000000000000166666666666666666666666666666610599555959995999995999995950000005995559599959999959999959500000
00000000000000000000000000000000166666666666666666666666666666610059995995999995999999959995000000599959959999959999999599950000
00000000000000000000000000000000166666666666666666666666666666610005555999599999999599999995000000055559995999999995999999950000
00000000000000000000000000000000016666666666666666666666666666100000005999999999999995999995000000000059999999999999959999950000
00000000000000000000000000000000016666666666666666666666666666100000005599955955559999999959500000000055999559555599999999595000
00000000000000000000000000000000016666666666666666666666666666100000059999599500005595559599500000000599995995000055955595995000
00000000000000000000000000000000001666666666666666666666666661000000059955595000000059995999500000000599555950000000599959995000
00000000000000000000000000000000001666666666666666666666666661000000595950595000000059950595950000005959505950000000599505959500
00000000000000000000000000000000000166666666666666666666666610000000599950595000000059950059950000005999505950000000599500599500
00000000000000000000000000000000000016666666666666666666666100000000559550565000000059500005950000005595505650000000595000059500
00000000000000000000000000000000000001666666666666666666661000000000599500565000000599500005995000005995005650000005995000059950
00000000000000000000000000000000000000166666666666666666610000000000565500566500000599500005955000005655005665000005995000059550
00000000000000000000000000000000000000011666666666666661100000000000565000056650000565000000565000005650000566500005650000005650
00000000000000000000000000000000000000000111666666661110000000000000565000005650000565000000566500005650000056500005650000005665
00000000000000000000000000000000000000000000111111110000000000000000050000000500000050000000055000000500000005000000500000000550
0000000000000000011111100000000011111111111111111111111111111111111111111111111111111111111111110000000000001111113e1d1d1d1d0b1b
1d7c7c7c7c1d1d1d1d3e3e1d1d1d1d3e111111111111111111111111111111111111111111110000000011111111111100000000011166666666111000000000
0000000000000000444444440000000011111111111111111111111111111111111111111000000000000001111111110000000116666666663e1d1d1d1d0b1b
1d7c7c7c7c1d1d1d1d3e3e1d1d1d1d3e111111111111111111111111111111111111111000000000000000000111111100000016666666666666666661000000
0000000000000000011111100000000011111111111111111111111111111111111111000000000000000000001111110000016666666666660e0e0e0e0e0e0e
0e0d0d0d0d0e0e0e0e0e0e0e0e0e0e3e111111111111111111111111111111111111100000000000000000000001111100001666666666666666666666610000
0000000000000000000000000000000011111111111111111111111111111111111100000000000000000000000011110001666666666666666c6c6c6c6c6c6c
6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c111111111111111111111111111111111110000000000000000000000000011100166666666666666666666666666100
00000000000000000014100000000000111111111111111111111111111111111110000000000000000000000000011100166666666666666666666666666100
00000000000000000144410000000000111111111111111111111111111111111100000000000000000000000000001101666666666666666666666666666610
00000000000000000144410000000000111111111111111111111111111111111100000000000000000000000000001101666666666666666666666666666610
00000000000000000144410000000000111111111111111111111111111111111100000000000000000000000000001101666666666666666666666666666610
00000000000000000144410000000000111111111111111111111111111111111000000000000000000000000000000116666666666666666666666666666661
00000000000000000144410000000000111111111111111111111111111111111000000000000000000000000000000116666666666666666666666666666661
00000000000000000144410000000000111111111111111111111111111111111000000000000000000000000000000116666666666666666666666666666661
00000000000000000014100000000000111111111111111111111111111111111000000000000000000000000000000116666666666666666666666666666661
dddddddddddddddd4444444400000000111111111111111111111111111111111000000000000000000000000000000116666666666666666666666666666661
dddddddddddddddd4445444400000000111111111111111111111111111111111000000000000000000000000000000116666666666666666666666666666661
dddddddddddddddd4444444400000000111111111111111111111111111111111000000000000000000000000000000116666666666666666666666666666661
d1111dddddd1111d4544444400000000111111111111111111111111111111111000000000000000000000000000000116666666666666666666666666666661
d1441dddddd1441d4444444400000000111111111111111111111111111111111100000000000000000000000000001101666666666666666666666666666610
d14441dddd14441d4454445400000000111111111111111111111111111111111100000000000000000000000000001101666666666666666666666666666610
d144141dd141441d4444454400000000111111111111111111111111111111111100000000000000000000000000001101666666666666666666666666666610
d1441d4114d1441d4444444400000000111111111111111111111111111111111110000000000000000000000000011100166666666666666666666666666100
44411111111114440111111000000000111111111111111111111111111111111110000000000000000000000000011100166666666666666666666666666100
44411dddddd114441444444100000000111111111111111111111111111111111111000000000000000000000000111100016666666666666666666666661000
44411444444114444444444400000000111111111111111111111111111111111111100000000000000000000001111100001666666666666666666666610000
45411444454114441444444100000000111111111111111111111111111111111111110000000000000000000011111100000166666666666666666666100000
44411111111114440111111000000000111111111111111111111111111111111111111000000000000000000111111100000016666666666666666661000000
44511dddddd114540000000000000000111111111111111111111111111111111111111110000000000000011111111100000001166666666666666110000000
44411544444115440000000000000000111111111111111111111111111111111111111111110000000011111111111100000000011166666666111000000000
44411444444114440000000000000000111111111111111111111111111111111111111111111111111111111111111100000000000011111111000000000000
777777776666666666666666cccccccccccccccc1111111111111111eeeeeeeedddddddddddddddd22222222222222222222222222f222220000000000000000
777777776666666666666666cccccccccccccccccccccccc11111111eeeeeeeeeeeeeeeedddddddddddddddd2222222222fff2222fffe2220000000000000000
777777776666666666666666cccccccccccccccc1111111111111111eeeeeeeedddddddddddddddd22222222222222222ffffffffffffe220000000000000000
77777777777777776666666666666666cccccccccccccccc11111111eeeeeeeeeeeeeeeedddddddddddddddd22222222ffffefffffffee220000000000000000
777777776666666666666666cccccccccccccccc1111111111111111eeeeeeeedddddddddddddddd2222222222222222fffffeffeffee2220000000000000000
77777777777777776666666666666666cccccccccccccccc11111111eeeeeeeeeeeeeeeedddddddddddddddd22222222efeffefeeeee22220000000000000000
777777776666666666666666cccccccccccccccc1111111111111111eeeeeeeeeeeeeeeedddddddddddddddd22222222eeeeeeeeeee222220000000000000000
77777777777777776666666666666666cccccccccccccccc11111111eeeeeeeeeeeeeeeedddddddddddddddd2222222222222222222222220000000000000000
bbbbbbbb44444444bbbbbbbbbbbbbbbb00000000005ff500cccccccc555555558888888800000000eeeeebbb0000000000000000000000000000000000000000
bbbbbbbb44454444bbbbbbbbbbbbbbbb8800000005500550ccc88ccc55444455333773330000000011111bb40000000000000000000000000000000000000000
4b444bb444444444bb444bb44b4b44bb8800000055000055cccc88cc545445453373373300000000eeeeebbb0000000000000000000000000000000000000000
4444494445444444bb44494444b444bb05500000000000008888888c54455445373333730000000011111bb40000000000000000000000000000000000000000
9444444444444444bbb44444454444bb0055000000000000cccc88cc544554458333333800000000eeeeebb40000000000000000000000000000000000000000
4444444444544454bb4b444445449bbb0005500000000000ccc88ccc54544545373333738888888811111bbb0000000000000000000000000000000000000000
4444554444444544bbb4554444444bbb5555555500000000cccccccc554444553373373307000070eeeeebb40000000000000000000000000000000000000000
4544444444444444bb444444444444bb8888888800000000cccccccc55555555888888888888888811111bbb0000000000000000000000000000000000000000
44444444444444bbbb444444444444443333333333333333333333334454445499999999eeeeeeee11111bbb444444bbbeeeeeeeeeeeeeebbb44444411bbbbbb
4424444444554bbbbbbb444444454444bb3bbb3bb3bbbb3bbb3bbb3b55555555999599991111111111111bb44455444bbbeeeeeeeeeeebbbb44444441bbbbbbb
444244244444b4bbbb44444444444444bbbbbb3bb3bb3b3bbbbbbb3b0000000099999999eeeeeeee11111bbb44444444bbbeeeeeeeeebbb4444444441b444bb4
2224224244444bbbbb4444444544444433333333333333333333333300000000959999991111111111111bb4444444444bbbeeeeeeebbb4444444444bb444944
25525422444444bbbbb444444444444411111111113bb311111333110000000099999999eeeeeeee11111bb44444444444bbeeeeeeebb44444444444bbb44444
22522222444444bbbb4b44444454445411111111113bb3111111333100000000995999591111111111111bbb4444444444bbeeeeeeebb44444444444bb4b4444
222222224444bbbbbbb4554444444544111111111133b311111113330000000099999599eeeeeeee11111bb44444444444bbeeeeeeebbb4444444444bbb45544
22252222444444bbbb4444444444444411111111113bb3111111113300000000999999991111111111111bbb4444444444bbeeeeeeeebb4444444444bb444444
22222222444444bbbb444444000000000000000000000000dddddbbbbbdddddddddddbbbeeeeebbbeeeeeeee444444444bbeeeeeeeeebb444444444433333333
22222222454444bbbb444444ff0000009900000000000000dddddbb14bbdddddeeeeebb4eeeeebb4eeeeeeee44554444bbeeeeeeeeeeebb44444444433333333
222225224444544444444544ff0000009900000000000000dddddb1544bbdddddddddbbbeeeeebbbeeeeeeee44444444bbeeeeeeeeeeebbbb444444433333333
222222224444444444544444011000000550000000000000dddddbbb444bbdddeeeeebb4eeeeebb4eeeeeeee4444444bbeeeeeeeeeeeeeebb444444433333333
252252224444444444444544001100000055000000000000dddddbb44444bbdddddddbb4eeeeebb4eeeeeeee444444bbbeeeeeeeeeeeeeebbb44444433333333
222222224545454444444444000110000005500000000000dddddbbb44444bbdeeeeebbbeeeeebbbeeeeeeee444444bbeeeeeeeeeeeeeeeebb44444433333333
222222224444444445444544111111115555555522522222dddddbb4444444bbeeeeebb4eeeeebb4eeeeeeee444444bbeeeeeeeeeeeeeeeebb44554433333333
222522224444444444444444111111119999999922222252dddddbb44444444beeeeebbbeeeeebbbeeeeeeee444444bbeeeeeeeeeeeeeeeebb44444433333333
__gff__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000303000000000f00000000000000010103010f0f0f0f010000000000000301010100000000000000020202020200
__map__
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000cbcccdcbcbcbcccdcbcbcbcbcccdcbcbcbcbcccdcbcbcbcbcbcbcbcbcbcbcbcb000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000cbcbcbcccdcbcbcbcbcccdcbcbcbcbcccdcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000cbcbcbcbcbcbcbcbcbcbcbcbcbd2d0d0d0d0d0cbcbcbcbcbcbcbcbcbcbcbcbcb000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000cbcbcbcbcbcbcbcbcbcbcbcbd2f2d1d1d1d1d1cbcbcbcbcbcbcbcbcbcbcbcbcb000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4cacacacacacacacacacacad2f2d1d1d1d1d1d1cacacacacacacacacacacacaca000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c9c9c9c9a0c9c9c9c9a1d2f2d1d1d1d1d1d1d1c9cccdc9c9c9cccdc9c9cccdc9000000000000000000000000000000000000000000000000000000000000000000000000
c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4d0d0d0d0d3c9c9c9c9eff2d1d1d1d1d1d1d1d1c9c9c9cccdc9c9c9d2d0d0d0d0000000000000000000000000000000000000000000000000000000000000000000000000
c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4d1d1d1d1e1c8c8c8c8e2d1d1d1d1d1d1d1d1d1c8c8c8c8c8c8c8c8e2d1d1d1d1000000000000000000000000000000000000000000000000000000000000000000000000
c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4d1d1b0b1ebecfafaedeed1d1d1d1e3d1d1d1d1c7c7c7c7c7c7c7c7e2d1d1d1d1000000000000000000000000000000000000000000000000000000000000000000000000
c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4d1d1b0b1fbfcfafafdfed1d1d1d1e3d1d1d1d1c7d0d3c7c7c7c7c7e2d1d1d1d1000000000000000000000000000000000000000000000000000000000000000000000000
c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4d1d1b0b1e1e9e9e9e9e2d1d1d1d1e3d1d1d1d1c7d1e1c7c7c7c7c7e2d1d1d1d1000000000000000000000000000000000000000000000000000000000000000000000000
c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4d1d1b0b1e1c6c6c6c6e2d1d1d1d1e3d1d1d1d1d1d1e1c7c7c7c7c7e2d1d1d1d1000000000000000000000000000000000000000000000000000000000000000000000000
c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4d2d0d0d0d0d1d1b0b1e1c6c6c6c6e2d1d1d1d1e3d1d1d1d1d1d1e1c7c7c7c7c7e2d1d1d1d1000000000000000000000000000000000000000000000000000000000000000000000000
c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c4c4c4c4c4c4c4c4c4c4c4c4c4d6c4c4c4c4c4c4c4c4c4c4c4e2d1e3d1d1d1d1b0b1e1c7c7c7c7e2d1d1d1e3e3d1d1d1d1d1d1f1d0d0d0d0d0f2e0e0e0e0000000000000000000000000000000000000000000000000000000000000000000000000
c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6d2d0d0d0d0d0c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4e2d1e3d1d1d1d1b0b1e1c7c7c7c7e2d1d1d1e3e3d1d1d1d1d1e0e0e0e0e0e0e0e0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000
c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6e2d1d1d1d1d1c3c3c3c3c3c3c3c3c3d0d0d0d0d0d0d0d0d0d3c3c3c3c3c3c3e2d1e3d1d1d1d1b0b1e1c7c7c7c7e2d1d1d1e3e3d1d1d1d1d1f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000
c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c68b999a89c6e2e0e0e0e0e0c1c1c1c1c1c1c1c1c1c1c1c1d1c1c1e2d1d1f1d3c1c1c1c1c1e2d1e3d1d1d1d1b0b1e1c7c7c7c7e2d1d1d1e3e3d1d1d1d1d1f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000
c6c6c6c6c6c6c6c6c6c6c6c6e4e6d2d0d0d0d0d0d0d0d0d0f2f0f0f0f0f0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0e2d1d1d1f1d3ebecedeee2d1e3d1d1d1d1b0b1e1c7c7c7c7e2d1d1d1e3e3d1d1d1d1d1f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000
c6c6c6c6c6c6c6c6c6c6e5e4c6c6e2d1d1d1d1d1d1d1d1d1d1f0f0f0f0f0ebecedeeefebeceeefebecedefebece2d1d1d1d1f1d3d8d8d8e2d1e3d1d1d1d1b0b1e1c7c7c7c7e2d1d1d1e3e3d1d1d1d1d1f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000
c6c6c6c6c6c6c6e5e4e5e3c6c6c6e2e0e0e0e0e0e0e0e0e0e0f0f0f0f0f0fbfcfdfefbfcfdfeffd2d0d0d0d0d0f2e0e0e0e0e0f1d0d0d0f2e0e3d1d1d1d1b0b1e1c7c7c7c7e2d1d1d1e3e3d1d1d1d1d1f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000
c6c6c6c6e5e5c6e3c6e3e3c6c6c6e2f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0fbfcfdfefffbfbfdfee2e0e0e0e0e0e0f0f0f0f0f0e0e0e0e0e0f0e3d1d1d1a2b0b1e1c7c7c7c7e2a2a2a2e3e3d1d1d1d1d1f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000
d0d0d0d0d0d0d0d0d0d0d0d0d0d0f2f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0d0d0d0d0d0d0d0d0d0f2f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0e3d1d1d1a2b0b1e1c7c7c7c7e2a2a2a2e3e3d1d1d1d10000000000f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000
e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0e0e0e0e0e0e0e0e0e0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0e3d1d1d1d1b0b1e1c7c7c7c7e2d1d1d1e3e3d1d1d1d100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0e3d1d1d1d1b0b1d1c7c7c7c7d1d1d1d1e3e3d1d1d1d100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__change_mask__
fffffffffffffffffbfffffffbffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
