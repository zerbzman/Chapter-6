; Fill Array with random integers            (fillArray.asm)

INCLUDE Irvine32.inc

.data
intArray DWORD 20 DUP(?)

.code
main PROC
  mov  ebx, OFFSET intArray
  mov  edx, 20
  mov  esi, 5
  mov  esp, 25
  call FillArrayWithRandomInt



  Invoke ExitProcess,0
main ENDP

FillArrayWithRandomInt PROC USES ecx edi
  call	Randomize		; init random generator
  ;ebx = ptr to array
  ;edx = N
  ;esi = j
  ;esp = k
  mov  ecx, edx
  mov  edi, TYPE [ebx]

ForN:
  mov  eax, esp
  sub  eax, esi               ; interval = k - j
  call RandomRange            ; eax = Random(interval)
  add  eax, esi               ; result = eax + j
  mov  DWORD PTR [ebx], eax   ; push result onto array
  add  ebx, edi               ; goto next array element
  loop ForN

ret
FillArrayWithRandomInt ENDP

END main
