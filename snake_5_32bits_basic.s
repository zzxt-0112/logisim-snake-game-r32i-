start:
addi a0,zero,1
beq a0,zero,game
lui x30,0x2
lui x31,0x40000
sw zero ,0(x31)
lui x31,0x30000
addi x29,zero,1028 #head
addi x28,zero,1028 #tail
lui x14, 0xFFFF0
addi x14, x14, 0xFF
lui  x27,1     
addi x27,x27,-4 
addi x12,zero,0
addi x19,zero,0

main:
lui x20,0x1000
addi,x20,x20,-1
lui x21,0x1
add x21,x21,x31
addi x22,x31,-128
addi x23,x30,-128

resart:
addi x22,x22,128
sw zero, 0(x22)
sw zero, 4(x22)
sw zero, 8(x22)
sw zero, 12(x22)
sw zero, 16(x22)
sw zero, 20(x22)
sw zero, 24(x22)
sw zero, 28(x22)
sw zero, 32(x22)
sw zero, 36(x22)
sw zero, 40(x22)
sw zero, 44(x22)
sw zero, 48(x22) 
sw zero, 52(x22)
sw zero, 56(x22)
sw zero, 60(x22)
sw zero, 64(x22)
sw zero, 68(x22)
sw zero, 72(x22)
sw zero, 76(x22)
sw zero, 80(x22)
sw zero, 84(x22)
sw zero, 88(x22)
sw zero, 92(x22)
sw zero, 96(x22)
sw zero, 100(x22)
sw zero, 104(x22)
sw zero, 108(x22)
sw zero, 112(x22)
sw zero, 116(x22)
sw zero, 120(x22)
sw zero, 124(x22)
bne x22,x21,resart

addi x22,x31,-128

chushi:   #跳转过慢，对于流水线。采用指令空间换效率的模式
addi x22,x22,128
addi x23,x23,128
sw x20, 0(x22)
sw x20, 4(x22)
sw x20, 8(x22)
sw x20, 12(x22)
sw x20, 16(x22)
sw x20, 20(x22)
sw x20, 24(x22)
sw x20, 28(x22)
sw x20, 32(x22)
sw x20, 36(x22)
sw x20, 40(x22)
sw x20, 44(x22)
sw x20, 48(x22) 
sw x20, 52(x22)
sw x20, 56(x22)
sw x20, 60(x22)
sw x20, 64(x22)
sw x20, 68(x22)
sw x20, 72(x22)
sw x20, 76(x22)
sw x20, 80(x22)
sw x20, 84(x22)
sw x20, 88(x22)
sw x20, 92(x22)
sw x20, 96(x22)
sw x20, 100(x22)
sw x20, 104(x22)
sw x20, 108(x22)
sw x20, 112(x22)
sw x20, 116(x22)
sw x20, 120(x22)
sw x20, 124(x22)

sw a0, 0(x23)
sw a0, 4(x23)
sw a0, 8(x23)
sw a0, 12(x23)
sw a0, 16(x23)
sw a0, 20(x23)
sw a0, 24(x23)
sw a0, 28(x23)
sw a0, 32(x23)
sw a0, 36(x23)
sw a0, 40(x23)
sw a0, 44(x23)
sw a0, 48(x23) 
sw a0, 52(x23)
sw a0, 56(x23)
sw a0, 60(x23)
sw a0, 64(x23)
sw a0, 68(x23)
sw a0, 72(x23)
sw a0, 76(x23)
sw a0, 80(x23)
sw a0, 84(x23)
sw a0, 88(x23)
sw a0, 92(x23)
sw a0, 96(x23)
sw a0, 100(x23)
sw a0, 104(x23)
sw a0, 108(x23)
sw a0, 112(x23)
sw a0, 116(x23)
sw a0, 120(x23)
sw a0, 124(x23)

bne x22,x21,chushi
chushi_snack:
#数组#标记每个区块类型，空、蛇、食物
addi x22,x30,0
addi x23,zero,2
sw x23, 0(x22)
addi x22,x22,4
sw x23, 0(x22)
addi x22,x22,4
sw x23,0(x22)

#队列#标记蛇头蛇尾
addi x22,x31,0
sw zero, 0(x22)
sw x22,0(x29)
addi x22,x22,4
sw zero, 0(x22)
addi x29,x29,4##(使用循环队列,防止队列占用内存过大）
addi x29,x29,-1028
andi x29,x29,2047
addi x29,x29,1028
sw x22,0(x29)
addi x22,x22,4
sw zero, 0(x22)
addi x29,x29,4
addi x29,x29,-1028
andi x29,x29,2047
addi x29,x29,1028
sw x22,0(x29)
addi x18,x22,0
addi x19,zero,0
addi x25,zero,0
lui x31,0x40000##读取绝对PC
lw  x26,40(x31)
lui x31,0x30000

game:
add x26,x26,x26   #依靠PC种子伪随机1
addi x6,zero,12345
xor x26,x6,x26
add x26,x6,x26
and x26,x26,x27
beq x25,zero,make
after_make:
lui x31,0x40000##获取输入
lw  x6,20(x31)
lw  x7,24(x31)
lw  x8,28(x31)
lw  x9,32(x31)
lw  zero,36(x31)
lui x31,0x30000
beq x6,a0 ,W
beq x7,a0,S
beq x8,a0,A
beq x9,a0,D
addi x23,zero,1##记忆输入
beq x19,x23,D
addi x23,zero,2
beq x19,x23,A
addi x23,zero,3
beq x19,x23,W
addi x23,zero,4
beq x19,x23,S
beq x19,zero,behind

D:
addi x18,x18,4
addi x19,zero,1
beq zero,zero,behind
A:
addi x18,x18,-4
addi x19,zero,2
beq zero,zero,behind
W:
addi x18,x18,-128
addi x19,zero,3
beq zero,zero,behind
S:
addi x18,x18,128
addi x19,zero,4
beq zero,zero,behind

behind:
beq zero,x19,L4
sub x23,x18,x31##判断是否撞到自身
add x23,x23,x30
lw x23,0(x23)
addi x24,zero,2
beq x23,x24,end
addi x24,zero,3
beq x23,x24,get
L1:
jal x2,check
jal x2,normal
L4:
sleep:
lui x31,0x40000
sw x12,0(x31)
lui x31,0x30000
addi x13,zero,0
addi x16,zero,24##停顿时间
addi x13,x13,1
bne x13,x16,-4

jal zero,game

normal:##一般情况，头进1，尾进1
out:
beq x19,zero,in
jal x3,pop_out
addi x17,x4,0
sw x20,0(x17)
sub x17,x17,x31
add x17,x17,x30
sw a0,0(x17)
in:
sw zero,0(x18)
addi x5,x18,0
sub x5,x5,x31
add x5,x5,x30
addi x17,zero,2
sw x17,0(x5)
addi x5,x18,0
jal x3,pop_in

jalr zero,0(x2)


pop_in:##入队(使用循环队列,防止队列占用内存过大）
addi x29,x29,4
addi x29,x29,-1028
andi x29,x29,2047
addi x29,x29,1028
sw x5,0(x29)
jalr zero,0(x3)

pop_out:##出队(使用循环队列,防止队列占用内存过大）
lw x4,0(x28)
addi x28,x28,4
addi x28,x28,-1028
andi x28,x28,2047
addi x28,x28,1028
jalr zero,0(x3)

end:
lui x31,0x40000
sw zero,0(x31)
addi x13,zero,0
addi x16,zero,135##停顿时间
addi x13,x13,1
bne x13,x16,-4
sw x12,0(x31)
addi x13,zero,0
addi x16,zero,135##停顿时间
addi x13,x13,1
bne x13,x16,-4
addi a0,zero,0
end1:
beq a0,zero,end

check:##判断是否越界(结束条件1)
bltu x18,x31,end
lui x21,0x1
add x21,x21,x31
sub x21,x21,a0
bltu x21,x18,end

srli x21,x18,2
andi x21,x21,0x1f

bne x21,zero,L2.1
addi x23,zero,1
beq  x19,x23,end
L2.1:
addi x23,zero,31
bne x21,x23,L2.2
addi x23,zero,2
beq x19,x23,end
L2.2:
jalr zero,0(x2)

make:
addi x25,zero,5###每次生成食物数
addi x15,x26,0
and x15,x15,x27
L3.1:
add x15,x15,x30
lw x11,0(x15)
bne x11,a0,L3.2
addi x17,zero,3
sw x17,0(x15)
sub x15,x15,x30
add x15,x15,x31
sw x14,0(x15)
addi,x25,x25,-1
beq x11,a0,L3.3
L3.2:
sub x15,x15,x30
lui x31,0x40000
lw  x15,40(x31)#依靠PC种子伪随机2
lui x31,0x30000
addi x6,zero,2333
xor x15,x6,x15
srl x15,x15,x25
add x15,x15,x26
add x15,x15,x26
and x15,x15,x27
bne x11,a0,L3.1
L3.3:
sub x15,x15,x31
lui x31,0x40000
lw  x15,40(x31)#依靠PC种子伪随机2
lui x31,0x30000
addi x6,zero,1145
xor x15,x6,x15
srl x15,x15,x25
add x15,x15,x25
add x15,x15,x25
add x15,x15,x25
add x15,x15,x26
and x15,x15,x27
bne x25,zero,L3.1
addi x25,zero,5###每次生成食物数
beq zero,zero,after_make

get:##得分，头前进，尾部不变等效增长
addi x12,x12,1
addi x25,x25,-1
sw zero,0(x18)
addi x5,x18,0
sub x5,x5,x31
add x5,x5,x30
addi x17,zero,2
sw x17,0(x5)
addi x5,x18,0
jal x3,pop_in
beq zero,zero,sleep