.386 
.MODEL FLAT, STDCALL
OPTION CASEMAP:NONE
;INCLUDE C:\masm32\include\windows.inc
.NOLIST
.NOCREF
.LIST


.DATA
DataString DB 'AGIKSZJ', 0FFH ; definicja ciagu znakow
LocalString DB 0C3H, 'GJIKSZJ', 0FFH ; definicja ciagu znakow 

.CODE
;DllEntry PROC hInstDLL:HINSTANCE, reason:DWORD, reserved1:DWORD
;mov eax,TRUE 
;ret
;DllEntry ENDP

;**************************************************************************** 
;* Procedura FindChar_1 wyszukiwania znaku 'J' w ciagu 'DataString' * 
;* * 
;* Bezposrednia adresacja indeksowa * 
;* Parametry wejsciowe: * 
;* AH - szukany znak 'J' * 
;* Parametry wyjsciowe: * 
;* EAX - BOOL TRUE Found, FALSE not found * 
;* * 
;**************************************************************************** 
FindChar_1 PROC 
    MOV ESI, OFFSET DataString	; zaladuj offset zmiennej 'DataString' do rej. ESI 
    MOV AH, 'J'					; zaladuj kod litery 'J' do rej. AH 
Check_End: 
    CMP BYTE PTR [ESI], 0FFH	; czy koniec lancucha (znak specjalny FF)? 
    JE Not_Find					; znaleziono znak konca (wartownik) 
    CMP AH, [ESI]			    ; porownaj znak z elementem lancucha 'DataString' 
    JE Got_Equal				; znaleziono znak! 
    ADD ESI, 1					; inkrementuj offset
    JMP Check_End				; petla wyszukiwania 
Got_Equal: 
    MOV DL, [ESI]				; zaladuj znaleziony znak do DL 
    JMP Done 
Not_Find: 
    MOV EAX,0					; nie znaleziono znaku 
    RET							; powrot z procedury 
Done: 
    MOV EAX,1					; znaleziono znak 
    RET							; powrot z procedury 
FindChar_1 ENDP					; koniec FindChar_1 


;**************************************************************************** 
;* Procedura FindChar_2 wyszukiwania znaku 'J' w ciagu 'LocalString' * 
;* * 
;* Bezposrednia adresacja indeksowa * 
;* Parametry wejsciowe: * 
;*	AH - szukany znak 'J' * 
;* Parametry wyjsciowe: * 
;*	EAX - BOOL TRUE Found, FALSE not found * 
;* * 
;**************************************************************************** 
FindChar_2 PROC 
    MOV ESI, OFFSET LocalString ; zaladuj offset zmiennej 'LocalString' do rej. ESI 
    MOV AH, 'J'					; zaladuj kod litery 'J' do rej. AH 
Check_End: 
    CMP BYTE PTR [ESI], 0FFH	; czy koniec lancucha (znak specjalny FF)? 
    JE Not_Find				; znaleziono znak konca (wartownik) 
    CMP AH, [ESI]			; porownaj znak z elementem lancucha 'LocalString' 
    JE Got_Equal				; znaleziono znak! 
    ADD ESI, 1					; inkrementuj offset 
    JMP Check_End				; petla wyszukiwania 
Got_Equal: 
    MOV DL, [ESI]				; zaladuj znaleziony znak do DL 
    JMP Done 
Not_Find: 
    MOV EAX,0					; nie znaleziono znaku 
    RET							; powrot z procedury 
Done: 
    MOV EAX,1					; znaleziono znak 
    RET							; powrot z procedury 
FindChar_2 ENDP					; koniec FindChar_2


end
