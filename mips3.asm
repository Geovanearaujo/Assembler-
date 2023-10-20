# Exemplo 3 - imprimir elementos de um vetor a partir de uma posição específica

.data
vetor: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
prompt: .asciiz "Digite um número entre 1 e 10: "
.text
main:
    # Imprimir prompt e ler um número
    li $v0, 4
    la $a0, prompt
    syscall
    li $v0, 5
    syscall
    move $s1, $v0 # $s1 guarda o número digitado

    # Configurar o endereço do vetor
    la $s0, vetor

    # Percorrer o vetor a partir da posição especificada
    loop:
        lw $t0, ($s0)
        blt $t0, $s1, next
        li $v0, 1
        move $a0, $t0
        syscall
    next:
        addi $s0, $s0, 4
        addi $s1, $s1, 1
        bne $s1, 11, loop

    # Encerrar o programa
    li $v0, 10
    syscall
