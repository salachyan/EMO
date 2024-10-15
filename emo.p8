pico-8 cartridge // http://www.pico-8.com
version 42
__lua__

#include gameloop/initialize.lua
#include gameloop/camera.lua
#include gameloop/draw.lua
#include gameloop/collisions.lua
#include gameloop/update.lua

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000088888800000000008888880000000000888888000000000088888800000
00000999999000000000099999900000000009999990000000000999999000000000888888880000000088888888000000008888888800000000888888880000
000099999999000000009999999900000000999999990000000099999999000000088ff88ff8800000088ff88ff8800000088ff88ff8800000088ff88ff88000
00099ff99ff9900000099ff99ff9900000099ff99ff9900000099ff99ff990000008f22ff22f80000008f22ff22f80000008f22ff22f80000008f22ff22f8000
0009ffffffff90000009ffffffff90000009ffffffff90000009ffffffff900000f8ff1fff1f8f0000f8ff1fff1f8f0000f8ff1fff1f8f0000f8ff1fff1f8f00
00f9ff1fff1f9f0000f9ff1fff1f9f0000f9ff1fff1f9f0000f9ff1fff1f9f0000f8ffffffff8f0000f8ffffffff8f0000f8ffffffff8f0000f8ffffffff8f00
00f9ffffffff9f0000f9ffffffff9f0000f9ffffffff9f0000f9ffffffff9f000008fff11fff80000008fff11fff80000008fff11fff80000008fff11fff8000
0009fff111ff90000009fff111ff90000009fff111ff90000009fff111ff9000000088ffff880000000088ffff880880000088ffff880000000088ffff880000
000099ffff990000000099ffff990000000099ffff990000000099ffff9900000000088888800000000008888880088000000888888000000000088888800000
00000999999000000000099999900900000009999990090000000999999009000000008888000000000000888800880000000088880000000000008888000000
00000099990000000000009999009000000000999900900000000099990090000000888888880000000088888888800000008888888800000000888888880000
0000099ff99000000000099ff99900000000099ff99900000000099ff99900000008808888088000000880888800000000088088880880000008808888088000
0000909ff90900000000909ff90000000000909ff90000000000909ff90000000008808888008800000880888800000000088088880088000008808888008800
00009099990090000009009999000000000900999900000000090099990000000000008008808800000000800880000000000080088088000000008008808800
00000090090000000000009005500000000000900550000000000090055000000000088008800000000008800555000000000880088000000000088008800000
00000550055000000000055000000000000005500000000000000550000000000000555005550000000055500000000000005550055500000000555005550000
00000000000000000000000000000000000000000000000000000000000000000000088888800000000008888880000000000888888000000000088888800000
00000999999000000000099999900000000009999990000000000999999000000000888888880000000088888888000000008888888800000000888888880000
000099999999000000009999999900000000999999990000000099999999000000088ff88ff8800000088ff88ff8800000088ff88ff8800000088ff88ff88000
00099ff99ff9900000099ff99ff9900000099ff99ff9900000099ff99ff990000008f22ff22f80000008f22ff22f80000008f22ff22f80000008f22ff22f8000
0009ffffffff90000009ffffffff90000009ffffffff90000009ffffffff900000f8ff1fff1f8f0000f8ff1fff1f8f0000f8ff1fff1f8f0000f8ff1fff1f8f00
00f9ff1fff1f9f0000f9ff1fff1f9f0000f9ff1fff1f9f0000f9ff1fff1f9f0000f8ffffffff8f0000f8ffffffff8f0000f8ffffffff8f0000f8ffffffff8f00
00f9ffffffff9f0000f9ffffffff9f0000f9ffffffff9f0000f9ffffffff9f000008fff11fff80000008fff11fff80000008fff11fff80000008fff11fff8000
0009fff111ff90000009fff111ff90000009fff111ff90000009fff111ff9000000088ffff880000000088ffff880000000088ffff880000000088ffff880000
000099ffff990000000099ffff990000000099ffff990000000099ffff9900000000088888800000000008888880000000000888888000000000088888800000
00000999999000000000099999900000000009999990000000000999999000000000008888000000000000888800000000000088880000000000008888000000
00000099990000000000009999000000000000999900000000000099990000000000888888880000000088888888000000008888888800000000888888880000
0000099ff99000000000099ff99000000000099ff99000000000099ff99000000008808888088000000880888808800000088088880880000008808888088000
0000909ff90900000000909ff90900000000909ff90900000000909ff90900000008808888008800000880888800880000088088880088000008808888008800
00009099990090000000909999009000000090999900900000009099990090000000008008808800000000800880000000000088088088000000008808808800
00000090055000000000009000900000000000550900000000000090090000000000088005550000000008800088000000000055588000000000008808800000
00000550000000000000055000500000000000000550000000000055050000000000555000000000000055500055500000000000055500000000000000000000
00000000000000000000000000000000000000006600000006600000000000000000000000000000000000000000000000000000000000000000055555500000
00000444444000000000044444400000000000065500000005600000000000000000000000000000000000000000000000000000000000000000511111150000
00004444444400000000444444440000000000655500000665600000000000000000000000000000000000000000000000000000000000000005111111115000
000449944ff44000000449944ff44000000000655600006655560000000000000000000000000000000000000000000000000000000000000051111111111500
00049ff9ffff400000049ff9ffff4000000006666666666666616000000000000000000000000000000000000000000000000000000000005515111111111500
00f49f19ff1f4f0000f49f19ff1f4f0000000666166666666616666000000000000000000000000000000000000000000000000000000005111151ddddd11150
00f9f99fffff4f0000f9f99fffff4f00000066661116666611666776000000000000000000000000000000000000000000000000000000511111511677866150
0004fff111ff40000004fff111ff4000000066666621666666266677771100000000000000000000000000005000500000000000000005111111156666666665
000044ffff440000000044ffff4400000000666666266666662667777771100000000000000000000000000595059500000005550000511111111156666666f5
00000884488004000000044444400400000066666666666666667777777110000000000000000000000000599555950000005111555511111111111566662225
00000048840040000000004444004000000066666666666666666277777700000005000000000000000005995999950000051111111111111111111566626665
00000448f44400000000044ff4440000000066666666666666666722222000000059500000000000000005999978995000511111111111111111111156666650
00004048f40000000000404ff4000000000006666666666666666677770000000599500000000000000059995999915000511111111111111111111155555500
00004044440000000000404444000000000000666666666666666000000000005995000005555555555599959991995000511111111111111111111115000000
00000040040000000000004004000000000000006666666666660000000000005950000559999999999999999599115000511111111111111111111111500000
00000550055000000000055005500000000000066666666666600000000000005950005999959995999999999999950000511111111111111111111111500000
00000000000001fff14ff1ff444f1f41000000666766666666666000000000005995005999999999999955999955500000511111111111111116111111150000
00000000000001fff14ff1ffffff1f41000066667666666666666660000000000599555959995999995999995950000000511111111166666666611111150000
0000000000000011114fffff11ffff41000666770666666666666666000000000059995995999995999999959995000000511111166666666666661111115000
0000000000000000014fffffffffff41000677700666666666600666600000000005555999599999999599999995000000551111116666666666666111115000
00000000000000000014ffffffffff10006777000666666666600066660000000000005999999999999995999995000000551111116666666666666511115000
00000000000000000001114444411100000777500666666666600006dd0000000000005599955955559999999959500000511115515555555666666511111500
0000000000000011000014444444100000000000dd66666666600000dd0000000000059999599500005595559599500005111151150000005555555551111500
000000000000010010014444444441000000000d6666666666660000000000000000059955595000000059995999500005111151115000000000051151111500
00000000000001000001444fff444100000000d66066666666660000000000000000595950595000000059950595950051111511115000000000511151111150
0000000000000010001444fffff4441000000d660066660000666000000000000000599950595000000059950059950051111511111500000000511155111150
0000000000000001001444fffff444100000d6660666600000066600000000000000559550565000000059500005950051115051111500000005111505111150
0000000000000000111444fffff44410000d66600660000000066600000000000000599500565000000599500005995051115005111500000051111500511115
00000000000000000011144fff44110000d666600660000000666000000000000000565500566500000599500005955056665005666650000051111500511115
0000000000000000000014411144100000d660000666600000666000000000000000565000056650000565000000565056665000566650000566665000566665
000000000000000000001410001410000000000000066d0000066ddd000000000000565000005650000565000000566556666500566650000566665000056665
000000000000000000001100000110000000000000066dd00000dddd000000000000050000000500000050000000055005555000055500000055550000005550
4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c0000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c0000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c0000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c0000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
777777776666666666666666cccccccccccccccc1111111111111111000000000000000000000000000000000000000000000000000000000000000000000000
777777776666666666666666cccccccccccccccccccccccc11111111000000000000000000000000000000000000000000000000000000000000000000000000
777777776666666666666666cccccccccccccccc1111111111111111000000000000000000000000000000000000000000000000000000000000000000000000
77777777777777776666666666666666cccccccccccccccc11111111000000000000000000000000000000000000000000000000000000000000000000000000
777777776666666666666666cccccccccccccccc1111111111111111000000000000000000000000000000000000000000000000000000000000000000000000
77777777777777776666666666666666cccccccccccccccc11111111000000000000000000000000000000000000000000000000000000000000000000000000
777777776666666666666666cccccccccccccccc1111111111111111000000000000000000000000000000000000000000000000000000000000000000000000
77777777777777776666666666666666cccccccccccccccc11111111000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbb44444444bbbbbbbbbbbbbbbb00000000001ee100cccccccc555555550000000000000000000000000000000000000000000000000000000000000000
bbbbbbbb44454444bbbbbbbbbbbbbbbbee00000001100110ccc88ccc554444550000000000000000000000000000000000000000000000000000000000000000
4b444bb444444444bb444bb44b4b44bbee00000011000011cccc88cc545445450000000000000000000000000000000000000000000000000000000000000000
4444494445444444bb44494444b444bb01100000000000008888888c544554450000000000000000000000000000000000000000000000000000000000000000
9444444444444444bbb44444454444bb0011000000000000cccc88cc544554450000000000000000000000000000000000000000000000000000000000000000
4444444444544454bb4b444445449bbb0001100000000000ccc88ccc545445450000000000000000000000000000000000000000000000000000000000000000
4444554444444544bbb4554444444bbb1111111100000000cccccccc554444550000000000000000000000000000000000000000000000000000000000000000
4544444444444444bb444444444444bb1111111100000000cccccccc555555550000000000000000000000000000000000000000000000000000000000000000
44444444444444bbbb44444477775577000000000000000000000000000000000000000000000000000000007777557777777777777777777777777777777777
4424444444554bbbbbbb444477755557000000000000000000000000000000000000000000000000000000007775555777777555777775555577555557777777
444244244444b4bbbb44444477553555000000000000000000000000000000000000000000000000000000007755355577775555557555535557553555777777
2224224244444bbbbb44444475533355000000000000000000000000000000000000000000000000000000007553335557755533557553333555533355577777
25525422444444bbbbb4444475533333000000000000000000000000000000000000000000000000000000007553333355555333355533333355333335577777
22522222444444bbbb4b444455333333000000000000000000000000000000000000000000000000000000005533333335553333335533333333333335575555
222222224444bbbbbbb4554455333333000000000000000000000000000000000000000000000000000000005533333333333333333333333333333335555333
22252222444444bbbb44444433333333000000000000000000000000000000000000000000000000000000003333333333333333333333333333333333553333
22222222444444bbbb44444433333333000000000000000000000000000000000000000000000000000000003333333333333333333333333333333333333333
22222222454444bbbb44444433333333000000000000000000000000000000000000000000000000000000003333333333333333333333333333333333333333
22222522444454444444454433333333000000000000000000000000000000000000000000000000000000003333333333333333333333333333333333333333
22222222444444444454444433333333000000000000000000000000000000000000000000000000000000003333333333333333333333333333333333333333
25225222444444444444454433333333000000000000000000000000000000000000000000000000000000003333333333333333333333333333333333333333
22222222454545444444444433333333000000000000000000000000000000000000000000000000000000003333333333333333333333333333333333333333
22222222444444444544454433333333000000000000000000000000000000000000000000000000000000003333333333333333333333333333333333333333
22252222444444444444444433333333000000000000000000000000000000000000000000000000000000003333333333333333333333333333333333333333
__gff__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000101010100000001000000000000000001010f0100000000000000000000000001010101000000000000000000000000
__map__
c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c5c5c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c40000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c40000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c40000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c40000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c40000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c40000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c40000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c4c4c4c4c4c4c4c4c4c4c4c4c4d6c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c3c3c3c3c3c3c3c3c3c3d0d0d0d0d0d0d0d0d3c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1e2d1d1e1c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0e2d1d1e1c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ebececeeefebeceeefebecedefebece2d1d1e1c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
fbfcfdfefbfcfdfeffd2d0d0d0d0d0f2d1d1e1c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
fbfcfbfbfffbfbfbfbe2d1d1d1d1d1d1d1d1e1c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d0d0d0d0d0d0d0d0d0f2e0e0e0e0e0e0e0e0f1d0d0d0d0c4c4c4c4d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1c4c4c4c4c4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
e0e0e0e0e0e0e0e0e0f0f0f0f0f0f0f0f0f0e0e0d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1c4c4c4c4c4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1c4c4c4c4c4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4c4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
