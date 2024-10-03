pico-8 cartridge // http://www.pico-8.com
version 42
__lua__

#include gameloop/hello.lua
#include gameloop/camera.lua
#include gameloop/file3.lua
#include gameloop/collisions.lua
#include gameloop/update.lua

__gfx__
000000000000011111100000000001111110000033333333cccccccc54444445cccaaccc44444444cccccccc0000000000000000000000000000000000000000
000000000000199999910000000018888881000033333333cccccccc45444454ccaaaacc44444444cccccccc0000000000000000000000000000000000000000
007007000001999999991000000188888888100044444444cccccccc44544544ccaa9acc44444444cccccccc0000000000000000000000000000000000000000
0007700000199ff99ff9910000188ff88ff8810044444444cccccccc44455444ccaa9acc44444444c8cccccc0000000000000000000000000000000000000000
000770000019ff1ff1ff91000018ff1ff1ff810044444444cccccccc44455444ccaa9acc44444444ccdccccc0000000000000000000000000000000000000000
0070070001f9ff1ff1ff9f1001f8ff1ff1ff8f1044444444cccccccc44544544ccaa9acc44444444cccdcccc0000000000000000000000000000000000000000
0000000001f9ffffffff9f1001f8ffffffff8f1044444444cccccccc45444454ccaaaacc44444444ccccdccc0000000000000000000000000000000000000000
000000000019fff11fff91000018fff11fff810044444444cccccccc54444445cccaaccc44444444dddddddd0000000000000000000000000000000000000000
00000000000199ffff991000000188ffff8810000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000019999991000000001888888100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000001999910000000000188881000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000119999991100000011888888110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000001191999919110000118188881811000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000001911999911910000181188881181000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000119911991100000011881188110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000011111111000000001111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000005000011111100000000001111110000000000000004444400044444000000000000000000000000000000000cccccccccccccccc0000000000000000
00000000500014444441000000001444444100000000000000ccccc00099999000444400000000000044440000000000cccccccccccccccc0000000000000000
0000000050014444444410000001444444441000000000000cf72f2009f72f2004f1f1400000000004f1f14000000000cccccccccccccccc0000000000000000
0000000050044ff44ff4410000144ff44ff44100000000000cfffff009fffff0f4ffef4f00000000f4ffef4f00000000cccccccccccccccc0000000000000000
000000005004ff1ff1ff41000014ff7ff7ff410000000000000cc0000009900004444440000000000444444000000000cccccccccccccccc0000000000000000
0000000050f4ff1ff1ff4f1001f4ff1ff1ff4f100000000000cccc0000999900004ff40000000000004ff40000000000cccccccccccccccc0000000000000000
0000000050f4ffffffff4f1001f4ffffffff4f10000000000f0cd0f00f09d0f0044ff44000000000044ff44000000000cccccccccccccccc0000000000000000
000000005004fff11fff41000014fff11fff41000000000000c00d0000900d0000400400000000000040040000000000cccccccccccccccc0000000000000000
00000000500044ffff441000000144ffff44100000000000000000000000000000000000000000000000000000000000cccccccccccccccc0000000000000000
000000005000044444400000000014444441000000000000000000000000000000000000000000000000000000000000cccccccccccccccc0000000000000000
000000005000004444000000000001444410000000000000000000000000000000000000000000000000000000000000cccccccccccccccc0000000000000000
000000005000044444400000000114444441100000000000000000000000111111111000000000001111100000000000cccccccccccc00000000000000000000
000000005000404444040000001141444414110000000000000000000001444444444100000000004444410000000000ccccccccccc044440000000000000000
000000005004004444004000001411444411410000000000000000000014444444444410000000004444441000000000cccccccccc0444440000000000000000
000000005000004004000000000114411441100000000000000000000144444444444441000000004444444100000000ccccccccc04444440000000000000000
000000005000044004400000000011100111000000000000000000111144fff44444ff41111000004444ff4111100000cccccc000044fff40000000000000000
00000000000001fff14ff1ff444f1f41fff1000000000000000001fff14ff1ff444f1f41fff10000444f1f41fff10000ccccc0fff04ff0ff0000000000000000
00000000000001fff14ff1ffffff1f41fff1000000000000000001fff14ff1ffffff1f41fff10000ffff1f41fff10000ccccc0fff04ff0ff0000000000000000
0000000000000011114fffff11ffff41111000000000000000000011114fffff11ffff411110000011ffff4111100000cccccc00004fffff0000000000000000
0000000000000000014fffffffffff41000000000000000000000000014fffffffffff4100000000ffffff4100000000ccccccccc04fffff0000000000000000
00000000000000000014ffffffffff100000000000000000000000000014ffffffffff1000000000ffffff1000000000cccccccccc04ffff0000000000000000
000000000000000000011144444111000000000000000000000000000001114444411100000000004441110000000000ccccccccccc000440000000000000000
000000000000001100001444444410000000000000000000000000110000144444441000000000004444100000000000cccccc00cccc04440000000000000000
000000000000010010014444444441000000000000000000000001001001444444444100000000004444410000000000ccccc0cc0cc044440000000000000000
00000000000001000001444fff4441000000000000000000000001000001444fff44410000000000ff44410000000000ccccc0ccccc0444f0000000000000000
0000000000000010001444fffff44410000000000000000000000010001444fffff4441000000000fff4441000000000cccccc0ccc0444ff0000000000000000
0000000000000001001444fffff44410000000000000000000000001001444fffff4441000000000fff4441000000000ccccccc0cc0444ff0000000000000000
0000000000000000111444fffff44410000000000000000000000000111444fffff4441000000000fff4441000000000cccccccc000444ff0000000000000000
00000000000000000011144fff4411000000000000000000000000000011144fff44110000000000ff44110000000000cccccccccc00044f0000000000000000
000000000000000000001441114410000000000000000000000000000000144111441000000000001144100000000000cccccccccccc04400000000000000000
000000000000000000001410001410000000000000000000000000000000141000141000000000000014100000000000cccccccccccc040c0000000000000000
000000000000000000001100000110000000000000000000000000000000110000011000000000000001100000000000cccccccccccc00cc0000000000000000
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060600000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060600000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060600000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060600000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060600000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
50505050505050505050505050505050505050505050505050505050505050505050505050505050505050505050505050505050505050505050000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
90909090909090909090909090909090909090909090909090909090909090909090909090909090909090909090909090909090909090909090000000000000
__map__
0606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0606060606060606060606060806060606060606060606060606060606060606060606060606060606060606060606060606060606060606000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0606060505050505060505050505050506060601010101010106060606060606060606060606060606060606060606060606060606060606000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0606060606060606060606060606060906060101010101010106060606060606060606060606060606060606060606060606060606060606000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0606060606060606060606060606060906060101010101010106060606060606060606060606060606060606060606060606060606060606000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
060106010606060606060606080a060906060101010101010606060606060606060606060606060606060606060606060606060606060606000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0606060606060606060505050505050906060606060101010606060606060606060606060606060606060606060606060606060606060606000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0606060606060606060909090909090906010606060606060606060606060606060606060606060606060606060606060606060606060606000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0505050505050505050505050505050505050505050505050505050909090909090909090909090909090909090909090909090606060606000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0909090909090909090909090909090909090909090909090909090909090909090909090909090909090909090909090909090606060606000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0909090909090909090909090909090909090909090909090909090909090909090909090909090909090909090909090909090606060606000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606060606000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
