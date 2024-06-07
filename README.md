# Zadaca3-8086

Да се напише програмски сегмент за споредба на 2 стринга за проверка на лозинка која однапред е веќе
внесена. Споредбата се прави бајт по бајт и доколку стринговите се различни на адреса FFFAh се испраќа
звучен сигнал и се прекинува со работа на програмата. 


**Resenie:** 

```
;дефинирање податочен сегмент
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
CLD ;DF=0инкремент на SI,DI
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

```
 ![Screenshot (1)](https://github.com/Ristova123/Zadaca3-8086/blob/main/Zadaca3%208086%20code.png)
 
**Develop by:**

[Tamara Ristova ](https://github.com/Ristova123)


**Subject**

Microcomputer's systems

**Built With**

This project is built using the following tools:

- [8086 simulator](https://emu8086-microprocessor-emulator.en.softonic.com/?ex=RAMP-2046.0): Assembler and emulator for the Intel 8085 microprocessor.

**Getting Started**

To get a local copy up and running, follow these steps.

**Prerequisites**

In order to run this project you need:

A working computer
Connection to internet
Setup

**How to Run**

To run the program, you need an 8086 emulator or assembler. You can use emulators like DOSBox or TASM (Turbo Assembler). Here's how to run the program using 8086 simulator:

1. Download and install 8086 simulator from [here](https://emu8086-microprocessor-emulator.en.softonic.com/?ex=RAMP-2046.0).
2. Clone this repository to your local machine.
3. Open 8086 simulator and load the `Zadaca3 8086 code.asm` file.
4. Assemble the code by pressing the Assemble button.
5. Run the program by pressing the Run button or by pressing F10.
