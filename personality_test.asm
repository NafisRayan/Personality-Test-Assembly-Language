.MODEL SMALL
.STACK 100H
.DATA
    ; DEFINE YOUR VARIABLES
    WELCOME_MESSAGE_ONE DB "Welcome to the Personality Test!", 13, 10, "$"
    WELCOME_MESSAGE_TWO DB "Answer each question on a scale from 0 (Strongly Disagree) to 5 (Strongly Agree)", 13, 10, "$"
    GOODBYE_MESSAGE DB "Good Bye. Have a nice day!", 13, 10, "$"
    prompt2 DB "I enjoy socializing with a large group of people.", '$'
    prompt3 DB "I prefer spending time alone or with a small group of close friends.", '$'
    prompt4 DB "I am comfortable being the center of attention.", '$'
    prompt5 DB "I am a good listener and enjoy meaningful one-on-one conversations.", '$'
    prompt6 DB "I often take the lead in group activities or discussions.", '$'
    prompt7 DB "I find it easy to start conversations with strangers.", '$'
    prompt8 DB "I am open to trying new and adventurous activities.", '$'
    prompt9 DB "I value routine and stability in my daily life.", '$'
    prompt10 DB "I often reflect on my thoughts and feelings.", '$'
    prompt11 DB "I enjoy being spontaneous and going with the flow.", '$'
    total_msg DB 'Total value is $'
    introvert_msg DB "Based on your responses, you lean towards introversion.", '$'
    extrovert_msg DB "Based on your responses, you lean towards extroversion.", '$'
    balanced_msg DB "Based on your responses, you have a balanced personality.", '$'
    scores DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Print the first part of the welcome message
    MOV AH, 09H
    LEA DX, WELCOME_MESSAGE_ONE
    INT 21H

    ; Print a new line
    MOV AH, 02H
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H

    ; Print the second part of the welcome message
    MOV AH, 09H
    LEA DX, WELCOME_MESSAGE_TWO
    INT 21H

    ; Print a new line
    MOV AH, 02H
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    JE  START_TEST

    CMP AL, 'X'
   
START_TEST:
    ; YOUR CODE STARTS HERE
    ; Include your personality test logic here
    ; YOUR CODE ENDS HERE

    ; Prompt for the first question
    MOV AH, 9
    LEA DX, prompt2
    INT 21H

;new line try
        MOV dl, 10
        MOV ah, 02h
        INT 21h
        MOV dl, 13
        MOV ah, 02h
        INT 21h

    ; Input user's response
    MOV AH, 1
    INT 21H
    SUB AL, 30H ; convert ASCII to number
    ADD scores, AL ; add the score

;new line try
        MOV dl, 10
        MOV ah, 02h
        INT 21h
        MOV dl, 13
        MOV ah, 02h
        INT 21h

    ; Prompt for the second question
    MOV AH, 9
    LEA DX, prompt3
    INT 21H

;new line try
        MOV dl, 10
        MOV ah, 02h
        INT 21h
        MOV dl, 13
        MOV ah, 02h
        INT 21h

    ; Input user's response
    MOV AH, 1
    INT 21H
    SUB AL, 30H ; convert ASCII to number
    ADD scores, AL ; add the score

;new line try
        MOV dl, 10
        MOV ah, 02h
        INT 21h
        MOV dl, 13
        MOV ah, 02h
        INT 21h

    ; Prompt for the third question
    MOV AH, 9
    LEA DX, prompt4
    INT 21H

;new line try
        MOV dl, 10
        MOV ah, 02h
        INT 21h
        MOV dl, 13
        MOV ah, 02h
        INT 21h

    ; Input user's response
    MOV AH, 1
    INT 21H
    SUB AL, 30H ; convert ASCII to number
    ADD scores, AL ; add the score

;new line try
        MOV dl, 10
        MOV ah, 02h
        INT 21h
        MOV dl, 13
        MOV ah, 02h
        INT 21h

    ; Prompt for the fourth question
    MOV AH, 9
    LEA DX, prompt5
    INT 21H

;new line try
        MOV dl, 10
        MOV ah, 02h
        INT 21h
        MOV dl, 13
        MOV ah, 02h
        INT 21h

    ; Input user's response
    MOV AH, 1
    INT 21H
    SUB AL, 30H ; convert ASCII to number
    ADD scores, AL ; add the score

;new line try
        MOV dl, 10
        MOV ah, 02h
        INT 21h
        MOV dl, 13
        MOV ah, 02h
        INT 21h

    ; Prompt for the fifth question
    MOV AH, 9
    LEA DX, prompt6
    INT 21H

;new line try
        MOV dl, 10
        MOV ah, 02h
        INT 21h
        MOV dl, 13
        MOV ah, 02h
        INT 21h

    ; Input user's response
    MOV AH, 1
    INT 21H
    SUB AL, 30H ; convert ASCII to number
    ADD scores, AL ; add the score

;new line try
        MOV dl, 10
        MOV ah, 02h
        INT 21h
        MOV dl, 13
        MOV ah, 02h
        INT 21h

    ; Prompt for the sixth question
    MOV AH, 9
    LEA DX, prompt7
    INT 21H

;new line try
        MOV dl, 10
        MOV ah, 02h
        INT 21h
        MOV dl, 13
        MOV ah, 02h
        INT 21h

    ; Input user's response
    MOV AH, 1
    INT 21H
    SUB AL, 30H ; convert ASCII to number
    ADD scores, AL ; add the score

;new line try
        MOV dl, 10
        MOV ah, 02h
        INT 21h
        MOV dl, 13
        MOV ah, 02h
        INT 21h

    ; Prompt for the seventh question
    MOV AH, 9
    LEA DX, prompt8
    INT 21H

;new line try
        MOV dl, 10
        MOV ah, 02h
        INT 21h
        MOV dl, 13
        MOV ah, 02h
        INT 21h

    ; Input user's response
    MOV AH, 1
    INT 21H
    SUB AL, 30H ; convert ASCII to number
    ADD scores, AL ; add the score

;new line try
        MOV dl, 10
        MOV ah, 02h
        INT 21h
        MOV dl, 13
        MOV ah, 02h
        INT 21h

    ; Prompt for the eighth question
    MOV AH, 9
    LEA DX, prompt9
    INT 21H

;new line try
        MOV dl, 10
        MOV ah, 02h
        INT 21h
        MOV dl, 13
        MOV ah, 02h
        INT 21h

    ; Input user's response
    MOV AH, 1
    INT 21H
    SUB AL, 30H ; convert ASCII to number
    ADD scores, AL ; add the score

;new line try
        MOV dl, 10
        MOV ah, 02h
        INT 21h
        MOV dl, 13
        MOV ah, 02h
        INT 21h

    ; Prompt for the ninth question
    MOV AH, 9
    LEA DX, prompt10
    INT 21H

;new line try
        MOV dl, 10
        MOV ah, 02h
        INT 21h
        MOV dl, 13
        MOV ah, 02h
        INT 21h

    ; Input user's response
    MOV AH, 1
    INT 21H
    SUB AL, 30H ; convert ASCII to number
    ADD scores, AL ; add the score

;new line try
        MOV dl, 10
        MOV ah, 02h
        INT 21h
        MOV dl, 13
        MOV ah, 02h
        INT 21h

    ; Prompt for the tenth question
    MOV AH, 9
    LEA DX, prompt11
    INT 21H

;new line try
        MOV dl, 10
        MOV ah, 02h
        INT 21h
        MOV dl, 13
        MOV ah, 02h
        INT 21h

    ; Input user's response
    MOV AH, 1
    INT 21H
    SUB AL, 30H ; convert ASCII to number
    ADD scores, AL ; add the score

;new line try
        MOV dl, 10
        MOV ah, 02h
        INT 21h
        MOV dl, 13
        MOV ah, 02h
        INT 21h

    ; Display the total message
    MOV AH, 9
    LEA DX, total_msg
    INT 21H   

;new line try
        MOV dl, 10
        MOV ah, 02h
        INT 21h
        MOV dl, 13
        MOV ah, 02h
        INT 21h

    ; Convert scores to ASCII and display
    MOV AH, 0  ; Set AH to 0 for the conversion
    MOV AL, scores ; Move the value in scores to AL
    ADD AL, 30H ; Convert to ASCII
    MOV DL, AL ; Move the ASCII value to DL

;new line try
        MOV dl, 10
        MOV ah, 02h
        INT 21h
        MOV dl, 13
        MOV ah, 02h
        INT 21h

    ; Display the total score
    MOV AH, 2
    MOV DL, AL ; Move the value in scores to DL
    INT 21H

    ; New line characters
    MOV DL, 10
    MOV AH, 02h
    INT 21h
    MOV DL, 13
    MOV AH, 02h
    INT 21h

    ; Analyze the personality based on the total score
    CMP scores, 17
    JL  PRINT_INTROVERT_MSG

    CMP scores, 33
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
	;new line try
        MOV dl, 10
        MOV ah, 02h
        INT 21h
        MOV dl, 13
        MOV ah, 02h
        INT 21h
     ;new line try
        MOV dl, 10
        MOV ah, 02h
        INT 21h
        MOV dl, 13
        MOV ah, 02h
        INT 21h
    ; Print the goodbye message and end the code
    CMP AL, 'X'
    MOV AH, 09H
    LEA DX, GOODBYE_MESSAGE
    INT 21H

    ; Terminate the program
    MOV AX, 4C00H
    INT 21H

MAIN ENDP
END MAIN
