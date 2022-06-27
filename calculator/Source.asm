INCLUDE Irvine32.inc

.data
intro_1			BYTE	"    Calculadora Elementar by Luis Hermann e Lucas Barszcz", 0 ; Título do programa
intro_choice	BYTE	"--- Escolha uma das operacoes---", 0
intro_2         BYTE    "Digite os numeros a serem calculados", 0
option_sum		BYTE	"(1 -> Adicao)", 0
option_dif		BYTE	"(2 -> Subtracao)", 0
option_mul		BYTE	"(3 -> Multiplicacao)", 0
option_div		BYTE	"(4 -> Divisao)", 0			
prompt_1		BYTE	"Primeiro numero: ", 0		; 
prompt_2		BYTE	"Segundo numero: ", 0	; 
opcao			DWORD	?						; Variavel da opcao escolhida
userNum_1		DWORD	?						; Primeiro número a ser inserido pelo usuário
userNum_2		DWORD	?						; Segundo número a ser inserido pelo usuário
result			DWORD	?						; Sum of the two numbers to be calculated
remainder		DWORD	?						; Resto da divisão dos dois números
addSign			BYTE	" + ", 0				; Para aparecer o sinal de +
minusSign		BYTE	" - ", 0				; Para aparecer o sinal de -
multiplySign	BYTE	" x ", 0				; Para aparecer o sinal de x
divideSign		BYTE	" / ", 0				; Para aparecer o sinal de /
equalSign		BYTE	" = ", 0				; Para aparecer o sinal de =
remainderText	BYTE	" remainder ", 0		; 
goodBye			BYTE	"Impressionado? Tchau!", 0	; Mensagem de saída

.code
main PROC

; cabeçario do programa
	mov		edx, OFFSET intro_1 ; offset é para armazenar string no registrador
	call	WriteString
	call	CrLf


; Display intro_choice
	mov		edx, OFFSET intro_choice
	call	WriteString
	call	CrLf
	mov		edx, OFFSET option_sum
	call	WriteString
	call	CrLf
	mov		edx, OFFSET option_dif
	call	WriteString
	call	CrLf
	mov		edx, OFFSET option_mul
	call	WriteString
	call	CrLf
	mov		edx, OFFSET option_div
	call	WriteString
	call	CrLf

; Usuario digita opcao de 1 a 4
loopTop:
	
	call	ReadDec
	mov		opcao, eax

; Usuario digita os 2 numeros
	mov		edx, OFFSET intro_2
	call	WriteString
	call	CrLf

	mov		edx, OFFSET prompt_1
	call	WriteString
	call	ReadDec
	mov		userNum_1, eax

	mov		edx, OFFSET prompt_2
	call	WriteString
	call	ReadDec
	mov		userNum_2, eax

; if else para escolha de operacao
	mov		eax, opcao
	cmp		eax, 1
	je		opcao_soma
	cmp		eax, 2
	je		opcao_sub
	cmp		eax, 3
	je		opcao_mult
	cmp		eax, 4
	je		opcao_div

opcao_soma:
	mov		eax, userNum_1
	add		eax, userNum_2
	mov		result, eax
	mov		eax, userNum_1
    call    WriteDec
    mov		edx, OFFSET addSign
    call    WriteString
    mov		eax, userNum_2
    call    WriteDec
    mov		edx, OFFSET	equalSign
    call    WriteString
    mov		eax, result
    call    WriteDec
    call    CrLf
	jmp		theEnd

opcao_sub:
	mov		eax, userNum_1
	sub		eax, userNum_2
	mov		result, eax
	mov		eax, userNum_1
	call	WriteDec
	mov		edx, OFFSET minusSign
	call	WriteString
	mov		eax, userNum_2
	call	WriteDec
	mov		edx, OFFSET	equalSign
	call	WriteString
	mov		eax, result
	call	WriteDec
	call	CrLf
	jmp		theEnd

opcao_mult:
	mov		eax, userNum_1
	mul		userNum_2
	mov		result, eax
	mov		eax, userNum_1
	call	WriteDec
	mov		edx, OFFSET multiplySign
	call	WriteString
	mov		eax, userNum_2
	call	WriteDec
	mov		edx, OFFSET	equalSign
	call	WriteString
	mov		eax, result
	call	WriteDec
	call	CrLf
	jmp		theEnd

opcao_div:
	mov		eax, userNum_1
	cdq
	div		userNum_2
	mov		result, eax
	mov		remainder, edx
	mov		eax, userNum_1
	call	WriteDec
	mov		edx, OFFSET divideSign
	call	WriteString
	mov		eax, userNum_2
	call	WriteDec
	mov		edx, OFFSET	equalSign
	call	WriteString
	mov		eax, result
	call	WriteDec
	mov		edx, OFFSET remainderText
	call	WriteString
	mov		eax, remainder
	call	WriteDec
	call	CrLf
	jmp		theEnd

noRounding:
	mov		eax, ecx
	call	WriteDec
	call	CrLf

; Mensagem de despedida
theEnd:
	call	CrLf
	mov		edx, OFFSET goodBye
	call	WriteString
	call	CrLf

	exit	
main ENDP


END main