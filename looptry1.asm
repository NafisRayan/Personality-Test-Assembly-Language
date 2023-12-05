.MODEL SMALL
.STACK 100H
.DATA
    WELCOME_MESSAGE_ONE DB "one$"
    WELCOME_MESSAGE_TWO DB "two$"
    prompt2 DB "q1$"
    prompt3 DB "q2$"
    prompt4 DB "q3$"
    introvert_msg DB "intro$"
    extrovert_msg DB "extro$"
    balanced_msg DB "Baal$"
    ERROR_MESSAGE DB "Invalid input. Please enter a number between 0 and 5.$"

    scores DB 0 ; Initialize scores to 0

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Print the first part of the welcome message
    MOV AH, 09H
    LEA DX, WELCOME_MESSAGE_ONE
    INT 21H
    ; Print the second part of the welcome message
    MOV AH, 09H
    LEA DX, WELCOME_MESSAGE_TWO
    INT 21H

    CALL START_TEST

    ; Convert scores to ASCII and display
    MOV AH, 0  ; Set AH to 0 for the conversion
    MOV AL, scores ; Move the value in scores to AL
    ADD AL, 30H ; Convert to ASCII
    MOV DL, AL ; Move the ASCII value to DL

    ; Analyze the personality based on the total score
    CMP scores, 4
    JL  PRINT_INTROVERT_MSG
    CMP scores, 11
    JG  PRINT_EXTROVERT_MSG
    ; If neither condition is met, print balanced message
    MOV AH, 09H
    LEA DX, balanced_msg
    INT 21H
    JMP EXIT_PROGRAM

PRINT_INTROVERT_MSG:
    MOV AH, 09H
    LEA DX, introvert_msg
    INT 21H
    JMP EXIT_PROGRAM

PRINT_EXTROVERT_MSG:
    MOV AH, 09H
    LEA DX, extrovert_msg
    INT 21H

EXIT_PROGRAM:
    ; Terminate the program
    MOV AX, 4C00H
    INT 21H

START_TEST PROC
    ; Set scores to 0
    XOR AL, AL
    MOV scores, AL

    ; Loop through the questions
    MOV CX, 3 ; Number of questions
    MOV SI, 0 ; Initialize question index

QUESTION_LOOP:
    ; Prompt for the current question
    MOV AH, 9
    LEA DX, prompt2
    ADD DX, SI
    INT 21H

    ; Get user input for the current question
    CALL GET_USER_INPUT

    ; Add the score to total scores
    ADD scores, AL

    ; Move to the next question
    INC SI

    LOOP QUESTION_LOOP

    RET
START_TEST ENDP

GET_USER_INPUT PROC
    XOR AX, AX ; Clear AX register to store the user input

INPUT_LOOP:
    MOV AH, 01H ; Read a character from standard input
    INT 21H
    SUB AL, 30H ; Convert ASCII to number
    CMP AL, 0   ; Check if the input is less than 0
    JL INPUT_ERROR
    CMP AL, 5   ; Check if the input is greater than 5
    JG INPUT_ERROR
    RET

INPUT_ERROR:
    MOV AH, 09H
    LEA DX, ERROR_MESSAGE
    INT 21H
    JMP INPUT_LOOP

GET_USER_INPUT ENDP

END MAIN
