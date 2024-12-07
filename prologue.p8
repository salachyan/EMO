pico-8 cartridge // http://www.pico-8.com
version 42
__lua__

#include gameloop/initialize_prologue.lua
#include gameloop/draw_prologue.lua
#include gameloop/collisions.lua
#include gameloop/update_prologue.lua
--#include gameloop/level1.lua
#include gameloop/prologue.lua
#include gameloop/questions.lua
#include gameloop/storyline.lua
--#include gameloop/level1.lua
__gfx__
00000000000000000000000000000000000002222220000000000888888000000000088888800000000000000000000000000222222000000000000000000000
00000000000000000000000000000000000022222222000000008888888800000000888888880000000008888880000000002222222200000000022222200000
00000000000000000000000000000000000222222222200000088ff88ff8800000088ff88ff88000000088888888000000022222222220000000222222220000
0000099999900000000000000000000002222222222220000008f22ff22f80000008f22ff22f800000088ff88ff8800002222222222220000002222222222000
000099f99f9900000000099999900000000ccffccffcc00000f8ff1fff1f8f0000f8ff1fff1f8f000008f22ff22f8000000ccffccffcc0000222222222222000
000f9ffffff9f000000099f99f990000000cffffffffc00000f8ffffffff8f0000f8ffffffff8f0000f8ff1fff1f8f00000cffffffffc000000ccffccffcc000
000f9f1fff19f000000f9ffffff9f00000fcf11ff11fcf000008fff11fff80000008fff11fff800000f8ffffffff8f0000fcf11ff11fcf00000cffffffffc000
00009ffffff90000000f9f1fff19f00000fcffffffffcf00000088ffff880000000088ffff8800000008fff11fff800000fcffffffffcf0000fcf11ff11fcf00
00009ff111f9000000009ffffff90000000cff1111ffc00000000888888088000000088888800000000088ffff880000000cff1111ffc00000fcffffffffcf00
000009ffff90000000009ff111f900000000ccffffcc00000000008888008800000000888800000000000888888000000000ccffffcc0000000cff1111ffc000
0000009999000000000009ffff90000000000cccccc0000000008888888880000000888888880000000000888800000000000cccccc000000000ccffffcc0000
0000099ff99000000000009999000000000c00cffc000000000880888888000000088088880880000000888888880000000c00cffc00000000000cccccc00000
0000909ff90900000000099ff99000000000cccffcc000000008808888000000000880888800880000088088880880000000cccffcc00000000c00cffc000000
00009099990090000000909ff9090000000000cccc0c0000000000800880000000000080088088000008808888008800000000cccc0c00000000cccffcc00000
00000090090000000000009999000000000000c00c00c00000000880088000000000088008800000000000800880000000000c000c00c000000000cccc0c0000
0000005005500000000000550550000000000550550000000000555005550000000055500555000000005550055500000000050005500000000005505500c000
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
00000550000000000000055000500000000000000550000000000550050000000000555000000000000055500055500000000000055500000000005505550000
00000000000000000000000000000000111111111111111111111111111111111111111111111111111111111444441111111111111111111111111111111111
00000444444000000000044444400000111111111111111111111111111111111111111111111111111111144444444411111111111111111111111111111111
0000444444440000000044444444000011111111111111111111111111111111111111111111111111111444444444dd44111111116666666666666111111111
000449944ff44000000449944ff44000111111111111111111111111111111111111111111111111111444444444dddddd441111116666666666666111111111
00049ff9ffff400000049ff9ffff40001111111111111111111111111111111111111111111111111444444444dddddddddd4411111155555555511111111111
00f49f19ff1f4f0000f49f19ff1f4f0011111111111111111111111111111111111111111111111444444444dddddddddddddd44111155555555511111111111
00f9f99fffff4f0000f9f99fffff4f00111111111111111111111111111111111111111111111444444444dddddddddddddddddd441155555555511111111111
0004fff111ff40000004fff111ff40001111111111111111111111111111111111111111111444444444dddddddddddddddddddddd4455555555511111111111
000044ffff440000000044ffff44000011111111111111111111111111111111111111111444444444dddddddddddddddddddddddddd44555555511111111111
00000334433004000000044444400400111111111111111111111111111111111111111444444444dddddddddddddddddddddddddddddd445555511111111111
000000433400400000000044440040001111111111111111111111111111111111111444444444dddddddddddddddddddddddddddddddddd4455511111111111
00000443f44400000000044ff444000011111111111111111111111111111111111444444444dddddddddddddddddddddddddddddddddddddd44511111111111
00004043f40000000000404ff4000000111111111111111111111111111111111444444444dddddddddddddddddddddddddddddddddddddddddd441111111111
000040444400000000004044440000001111111111111111111111111111111444444444dddddddddddddddddddddddddddddddddddddddddddddd4411111111
0000004004000000000000400400000011111111111111111111111111111444444444dddddddddddddddddddddddddddddddddddddddddddddddddd44111111
00000550055000000000055005500000111111111111111111111111111444444444dddddddddddddddddddddddddddddddddddddddddddddddddddddd441111
888888883333333300000000000000001111111111111111111111111444444444dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd4411
88888888333333330000000000000000111111111111111111111114444444444444444444444444444444444444444444444444444444444444444444444444
88888888333333330000000000000000111111111111111111111444444444444444444444444444444444444444444444444444444444444444444444444444
88888888333333330000000000000000111111111111111111144444444444444444444444444444444444444444444444444444444444444444444444444411
88888888333333330000000000000000111111111111111111144ddddddddd444ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd4411
88888888333333330000000000000000111111111111111111144ddddddddd444ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd4411
88888888333333330000000000000000111111111111111111144ddddddddd444ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd4411
44444444444444440000000000000000111111111111111111144ddddddddd444444444444444444444444444444444444444444444444444444444444444411
99999999000000000000000000000000111111111111111111144ddddddddd444ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd4411
99999999000000000000000000000000111111111111111111144ddddddddd444ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd4411
99999999000000000000000000000000111111111111111111144ddddddddd444dddd44444444444dddddddddddddddddddddddd44444444444ddddddddd4411
99999999000000000000000000000000111111111111111111144ddddddddd444444440000400004444444444444444444444444400004000044444444444411
99999999000000000000000000000000111111111111111111144ddddddddd444dddd40000400004dddddddddddddddddddddddd40000400004ddddddddd4411
99999999000000000000000000000000111111111111111111144ddddddddd444dddd40000400004dddddddddddddddddddddddd40000400004ddddddddd4411
99999999000000000000000000000000111111111111111111144ddddddddd444dddd40000400004dddddddddddddddddddddddd40000400004ddddddddd4411
44444444000000000000000000000000111111111111111111144ddddddddd444444440000400004444444444444444444444444400004000044444444444411
11111111111111141111111111111111111111111111111111144ddddddddd444dddd4000040000499999999999999999999999940000400004ddddddddd4411
11111111111114444411111111111111111111111111111111144ddddddddd444dddd4000040000499999999999999999999999940000400004ddddddddd4411
11111111111144ddd441111111111111111111111111111111144ddddddddd444dddd4000040000499999999999999999999999940000400004ddddddddd4411
1111111111144ddddd44411111111111111111111111111111144ddddddddd444444440000400004999999999999999999999999400004000044444444444411
111111111444dddddddd444111111111111111111111111111144ddddddddd444dddd4000040000499999999999999999999999940000400004ddddddddd4411
1111111444dddddddddddd4441111111111111111111111111144ddddddddd444dddd4000040000499999999999999999999999940000400004ddddddddd4411
11111144dddddddddddddddd44411111111111111111111111144ddddddddd444dddd4000040000499999999999999999999999940000400004ddddddddd4411
1111444ddddddddddddddddddd441111111111111111111111144ddddddddd444444444444444444444444444444444444444444444444444444444444444411
11444ddddddddddddddddddddddd4411111111111111111111144ddddddddd444ddddddddddddddddddd4444444444444444dddddddddddddddddddddddd4411
1441ddddddd44444444444dddddd1444111111111111111111144ddddddddd444ddddddddddddddddddd4000000000000004dddddddddddddddddddddddd4411
4411ddddddd40000400004dddddd1114111111111111111111144ddddddddd444ddddddddddddddddddd4000000000000004dddddddddddddddddddddddd4411
1111ddddddd40000400004dddddd1111111111111111111111144ddddddddd444444444444444444444440000000000000044444444444444444444444444411
1111ddddddd44444444444dddddd1111111111111111111111144ddddddddd444ddddddddddddddddddd4000000000000004dddddddddddddddddddddddd4411
1111ddddddd40000400004dddddd1111111111111111111111144ddddddddd444ddddddddddddddddddd4000000000000004dddddddddddddddddddddddd4411
1111ddddddd40000400004dddddd1111111111111111111111144ddddddddd444ddddddddddddddddddd4000000000000004dddddddddddddddddddddddd4411
1111ddddddd40000400004dddddd1111111111111111111144444444444444444444444444444444444440000000000000044444444444444444444444444411
1111ddddddd44444444444dddddd11111111111111111144444444444444dd444ddddddddddddddddddd4000000000000004dddddddddddddddddddddddd4411
1111dddddddddddddddddddddddd111111111111111111444444444444dddd444ddddddddddddddddddd4000000000000004dddddddddddddddddddddddd4411
1111dddddddddddddddddddddddd1111111111111111444444444444dddddd444ddddddddddddddddddd4000000000000004dddddddddddddddddddddddd4411
1111dddddddddddddddddddddddd111111111111111144444444444ddddddd444444444444444444444440000000000000044444444444444444444444444411
1111dddddddddddddddddddddddd11111111111111114ddddddddd4ddddddd444ddddddddddddddddddd4000000000000004dddddddddddddddddddddddd4411
1111dddddddddddddddddddddddd11111111111111114ddddddddd4ddddddd444ddddddddddddddddddd4000000000000004dddddddddddddddddddddddd4411
1111dddddddddddddddddddddddd11111111111111114ddddddddd4ddddddd444ddddddddddddddddddd4000000000000004dddddddddddddddddddddddd4411
1111ddddddddd4444444dddddddd11111111111111114ddddddddd4ddddddd444444444444444444444440000000000000044444444444444444444444444411
1111ddddddddd4666664dddddddd11111111111111114ddddddddd4ddddddd444ddddddddddddddddddd4000000000000004dddddddddddddddddddddddd4411
1111ddddddddd4666664dddddddd11111111111111114ddddddddd4ddddddd444ddddddddddddddddddd4000000000000004dddddddddddddddddddddddd4411
1111ddddddddd4666664dddddddd11111111111111114ddddddddd4ddddddd444ddddddddddddddddddd4000000000000004dddddddddddddddddddddddd4411
1111ddddddddd4666464dddddddd11111111111111114ddddddddd4ddddddd444444444444444444444440000000000000044444444444444444444444444411
1111ddddddddd4666664dddddddd11111111111111114ddddddddd4ddddddd444ddddddddddddddddddd4000000000000004dddddddddddddddddddddddd4411
1111ddddddddd4666664dddddddd11111111111111114ddddddddd4ddddddd444ddddddddddddddddddd4000000000000004dddddddddddddddddddddddd4411
1111ddddddddd4666664dddddddd11111111111111114ddddddddd4ddddddd444ddddddddddddddddddd4000000000000004dddddddddddddddddddddddd4411
1111ddddddddd4666664dddddddd11111111111111114ddddddddd4ddddddd444444444444444444444440000000000000044444444444444444444444444411
777777776666666666666666ccccccccdddd4444444444444444dddddddd4444444444444444dddd000000000000000000000000000000000000000000000000
777777776666666666666666ccccccccdddd4666666666666664dddddddd4666660000000004dddd000000000000000000000000000000000000100000000000
777777776666666666666666ccccccccdddd4666666666666664dddddddd4666666600000004dddd000000000000000000000000000000000000100000000000
77777777777777776666666666666666444446666666666666644444444446666666660000044444000000000000000000000000000000000000100000000000
777777776666666666666666ccccccccdddd4666666666666664dddddddd4666666666660004dddd000000000000000000000000000000000011111000000000
77777777777777776666666666666666dddd4666666666666664dddddddd4666666666660004dddd000000000000000000000000000000000001110000000000
777777776666666666666666ccccccccdddd4666666666666664dddddddd4666666666660004dddd000000000000000000000000000000000000100000000000
77777777777777776666666666666666444446666666666666644444444446666666666600044444000000000000000000000000000000000000000000000000
bbbbbbbb44444444bbbbbbbbbbbbbbbbdddd4666666666666664dddddddd4666666666660004dddd000000000000000000000000000000000000000000000000
bbbbbbbb44454444bbbbbbbbbbbbbbbbdddd4666666666666664dddddddd4666666666660004dddd000000000000000000000000000000000000000000000000
4b444bb444444444bb444bb44b4b44bbdddd4666666666666664dddddddd4666666666660004dddd000000000000000000000000000000000000000000000000
4444494445444444bb44494444b444bb444446666666666446644444444446666666446600044444000000000000000000000000000000000000000000000000
9444444444444444bbb44444454444bbdddd4666666666644664dddddddd4666666644660004dddd000000000000000000000000000000000000000000000000
4444444444544454bb4b444445449bbbdddd4666666666666664dddddddd4666666666660004dddd000000000000000000000000000000000000000000000000
4444554444444544bbb4554444444bbbdddd4666666666666664dddddddd4666666666660004dddd000000000000000000000000000000000000000000000000
4544444444444444bb444444444444bb444446666666666666644444444446666666666600044444000000000000000000000000000000000000000000000000
44444444444444bbbb444444113bb313dddd4666666666666664dddddddd4666666666660004dddd000000000000000000000000000000000000000000000000
4424444444554bbbbbbb444411333331dddd4666666666666664dddddddd4666666666660004dddd000000000000000000000000000000000000000000000000
444244244444b4bbbb444444113bb311dddd4666666666666664dddddddd4666666666660004dddd000000000000000000000000000000000000000000000000
2224224244444bbbbb444444113bb311444446666666666666644444444446666666666600044444000000000000000000000000000000000000000000000000
25525422444444bbbbb44444313bb311dddd4666666666666664dddddddd4666666666660004dddd000000000000000000000000000000000000000000000000
22522222444444bbbb4b444413333311dddd4666666666666664dddddddd4666666666660004dddd000000000000000000000000000000000000000000000000
222222224444bbbbbbb45544113bb311dddd4666666666666664dddddddd4666666666660004dddd000000000000000000000000000000000000000000000000
22252222444444bbbb444444113bb311444446666666666666644444444446666666666600044444000000000000000000000000000000000000000000000000
22222222444444bbbb44444400000000555555555555555500000000000000000000000000000000000000000000000000000000000000000000000000000000
22222222454444bbbb444444ff000000577777777777777500000000000000000000000000000000000000000000000000000000000000000000000000000000
222225224444544444444544ff000000577777777777777500000000000000000000000000000000000000000000000000000000000000000000000000000000
2222222244444444445444440110000057f777f777777f7500000000000000000000000000000000000000000000000000000000000000000000000000000000
25225222444444444444454400110000588879997777434500000000000000000000000000000000000000000000000000000000000000000000000000000000
22222222454545444444444400011000578777977777747500000000000000000000000000000000000000000000000000000000000000000000000000000000
22222222444444444544454411111111587879797777474500000000000000000000000000000000000000000000000000000000000000000000000000000000
22252222444444444444444411111111555555555555555500000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb000000000000000000000000000000000000000000000000000000000000000000000000
444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb000000000000000000000000000000000000000000000000000000000000000000000000
444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb000000000000000000000000000000000000000000000000000000000000000000000000
4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb000000000000000000000000000000000000000000000000000000000000000000000000
4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb000000000000000000000000000000000000000000000000000000000000000000000000
4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb000000000000000000000000000000000000000000000000000000000000000000000000
4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb000000000000000000000000000000000000000000000000000000000000000000000000
4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444cacacacacacacacacacacacacacacacacacacacacacacacacacaca000000000000000000000000000000000000000000000000000000000000000000000000
45464748494a4b4c4d4e4f4445464748494a4b4c4d4e4f4444444444444444444445464748494a4b4c4d4e4f444444444444444444444444444444444444444444c9c9c9cccdc9c9c9c9c9cccdc9c9c9c9c9c9c9c9c9c9c9c9c9c9c9000000000000000000000000000000000000000000000000000000000000000000000000
55565758595a5b5c5d5e5f5455565758595a5b5c5d5e5f4444444444444444444455565758595a5b5c5d5e5f444444444444444444444444444444444444444444c9c9c9c9c9cccdc9c9c9c9c9cccdc9c9c9c9d0d0d0c9d2d0d0d0d0000000000000000000000000000000000000000000000000000000000000000000000000
65666768696a6b6c6d6e6f6465666768696a6b6c6d6e6f4444444444444444444465666768696a6b6c6d6e6f444444444444444444444444444444444444444444c8c8c8c8c8c8c8c8c8c8c8c8c8c8c8c8c8c8c8c8c8c8e2d1d1d1d1000000000000000000000000000000000000000000000000000000000000000000000000
75767778797a7b7c7d7e7f7475767778797a7b7c7d7e7f4444444444444444444475767778797a7b7c7d7e7f444444444444444444444444444444444444444444c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7e2d1d1d1d1000000000000000000000000000000000000000000000000000000000000000000000000
85868788897070708d8e8f8485868788896060608d8e8f8081828344808182834485868788896161618d8e8f444444444444444444444444444444444444444444c7c7c7c7c7c7d2d0d0d0d0d0d0c7c7d0d0d3c7c7c7c7e2d1d1d1d1000000000000000000000000000000000000000000000000000000000000000000000000
9596979899c4c5c69d9e9f949596979899c4c5c69d9e9f9091929344909192934495969798999a9b9c9d9e9f444444444444444444444444444444444444444444c7c7c7c7c7c7e2c7e2d1d1d1d1c7c7d1d1e1c7c7c7c7e2d1d1d1d1000000000000000000000000000000000000000000000000000000000000000000000000
a5a6a7a8a9d4d5d6adaeafa4a5a6a7a8a9d4d5d6adaeafa0a1a2a344a0a1a2a344a5a6a7a8a9aaabacadaeaf444444444444444444444444444444444444444444c7c7c7c7c7c7c7c7e2d1d1d1d1d1d1d1d1e1c7c7c7c7e2d1d1d1d1000000000000000000000000000000000000000000000000000000000000000000000000
b5b6b7b8b9e4e5e6bdbebfb4b5b6b7b8b9e4e5e6bdbebfb0b1b2b344b0b1b2b344b5b6b7b8b9babbbcbdbebf444444444444444444444444444444444444444444c7c7c7c7c7c7c7c7e2d1d1d1d1d1d1d1d1e1c7c7c7c7e2d1d1d1d1000000000000000000000000000000000000000000000000000000000000000000000000
d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0c7c7c7c7d0d0d0d0f2e0e0e0e0e0e0d1d1f1d0d0d0d0f2e0e0e0e0000000000000000000000000000000000000000000000000000000000000000000000000
e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0e0e0e0e0e0e0e0e0e0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0e0e0e0e0e0c7c7c7c7e0e0e0e0e0f0f0f0f0f0f0e0e0e0e0e0e0e0e0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000
f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000
