.data
    mensagem1: .asciiz "Digite o primeiro número: "
    mensagem2: .asciiz "Digite o segundo número: "
    mensagem3: .asciiz "O menor número é: "
    
.text
    main:
        # Imprime mensagem para digitar o primeiro número e lê o valor digitado
        li $v0, 4
        la $a0, mensagem1
        syscall
        li $v0, 5
        syscall
        move $t0, $v0
        
        # Imprime mensagem para digitar o segundo número e lê o valor digitado
        li $v0, 4
        la $a0, mensagem2
        syscall
        li $v0, 5
        syscall
        move $t1, $v0
        
        # Compara os dois números e armazena o menor em $t2
        slt $t2, $t0, $t1
        beqz $t2, else
        move $t2, $t0
        j end
        
    else:
        move $t2, $t1
        
    end:
        # Imprime mensagem com o menor número
        li $v0, 4
        la $a0, mensagem3
        syscall
        li $v0, 1
        move $a0, $t2
        syscall
        
        # Finaliza o programa
        li $v0, 10
        syscall
