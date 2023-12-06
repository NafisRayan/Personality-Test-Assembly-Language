.MODEL SMALL
.STACK 100H
.DATA
    WELCOME_MESSAGE_ONE DB "********************************************************************************",13,10,"+++++++++++++++++++                                          +++++++++++++++++++",13,10,"+++++++++++++++++++      Welcome to the Personality Test!    +++++++++++++++++++",13,10,"+++++++++++++++++++                                          +++++++++++++++++++",13,10,"********************************************************************************","$"
    WELCOME_MESSAGE_TWO DB "    ++++++++++     Answer each question on a scale from 1 to 5     ++++++++++     ",13,10,"================================================================================",13,10,"      | Strongly Disagree | Disagree | Neutral | Agree |  Strongly Agree  |      ",13,10,"--------------------------------------------------------------------------------",13,10,"      |         1         |    2     |    3    |   4   |          5       |       ",13,10,"================================================================================",13,10,"$"
    GOODBYE_MESSAGE DB "==============================================================================", 13, 10,"==========                Good Bye. Have a nice day!                ==========",13,10,"==============================================================================", "$"
    prompt2 DB "=>   Do you enjoy socializing with a large group of people?",13,10,"===> Certainly, count me in the scale of ",'$'
    prompt3 DB "=>   Do you prefer spending time alone or with a small group of close friends?",13,10,"===> Certainly, count me in the scale of ", '$'
    prompt4 DB "=>   Are you comfortable being the center of attention?",13,10,"===> Certainly, count me in the scale of ", '$'
    prompt5 DB "=>   Are you a good listener and enjoy meaningful one-on-one conversations?",13,10,"===> Certainly, count me in the scale of ", '$'
    prompt6 DB "=>   I often take the lead in group activities or discussions?",13,10,"===> Certainly, count me in the scale of ", '$'
    prompt7 DB "=>   Do you find it easy to start conversations with strangers?",13,10,"===> Certainly, count me in the scale of ", '$'
    prompt8 DB "=>   Are you open to trying new and adventurous activities?",13,10,"===> Certainly, count me in the scale of ", '$'
    prompt9 DB "=>   Do you value routine and stability in your daily life?",13,10,"===> Certainly, count me in the scale of ", '$'
    prompt10 DB "=>   Do you find yourself frequently reflecting on your thoughts and feelings?",13,10,"===> Certainly, count me in the scale of ", '$'
    prompt11 DB "=>   Do you find enjoyment in being spontaneous and going with the flow?",13,10,"===> Certainly, count me in the scale of ", '$'
    introvert_msg DB "##############################################################################",13,10,"########                                                              ########",13,10,"######     Based on your responses, you lean towards introversion.      ######",13,10,"########                                                              ########",13,10,"##############################################################################",13,10, '$'
    extrovert_msg DB "##############################################################################",13,10,"########                                                              ########",13,10,"######     Based on your responses, you lean towards extroversion.      ######",13,10,"########                                                              ########",13,10,"##############################################################################",13,10, '$'
    balanced_msg DB "##############################################################################",13,10,"########                                                              ########",13,10,"######     Based on your responses, you have a balanced personality.    ######",13,10,"########                                                              ########",13,10,"##############################################################################",13,10, '$'
    ERROR_MESSAGE DB "Invalid input. Please enter a number between 1 and 5.$"
    scores DB ?

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
    CMP scores, 26
    JL  PRINT_INTROVERT_MSG
    CMP scores, 33
    JG  PRINT_EXTROVERT_MSG
    ; If neither condition is met, print balanced message
    MOV AH, 09H
    LEA DX, balanced_msg
    INT 21H
    JMP PRINT_GOODBYE_MSG
    JMP EXIT_PROGRAM

PRINT_INTROVERT_MSG:
    MOV AH, 09H
    LEA DX, introvert_msg
    INT 21H
    JMP PRINT_GOODBYE_MSG

PRINT_EXTROVERT_MSG:
    MOV AH, 09H
    LEA DX, extrovert_msg
    INT 21H
    JMP PRINT_GOODBYE_MSG

PRINT_GOODBYE_MSG:
    ; Print the goodbye message
    MOV AH, 09H
    LEA DX, GOODBYE_MESSAGE
    INT 21H

EXIT_PROGRAM:

    ; Terminate the program
    MOV AX, 4C00H
    INT 21H
        
START_TEST PROC
    ; Prompt for the first question
    MOV AH, 9
    LEA DX, prompt2
    INT 21H
    CALL GET_USER_INPUT
    ADD scores, AL ; add the score
    
    ; Print a new line
    MOV AH, 02H
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H

    ; Prompt for the second question
    MOV AH, 9
    LEA DX, prompt3
    INT 21H
    CALL GET_USER_INPUT
    ADD scores, AL ; add the score
    
    ; Print a new line
    MOV AH, 02H
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    ; Prompt for the third question
    MOV AH, 9
    LEA DX, prompt4
    INT 21H
    CALL GET_USER_INPUT
    ADD scores, AL ; add the score
    
    ; Print a new line
    MOV AH, 02H
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    ; Prompt for the 4th question
    MOV AH, 9
    LEA DX, prompt5
    INT 21H
    CALL GET_USER_INPUT
    ADD scores, AL ; add the score
    
    ; Print a new line
    MOV AH, 02H
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
       
    ; Prompt for the 5th question
    MOV AH, 9
    LEA DX, prompt6
    INT 21H
    CALL GET_USER_INPUT
    ADD scores, AL ; add the score
    
    ; Print a new line
    MOV AH, 02H
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H       
    
    ; Prompt for the 6th question
    MOV AH, 9
    LEA DX, prompt7
    INT 21H
    CALL GET_USER_INPUT
    ADD scores, AL ; add the score
    
    ; Print a new line
    MOV AH, 02H
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    ; Prompt for the 7th question
    MOV AH, 9
    LEA DX, prompt8
    INT 21H
    CALL GET_USER_INPUT
    ADD scores, AL ; add the score
    
    ; Print a new line
    MOV AH, 02H
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    ; Prompt for the 8th question
    MOV AH, 9
    LEA DX, prompt9
    INT 21H
    CALL GET_USER_INPUT
    ADD scores, AL ; add the score
    
    ; Print a new line
    MOV AH, 02H
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    ; Prompt for the 9th question
    MOV AH, 9
    LEA DX, prompt10
    INT 21H
    CALL GET_USER_INPUT
    ADD scores, AL ; add the score
    
    ; Print a new line
    MOV AH, 02H
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    ; Prompt for the 10th question
    MOV AH, 9
    LEA DX, prompt11
    INT 21H
    CALL GET_USER_INPUT
    ADD scores, AL ; add the score
    
    ; Print a new line
    MOV AH, 02H
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
           
    RET
START_TEST ENDP

GET_USER_INPUT PROC
    MOV AX, 0 ; Clear AX register to store the user input
INPUT_LOOP:
    MOV AH, 01H ; Read a character from standard input
    INT 21H
    SUB AL, 30H ; Convert ASCII to number
    CMP AL, 1   ; Check if the input is less than 0
    JL INPUT_ERROR
    CMP AL, 5   ; Check if the input is greater than 5
    JG INPUT_ERROR
    RET

INPUT_ERROR:
    ; Print a new line
    MOV AH, 02H
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    MOV AH, 09H
    LEA DX, ERROR_MESSAGE
    INT 21H
    JMP INPUT_LOOP

GET_USER_INPUT ENDP

END MAIN
