.386 
.MODEL FLAT, STDCALL
OPTION CASEMAP:NONE
INCLUDE C:\masm32\include\windows.inc
.CODE

DllEntry PROC hInstDLL:HINSTANCE, reason:DWORD, reserved1:DWORD
mov eax,TRUE 
ret
DllEntry ENDP

MyProc1 proc x: DWORD, y: DWORD
xor eax,eax 
mov eax,x 
mov ecx,y 
ror ecx,1 
shld eax,ecx,2 
jnc ET1 
mul y 
ret 
ET1:
Mul x 
Neg y 
ret
MyProc1 endp

MyProc2 proc

; wykrycie PL = 0->1 
; wynikiem poni¿szej operacji arytmetycznej jest liczba ujemna
; (st¹d ustawiana jest wartoœæ PL = 1) 
mov eax, 0
add eax, -20

; wykrycie PE = 0->1 
; wynik poni¿szej operacji - liczba 3 - posiada w reprezentacji binarnej
; parzyst¹ liczbê "jedynek" w najm³odszym bajcie (w wyniku czego PE = 1)
mov eax, 2
add eax, 1

; wykrycie ZR = 0->1 
; wynikiem poni¿szej operacji jest liczba 0 (st¹d ZR = 1)
sub eax, eax

; wykrycie CY = 0->1 i AC = 0->1
; argumenty poni¿szej operacji wybrano tak, aby:
; - wyst¹pi³o przeniesienie z trzeciej pozycji licz¹c od najm³odszego bitu (wówczas AC = 1)
; - wyst¹pi³o przeniesienie z pozycji najbardziej znacz¹cej (wówczas CY = 1)
mov ax, 0100000000000001b
add ax, 1011111111111111b

; wykrycie OV = 0->1
; argumenty poni¿szej dobrano tak,
; aby w wyniku dodawania liczb ze znakiem wyst¹pi³o przepe³nienie (wówczas OV = 1)
mov eax, -2147483648
add eax, -1

; wykrycie UP = 0->1 oraz UP = 1->0
; wykorzystano funkcje ustawiaj¹c¹ i resetuj¹c¹ flagê	
std
cld

ret
MyProc2 endp

end
