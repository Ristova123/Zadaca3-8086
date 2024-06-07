OVDE_DATA SEGMENT
PASSWORD DB ‘FAILSAFE’
INPUT_PW DB 8 DUP(?)
OVDE_DATA ENDS
OVDE_KODE SEGMENT
ASSUME CS: OVDE_KODE,
DS:OVDE_DATA,
ES:OVDE_DATA ;иницијализација на сегм.
MOV AX,OVDE_DATA
MOV DS,AX
MOV ES,AX
LDS SI, PASSWORD ;SI покажува на password
LEA DI, INPUT_PW ;DI покажува на input_pw
MOV CX, 08H ;бројач на 8 знаци
CLD ;DF=0инкремент на SI,DI
REPE CMPSB ;while (CX<>0 and ZF=1)
JNE SOUNDALARM ;ако е поради ZF
JMP O_K ;ако не се е OK
SOUND_ALARM:MOV AL,01h ;код за аларм
 MOV DX,0FFFAh ;се праќа на адреса FFFAh
 OUT DX,AL
 HLT
 O_K: HLT
OVDE_CODE ENDS
END 
