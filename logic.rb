Topic 6

logical operations
&& - and
|| - or
!  - not

a || b || c && false
!(a || b || c) == a && b && c
!(a && b && c) == a || b || c

bitwise logical operations
& - and - check masks
| - or  - set mask
^ - xor

XOR
>> hash = 0b1101010
=> 106
>> value = 0b01011101
=> 93
>> value ^ hash
=> 55
>> encrypted = value ^ hash
=> 55
>> decrypted = encrypted ^ hash
=> 93
>> value ^ hash ^ hash
=> 93
>>

bullet  1
space_ship 2 -
mask & space_ship

enemy  01
environment 10
mask & enemy

binary, octal,

ascii chr ord parsing >> 1 (* 2)

opertimization - timing
