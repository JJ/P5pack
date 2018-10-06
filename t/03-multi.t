use v6.c;
use Test;
use P5pack;

# Examples from perl5 documentation (ignoring the very Unix-specific ones)

#is pack("WWWW",65,66,67,68), Buf.new(65,66,67,68);
#is pack("W4",65,66,67,68), Buf.new(65,66,67,68);
#is pack("W4",0x24b6,0x24b7,0x24b8,0x24b9), Buf.new(??);
#is pack("W4",0x24b6,0x24b7,0x24b8,0x24b9), Buf.new(??);
#is pack("C0U4",0x24b6,0x24b7,0x24b8,0x24b9), Buf.new(0xe2, 0x92, 0xb6, 0xe2, 0x92, 0xb7, 0xe2, 0x92, 0xb8, 0xe2, 0x92, 0xb9);
 is pack("ccxxcc",65,66,67,68), Buf.new(0x41, 0x42, 0x00, 0x00, 0x43, 0x44);
 is pack("a4","abcd","x","y","z"), Buf.new(0x61, 0x62, 0x63, 0x64);
 is pack("aaaa","abcd","x","y","z"), Buf.new(0x61, 0x78, 0x79, 0x7a);
 is pack("a14","abcdefg"), Buf.new(0x61, 0x62, 0x63, 0x64, 0x65, 0x66, 0x67, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
 is pack('sx2l', 12, 34), Buf.new(0x0c, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00);
#is pack('s@4l', 12, 34), Buf.new(??);
#is pack('s.l', 12, 4, 34), Buf.new(??);
 is pack('nN', 42, 4711), Buf.new(0x00, 0x2a, 0x00, 0x00, 0x12, 0x67);
#is pack('S>L>', 42, 4711), Buf.new(??);
#is pack('S>L>', 42, 4711), Buf.new(??);
#is pack('(sl)<', -42, 4711), Buf.new(??);

 #Examples from the pack man page
# W is not implemented
 #is unpack("W/a", Blob.new("\004Gurusamy".comb.map: -> $a { $a??$a.ord!!0 })),"Guru";
 # / is not implemented
 #is unpack("a3/A A*", blobify("007 Bond  J ")), (blobify(" Bond"), blobify("J"));

 is unpack("C0A*", blobify("03B1.03C9")), "03B1.03C9";
 done-testing;



