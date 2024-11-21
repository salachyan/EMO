pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
#include gameloop/initialize1.lua
#include gameloop/draw1.lua
#include gameloop/collisions.lua
#include gameloop/update1.lua
#include gameloop/level1.lua
#include gameloop/questions.lua
#include gameloop/storyline.lua

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
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000444444000000000044444400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00004444444400000000444444440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000449944ff44000000449944ff44000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00049ff9ffff400000049ff9ffff4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00f49f19ff1f4f0000f49f19ff1f4f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00f9f99fffff4f0000f9f99fffff4f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0004fff111ff40000004fff111ff4000000000000000000000000000000000000000000000000000000000005000500000000000000000000000000050005000
000044ffff440000000044ffff440000000000000000000000000000000000000000000000000000000000059505950000000000000000000000000595059500
00000884488004000000044444400400000000000000000000000000000000000000000000000000000000599555950000000000000000000000005995559500
00000048840040000000004444004000000000000000000000000000000000000005000000000000000005995999950000050000000000000000059959999500
00000448f44400000000044ff4440000000000000000000000000000000000000059500000000000000005999978995000595000000000000000059999789950
00004048f40000000000404ff4000000000000000000000000000000000000000599500000000000000059995999915005995000000000000000599959999150
00004044440000000000404444000000000000000000000000000000000000005995000005555555555599959991995059950000055555555555999599919950
00000040040000000000004004000000000000000000000000000000000000005950000559999999999999999599115059500005599999999999999995991150
00000550055000000000055005500000000000000000000000000000000000005950005999959995999999999999950059500059999599959999999999999500
00000000000000000000000000000000000000000000000000000000000000005995005999999999999955999955500059950059999999999999559999555000
00000000000000000000000000000000000000000000000000000000000000000599555959995999995999995950000005995559599959999959999959500000
00000000000000000000000000000000000000000000000000000000000000000059995995999995999999959995000000599959959999959999999599950000
00000000000000000000000000000000000000000000000000000000000000000005555999599999999599999995000000055559995999999995999999950000
00000000000000000000000000000000000000000000000000000000000000000000005999999999999995999995000000000059999999999999959999950000
00000000000000000000000000000000000000000000000000000000000000000000005599955955559999999959500000000055999559555599999999595000
00000000000000000000000000000000000000000000000000000000000000000000059999599500005595559599500000000599995995000055955595995000
00000000000000000000000000000000000000000000000000000000000000000000059955595000000059995999500000000599555950000000599959995000
00000000000000000000000000000000000000000000000000000000000000000000595950595000000059950595950000005959505950000000599505959500
00000000000000000000000000000000000000000000000000000000000000000000599950595000000059950059950000005999505950000000599500599500
00000000000000000000000000000000000000000000000000000000000000000000559550565000000059500005950000005595505650000000595000059500
00000000000000000000000000000000000000000000000000000000000000000000599500565000000599500005995000005995005650000005995000059950
00000000000000000000000000000000000000000000000000000000000000000000565500566500000599500005955000005655005665000005995000059550
00000000000000000000000000000000000000000000000000000000000000000000565000056650000565000000565000005650000566500005650000005650
00000000000000000000000000000000000000000000000000000000000000000000565000005650000565000000566500005650000056500005650000005665
00000000000000000000000000000000000000000000000000000000000000000000050000000500000050000000055000000500000005000000500000000550
00000000000000000000000000000000000000000000000000000000000000003333333333311111003333331111133300000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000b3bbbb3b3311111103bbbb3b1111113300000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000b3bbbbbb311111113bbb33331111111300000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000111111113bbb30001111111100000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000111111113bb300001111111100000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000011111111bb3000001111111100000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000011111111b33000001111111100000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000011111111bb3000001111111100000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000bb33333333333bbb3333330000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000bbbbbbbbbbbbbbb3b3bbbb3000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000033333111111333333333bbb300000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000011111555555111110003bbb300000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000111155555555111100003bb300000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000333333331111555555551111000003bb00000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000bbb3bbbb11155555555551110000033b00000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000333333331155555555555511000003bb00000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000111111111333333333333bbb0000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000111111113bbbbbbbbbbbbbb30000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000011111133bb333111111333330000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000111113bbb3111555555000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000011113bb331115555555500000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000003333bb3113115555555500000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000b3bbb31111155555555550000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000003333311111555555555555000000000000000000000000000000000000000000
777777776666666666666666cccccccccccccccc1111111111111111eeeeeeeedddddddddddddddd2222222222222222ddddddddddfddddd0000000000000000
777777776666666666666666cccccccccccccccccccccccc11111111eeeeeeeeeeeeeeeedddddddddddddddd22222222ddfffddddfffeddd0000100000000000
777777776666666666666666cccccccccccccccc1111111111111111eeeeeeeedddddddddddddddd2222222222222222dffffffffffffedd0000100000000000
77777777777777776666666666666666cccccccccccccccc11111111eeeeeeeeeeeeeeeedddddddddddddddd22222222ffffefffffffeedd0000100000000000
777777776666666666666666cccccccccccccccc1111111111111111eeeeeeeedddddddddddddddd2222222222222222fffffeffeffeeddd0011111000000000
77777777777777776666666666666666cccccccccccccccc11111111eeeeeeeeeeeeeeeedddddddddddddddd22222222efeffefeeeeedddd0001110000000000
777777776666666666666666cccccccccccccccc1111111111111111eeeeeeeeeeeeeeeedddddddddddddddd22222222eeeeeeeeeeeddddd0000100000000000
77777777777777776666666666666666cccccccccccccccc11111111eeeeeeeeeeeeeeeedddddddddddddddd22222222dddddddddddddddd0000000000000000
bbbbbbbb44444444bbbbbbbbbbbbbbbb00000000005ff500cccccccc555555558888888800000000000000000000000000000000000000000000000000000000
bbbbbbbb44454444bbbbbbbbbbbbbbbb8800000005500550ccc88ccc554444553337733300000000000000000000000000000000000000000000000000000000
4b444bb444444444bb444bb44b4b44bb8800000055000055cccc88cc545445453373373300000000000000000000000000000000000000000000000000000000
4444494445444444bb44494444b444bb05500000000000008888888c544554453733337300000000000000000000000000000000000000000000000000000000
9444444444444444bbb44444454444bb0055000000000000cccc88cc544554458333333800000000000000000000000000000000000000000000000000000000
4444444444544454bb4b444445449bbb0005500000000000ccc88ccc545445453733337388888888000000000000000000000000000000000000000000000000
4444554444444544bbb4554444444bbb5555555500000000cccccccc554444553373373307000070000000000000000000000000000000000000000000000000
4544444444444444bb444444444444bb8888888800000000cccccccc555555558888888888888888000000000000000000000000000000000000000000000000
44444444444444bbbb444444113bb313333333333333333333333333445444540000000000000000000000007777557777777777777777777777777777777777
4424444444554bbbbbbb444411333331bb3bbb3bb3bbbb3bbb3bbb3b555555550000000000000000000000007775555777777555777775555577555557777777
444244244444b4bbbb444444113bb311bbbbbb3bb3bb3b3bbbbbbb3b000000000000000000000000000000007755355577775555557555535557553555777777
2224224244444bbbbb444444113bb311333333333333333333333333000000000000000000000000000000007553335557755533557553333555533355577777
25525422444444bbbbb44444313bb31111111111113bb31111133311000000000000000000000000000000007553333355555333355533333355333335577777
22522222444444bbbb4b44441333331111111111113bb31111113331000000000000000000000000000000005533333335553333335533333333333335575555
222222224444bbbbbbb45544113bb311111111111133b31111111333000000000000000000000000000000005533333333333333333333333333333335555333
22252222444444bbbb444444113bb31111111111113bb31111111133000000000000000000000000000000003333333333333333333333333333333333553333
22222222444444bbbb44444400000000000000000000000000000000000000000000000000000000000000003333333333333333333333333333333333333333
22222222454444bbbb444444ff000000990000000000000000000000000000000000000000000000000000003333333333333333333333333333333333333333
222225224444544444444544ff000000990000000000000000000000000000000000000000000000000000003333333333333333333333333333333333333333
22222222444444444454444401100000055000000000000000000000000000000000000000000000000000003333333333333333333333333333333333333333
25225222444444444444454400110000005500000000000000000000000000000000000000000000000000003333333333333333333333333333333333333333
22222222454545444444444400011000000550000000000000000000000000000000000000000000000000003333333333333333333333333333333333333333
22222222444444444544454411111111555555552252222200000000000000000000000000000000000000003333333333333333333333333333333333333333
22252222444444444444444411111111999999992222225200000000000000000000000000000000000000003333333333333333333333333333333333333333
__gff__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000f0000000000000000000000000000000f0f0f0000000000000000000000000000000000000000000000000000000000000f0f0000000000000000000000000000000000000000000f0f0f0f000000000f000000000000000f0f0f0f0f0f0f0f00000000000000000f0f0f00000000000000000000000000
__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c40000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb000000000000000000000000000000000000000000000000000000000000000000000000
c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb000000000000000000000000000000000000000000000000000000000000000000000000
c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb000000000000000000000000000000000000000000000000000000000000000000000000
c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb000000000000000000000000000000000000000000000000000000000000000000000000
c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb000000000000000000000000000000000000000000000000000000000000000000000000
c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb000000000000000000000000000000000000000000000000000000000000000000000000
c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb000000000000000000000000000000000000000000000000000000000000000000000000
c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4d2d0d0d0d0cacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacaca000000000000000000000000000000000000000000000000000000000000000000000000
c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c4c4c4c4c4c4c4c4c4c4c4c4c4d6c4c4c4c4c4c4c4c4c4c4c4e2d1d1d1d1c9cccdc9c9c9c9c9cccdc9c9c9c9c9cccdc9c9c9c9c9c9c9c9c9c9c9c9c9c9c9000000000000000000000000000000000000000000000000000000000000000000000000
c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6d2d0d0d0d0d0c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4e2d1d1d1d1c9c9c9cccdc9c9c9c9c9cccdc9c9c9c9c9cccdc9c9c9c9d0d0d0c9d2d0d0d0d0000000000000000000000000000000000000000000000000000000000000000000000000
c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6e2d1d1d1d1d1c3c3c3c3c3c3c3c3c3d0d0d0d0d0d0d0d0d0d3c3c3c3c3c3c3e2d1d1d1d1c8c8c8c8c8c8c8c8c8c8c8c8c8c8c8c8c8c8c8c8c8c8c8c8c8c8c8e2d1d1d1d1000000000000000000000000000000000000000000000000000000000000000000000000
c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c68b999a89c6e2e0e0e0e0e0c1c1c1c1c1c1c1c1c1c1c1c1d1c1c1e2d1d1f1d3c1c1c1c1c1e2d1d1d1d1c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7e2d1d1d1d1000000000000000000000000000000000000000000000000000000000000000000000000
c6c6c6c6c6c6c6c6c6c6c6c6e4e6d2d0d0d0d0d0d0d0d0d0f2f0f0f0f0f0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0e2d1d1d1f1d3ebecedeee2d1d1d1d1c7c7c7c7c7c7c7c7c7c7c7d2d0d0d0d0d0d0c7c7d0d0d3c7c7c7c7e2d1d1d1d1000000000000000000000000000000000000000000000000000000000000000000000000
c6c6c6c6c6c6c6c6c6c6e5e4c6c6e2d1d1d1d1d1d1d1d1d1d1f0f0f0f0f0ebecedeeefebeceeefebecedefebece2d1d1d1d1f1d3d8d8d8e2d1d1d1d1c7c7c7c7c7c7c7c7c7c7c7e2c7e2d1d1d1d1c7c7d1d1e1c7c7c7c7e2d1d1d1d1000000000000000000000000000000000000000000000000000000000000000000000000
c6c6c6c6c6c6c6e5e4e5e3c6c6c6e2e0e0e0e0e0e0e0e0e0e0f0f0f0f0f0fbfcfdfefbfcfdfeffd2d0d0d0d0d0f2e0e0e0e0e0f1d0d0d0f2e0e0e0d1c7c7c7c7c7c7c7c7c7c7c7c7c7e2d1d1d1d1d1d1d1d1e1c7c7c7c7e2d1d1d1d1000000000000000000000000000000000000000000000000000000000000000000000000
c6c6c6c6e5e5c6e3c6e3e3c6c6c6e2f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0fbfcfdfefffbfbfdfee2e0e0e0e0e0e0f0f0f0f0f0e0e0e0e0e0f0f0f0d1c7c7c7c7c7c7c7c7c7c7c7c7c7e2d1d1d1d1d1d1d1d1e1c7c7c7c7e2d1d1d1d1000000000000000000000000000000000000000000000000000000000000000000000000
d0d0d0d0d0d0d0d0d0d0d0d0d0d0f2f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0d0d0d0d0d0d0d0d0d0f2f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0e0d0d0d0d0d0c7c7c7c7d0d0d0d0f2e0e0e0e0e0e0d1d1f1d0d0d0d0f2e0e0e0e0000000000000000000000000000000000000000000000000000000000000000000000000
e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0e0e0e0e0e0e0e0e0e0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0e0e0e0e0e0c7c7c7c7e0e0e0e0e0f0f0f0f0f0f0e0e0e0e0e0e0e0e0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000
f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000
