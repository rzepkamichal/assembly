.386 
.MODEL FLAT, STDCALL
OPTION CASEMAP:NONE
.CODE

MyProc1 proc x: DWORD, y: DWORD
xor eax,eax 
mov eax,x 
mov ecx,y 
ror ecx,1 
shld eax,ecx,2 
jnc ET1 
mul y 
ret 
	ET1:	Mul x 
			Neg y 
			ret
MyProc1 endp
end
