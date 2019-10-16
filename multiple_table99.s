.data
mul: .string "*"
spa: .string " "
row: .string "\n"
equ: .string "="

.text
main:

	addi s0, zero, 1      # i = 1

loop1:                #for i loop
	slti t0, s0, 10       #if(i<10)
	beq  t0, zero, exit   #if(i>=10) go exit
	addi s1, zero, 1      #else set j=1


loop2:                   #for j loop
	slti t0, s1, 10       #if(j<10)
	beq  t0, zero, label  #if(j>=10) go label

	mv t0, s0 # i
	mv t1, s1 # j

	mul t2, t0, t1 # i*j

	mv a1, t0           #else printf i
	li a0, 1
	ecall

	la   a1, mul       #printf *
	li   a0, 4
	ecall

	mv a1, t1           #printf j
	li a0, 1      
	ecall

	la   a1, equ       #printf =
	li   a0, 4
	ecall

	mv  a1, t2         #printf i*j
	li  a0, 1      
	ecall

	la   a1, spa       #printf " "
	li   a0, 4
	ecall

	addi s1, s1, 1     #j++
	j    loop2

label:
	la   a1, row       #printf \n
	li   a0, 4
	ecall

	addi s0, s0, 1     #i++
	j    loop1


exit:                   #exit
	li a0, 10
    	ecall
