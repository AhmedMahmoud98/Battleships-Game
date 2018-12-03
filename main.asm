INCLUDE YOSRY.INC
INCLUDE AHMAD.INC
INCLUDE NADER.INC
.MODEL LARGE
.386

.STACK 64
.DATA

;---------------- ATTACK -----------------------------------
SELECT_ATTACK_COLUMN_MSG                DB  84,"- Navigate through columns and press space "
                                        DB  "to select the column of the attacked cell"
FIRE_SLIDER_MSG                         DB  62,"Press SPACE to stop the slider at the row of the attacked cell"

ATTACKX                                 DW ?        
ATTACKY                                 DW ?               

;---------------- STATUS BAR - NADER------------------------; Most of those variables are experimental
SCORE_CONSTANT_TEXT                     DB  10,"'s Score: "
STATUS_TEST                             DB  37,"- This is a test notification message"
P1_SCORE_STRING                         DB  2 DUP(?)
P2_SCORE_STRING                         DB  2 DUP(?)

;---------------- COORDINATES TRANSFER PARAMETERS ----------
GRID1_X            DW  ?
GRID2_X            DW  ?
GRID1_Y            DW  ?
GRID2_Y            DW  ?
PIXELS1_X          DW  ?
PIXELS2_X          DW  ?
PIXELS1_Y          DW  ?
PIXELS2_Y          DW  ?

;---------------- GAME SCREEN ------------------------------
GAME_SCREEN_MAX_X   EQU 799
GAME_SCREEN_MAX_Y   EQU 479
 
;---------------- GRID  ------------------------------------
GRID_SIZE_MAX            EQU 400
GRID_SQUARE_SIZE_MAX     EQU 44
GRID_SQUARE_SIZE         DW  ?
GRID_MAX_COORDINATE_MIN  EQU 16
GRID_MAX_COORDINATE      DW  ?
GRID_CORNER1_X           EQU 20
GRID_CORNER1_Y           EQU 19
GRID_CORNER2_X           EQU 460
GRID_CORNER2_Y           EQU 459

;---------------- COLUMN SELECTOR --------------------------
COLUMN_SELECTOR_ROW                 EQU GRID_CORNER2_Y+2
COLUMN_SELECTOR_CURRENT_COLUMN      DW  ?
COLUMN_SELECTOR_MIN_COLUMN          DW  ?
COLUMN_SELECTOR_MAX_COLUMN          DW  ?

;---------------- COLORS ----------------------------------------
BLACK               DB  00H
WHITE               DB  0FH
BLUE                DB  01H
LIGHT_BLUE          DB  09H
LIGHT_GRAY          DB  07H
DARK_GRAY           DB  08H

;---------------- DRAW RECTANGLE PARAMETERS ----------------------
X1                  DW  ?
X2                  DW  ?
Y1                  DW  ?
Y2                  DW  ?

;---------------- SLIDER DATA ------------------------------------
SLIDER_BAR_COLUMN   EQU 470
SLIDER_COLUMN       EQU 480
SLIDER_INITIAL_ROW  EQU 473
SLIDER_CURRENT_ROW  DW  SLIDER_INITIAL_ROW
SLIDER_DIRECTION    DB  0   ; 0 UP, 1 DOWN
SLIDER_MAX_UP       EQU  5
SLIDER_MAX_DOWN     EQU 473

;---------------- KEY SCAN CODES -------------------------------
SPACE_SCANCODE      EQU 39H
UP_SCANCODE         EQU 48H
DOWN_SCANCODE       EQU 50H
RIGHT_SCANCODE      EQU 4DH
LEFT_SCANCODE       EQU 4BH

;---------------- MESSAGES DATA FOR THE USER -------------------
PLEASE_ENTER_YOUR_NAME_MSG  DB    19H,'- PLEASE ENTER YOUR NAME:'
PLAYER1_MSG                 DB    7H ,'PLAYER1' 
PLAYER2_MSG                 DB    7H ,'PLAYER2'         
PRESS_ENTER_MSG             DB    1BH,'PRESS ENTER KEY TO CONTINUE' 
TO_START_GAME_MSG           DB    1CH,'- TO START THE GAME PRESS F2'
ENTER_LEVEL_MSG             DB    1EH,'- CHOOSE THE GAME LEVEL 1 OR 2'
TO_END_PROG_MSG             DB    1DH,'TO END THE PROGRAME PRESS ESC'
;---------------- COMMON DATA FOR BOTH PLAYERS -------------------
LEVEL               DB     2,?,?,?   ; 1 OR 2

;---------------- COMMON SHIPS DATA ------------------------------
ALL_SHIPS           DW     2    ; CONTAINS THE OFFSETS OF P1_SHIPS AND P2_SHIPS

;---- NUMBER OF SHIPS AND CELLS ----------------------------------
N_SHIPS          EQU 10   ; PLAYER 1 NUMBER OF SHIPS
TOTAL_N_CELLS    EQU 32

;---- SHIPS SELECTION CELLS --------------------------------------
SHIPS_SEL_CELLS     DB  1, 1, 1, 1, 1, 1, 1, 1, 1, 1              ;TO BE REPLACES WITH ACTUAL CELLS COORDINATES
                    DB  1, 1, 1, 1, 1, 1, 1, 1, 1, 1 

;---------------- PLAYER 1 DATA ----------------------------------
P1_USERNAME         DB  20, ?, 20 DUP ('?')
P1_SCORE            DB  TOTAL_N_CELLS ; NUMBER OF REMAINING CELLS, INITIALLY TOTAL CELLS OF ALL SHIPS

;-------- P1 ATTACKS ---------------------------------------------
;GRID CELLS THAT P1 ATTACKED (CELL1X, CELL1Y, CELL2X, CELL2Y, ..)
P1_ATTACKS_ONTARGET DB  (GRID_SIZE_MAX * 2) DUP(?)
P1_ATTACH_MISSED    DB  (GRID_SIZE_MAX * 2) DUP(?)            

;-------- P1 SHIPS DATA ------------------------------------------
P1_SHIPS LABEL BYTE
P1_SHIPS_POINTS             DW  N_SHIPS * 4 DUP(?)       ; FOR EACH SHIP STORE POINT1_X, POINT1_Y
                                                         ; POINT2_X, POINT2_Y
P1_SHIPS_SIZES              DW  5, 4, 4, 4, 3, 3, 3, 2, 2, 2
P1_SHIPS_REMAINING_CELLS    DB  N_SHIPS DUP(?)            ; NUMBER OF REMAINING CELLS FOR EACH SHIP
P1_SHIPS_IS_VERTICAL        DB  N_SHIPS DUP(1)            ; IS THE SHIP VERTICAL? (0: HORIZONTAL, 1:VERTICAL)
P1_SHIPS_IS_DRAWN           DW  N_SHIPS DUP(0)            ; IS THE SHIP DRAWN ON THE GRID YET? (0: NO, 1: YES)   


;---------------- PLAYER 2 DATA ----------------------------------
P2_USERNAME         DB  20, ?, 20 DUP ('?')
P2_SCORE            DB  TOTAL_N_CELLS ; NUMBER OF REMAINING CELLS, INITIALLY TOTAL CELLS OF ALL SHIPS

;-------- P2 ATTACKS ---------------------------------------------
;GRID CELLS THAT P2 ATTACKED (CELL1X, CELL1Y, CELL2X, CELL2Y, ..)
P2_ATTACKS_ONTARGET DB  (GRID_SIZE_MAX * 2) DUP(?)
P2_ATTACH_MISSED    DB  (GRID_SIZE_MAX * 2) DUP(?)  

;-------- P2 SHIPS DATA ------------------------------------------
P2_SHIPS LABEL BYTE
P2_SHIPS_POINTS             DW  N_SHIPS * 4 DUP(?)       ; FOR EACH SHIP STORE POINT1_X, POINT1_Y
                                                         ; POINT2_X, POINT2_Y
P2_SHIPS_SIZES              DW  5, 4, 4, 4, 3, 3, 3, 2, 2, 2
P2_SHIPS_REMAINING_CELLS    DB  N_SHIPS DUP(?)            ; NUMBER OF REMAINING CELLS FOR EACH SHIP
P2_SHIPS_IS_VERTICAL        DB  N_SHIPS DUP(1)            ; IS THE SHIP VERTICAL? (0: HORIZONTAL, 1:VERTICAL)
P2_SHIPS_IS_DRAWN           DW  N_SHIPS DUP(0)            ; IS THE SHIP DRAWN ON THE GRID YET? (0: NO, 1: YES)                    




.CODE
MAIN PROC FAR
MOV AX, @DATA
MOV DS, AX
MOV ES, AX

INITIALIZE_PROGRAM
;USER_NAMES
;MAIN_MENU
GET_LEVEL
CLEAR_GAME_SCREEN   WHITE
DRAW_GRID

DRAW_STATUS_BAR_TEMPLATE P1_USERNAME, P2_USERNAME, SCORE_CONSTANT_TEXT
PRINT_PLAYER1_SCORE
PRINT_PLAYER2_SCORE

DRAW_SLIDER_BAR
;FIRE_SLIDER
DRAW_SELECTION_SHIPS 1

GET_ATTACK_COORDINATES



HLT
RET
MAIN    ENDP

;-------------------------------------;
;---------- PROCEDURES ---------------;
;-------------------------------------;

GET_ATTACK_COORDINATES_ PROC    NEAR
    GET_ATTACK_COLUMN
    PRINT_NOTIFICATION_MESSAGE  FIRE_SLIDER_MSG, 1
    FIRE_SLIDER
    MOV CX, COLUMN_SELECTOR_CURRENT_COLUMN
    MOV BX, SLIDER_CURRENT_ROW
    ; CONVERT PIXELS TO GRID COORDINATES
    SUB CX, GRID_CORNER1_X
    MOV DX, 0
    MOV AX, CX
    DIV GRID_SQUARE_SIZE
    MOV ATTACKX, AX
    SUB BX, GRID_CORNER1_Y
    MOV DX, 0
    MOV AX, BX
    DIV GRID_SQUARE_SIZE 
    MOV ATTACKY, AX
    ;TEST
    DRAW_SHIP    ATTACKX, ATTACKY, ATTACKX, ATTACKY
    RET
GET_ATTACK_COORDINATES_ ENDP    
;-------------------------------------;
GET_ATTACK_COLUMN_  PROC    NEAR
    ; DRAW INITIAL COLUMN SELECTOR
    DRAW_COLUMN_SELECTOR    COLUMN_SELECTOR_MIN_COLUMN, LIGHT_BLUE
    MOV AX, COLUMN_SELECTOR_MIN_COLUMN
    MOV COLUMN_SELECTOR_CURRENT_COLUMN, AX

    ; DISPLAY MESSAGE
    PRINT_NOTIFICATION_MESSAGE  SELECT_ATTACK_COLUMN_MSG, 1

    GET_KEY_PRESSED:
        MOV AH, 0
        INT 16H
        CMP AH, SPACE_SCANCODE
        JZ SPACE_PRESSED
        CMP AH, RIGHT_SCANCODE
        JZ RIGHT_PRESSED
        CMP AH, LEFT_SCANCODE
        JZ LEFT_PRESSED
        JMP GET_KEY_PRESSED

        RIGHT_PRESSED:
            DRAW_COLUMN_SELECTOR COLUMN_SELECTOR_CURRENT_COLUMN, WHITE
            MOV AX, COLUMN_SELECTOR_MAX_COLUMN
            CMP COLUMN_SELECTOR_CURRENT_COLUMN, AX
            JZ REACHED_MAX_COLUMN
            MOV AX, GRID_SQUARE_SIZE
            ADD COLUMN_SELECTOR_CURRENT_COLUMN, AX
            JMP DRAW_CS
            REACHED_MAX_COLUMN:
            MOV AX, COLUMN_SELECTOR_MIN_COLUMN
            MOV COLUMN_SELECTOR_CURRENT_COLUMN, AX
            DRAW_CS:
            DRAW_COLUMN_SELECTOR COLUMN_SELECTOR_CURRENT_COLUMN, LIGHT_BLUE
        JMP GET_KEY_PRESSED
        LEFT_PRESSED:
            DRAW_COLUMN_SELECTOR COLUMN_SELECTOR_CURRENT_COLUMN, WHITE
            MOV AX, COLUMN_SELECTOR_MIN_COLUMN
            CMP COLUMN_SELECTOR_CURRENT_COLUMN, AX
            JZ REACHED_MIN_COLUMN
            MOV AX, GRID_SQUARE_SIZE
            SUB COLUMN_SELECTOR_CURRENT_COLUMN, AX
            JMP DRAW_CS_
            REACHED_MIN_COLUMN:
            MOV AX, COLUMN_SELECTOR_MAX_COLUMN
            MOV COLUMN_SELECTOR_CURRENT_COLUMN, AX
            DRAW_CS_:
            DRAW_COLUMN_SELECTOR COLUMN_SELECTOR_CURRENT_COLUMN, LIGHT_BLUE
        JMP GET_KEY_PRESSED
        SPACE_PRESSED:
        RET
GET_ATTACK_COLUMN_  ENDP        
;-------------------------------------;

SET_LEVEL_SETTINGS_  PROC   NEAR
    ; PARAMETERS AL: 1 OR 2 (LEVEL)
    ; GRID SQUARE SIZE
    MOV BL, AL
    MOV AX, GRID_SQUARE_SIZE_MAX
    DIV BL
    MOV AH, 0
    MOV GRID_SQUARE_SIZE, AX
    ; GRID MAX COORDINATE
    MOV AX, GRID_MAX_COORDINATE_MIN
    MUL BL
    MOV GRID_MAX_COORDINATE, AX
    ; COLUMN SELECTOR MIN AND MAX
    MOV AX, GRID_SQUARE_SIZE
    MOV BL, 2
    DIV BL
    MOV CL, AL
    MOV CH, 0
    ADD CX, GRID_CORNER1_X
    MOV COLUMN_SELECTOR_MIN_COLUMN, CX
    MOV AH, 0
    MOV CX, GRID_CORNER2_X
    SUB CX, AX
    MOV COLUMN_SELECTOR_MAX_COLUMN, CX
    RET
SET_LEVEL_SETTINGS_ ENDP
DRAW_SELECTION_SHIPS_   PROC    NEAR
    ; PARAMETERS AL: 1 OR 2 (PLAYER)
    MOV CX, 0
    CMP AL, 1
    JNZ PLAYER2_SELECTION_SHIPS
    MOV DI, OFFSET P1_SHIPS_SIZES
    MOV SI, OFFSET P1_SHIPS_IS_DRAWN
    JMP DRAW_ALL_SELECTION_SHIPS
    PLAYER2_SELECTION_SHIPS:
    MOV DI, OFFSET P2_SHIPS_SIZES
    MOV SI, OFFSET P2_SHIPS_IS_DRAWN
    DRAW_ALL_SELECTION_SHIPS:
        CMP WORD PTR [SI], 1
        JZ DRAW_NEXT_SELECTION_SHIP
        MOV AX, GRID_MAX_COORDINATE
        SUB AX, [DI]
        MOV GRID1_X, AX
        MOV BX, GRID_MAX_COORDINATE
        MOV GRID2_X, BX
        MOV GRID1_Y, CX
        MOV GRID2_Y, CX
        DRAW_SHIP GRID1_X, GRID1_Y, GRID2_X, GRID2_Y
        DRAW_NEXT_SELECTION_SHIP:
        ADD DI, 2
        ADD SI, 2
        INC CX
        CMP CX, N_SHIPS
    JNZ DRAW_ALL_SELECTION_SHIPS
    RET
DRAW_SELECTION_SHIPS_   ENDP
;-------------------------------------;
INITIALIZE_SHIPS_ARRAY_     PROC    NEAR
    MOV BX, OFFSET ALL_SHIPS
    MOV WORD PTR [BX], OFFSET P1_SHIPS
    ADD BX, 2
    MOV WORD PTR [BX], OFFSET P2_SHIPS
    RET
INITIALIZE_SHIPS_ARRAY_    ENDP
    
;-------------------------------------;
DRAW_SHIP_      PROC    NEAR
    ; PARAMETERS
    ; AX = POINT1_X, BX = POINT1_Y, CX = POINT2_X, DX = POINT2_Y
    GRID_TO_PIXELS AX, BX, CX, DX
    ; MOVE THE SECOND POINT FROM THE UPPER LEFT CORNER TO THE LOWER RIGHT CORNER
    MOV AX, PIXELS2_X
    ADD AX, GRID_SQUARE_SIZE
    MOV PIXELS2_X, AX
    MOV AX, PIXELS2_Y
    ADD AX, GRID_SQUARE_SIZE
    MOV PIXELS2_Y, AX
    ; ADJUST SHIP SIZE (SMALLER THAN GRID)
    ; SET MARGIN
    MOV AX, 10
    DIV LEVEL   ; MARGIN = 6 / LEVEL 
    ADD PIXELS1_X, AX
    ADD PIXELS1_Y, AX
    SUB PIXELS2_X, AX
    SUB PIXELS2_Y, AX
    ; DRAW THE SHIP
    DRAW_RECTANGLE PIXELS1_X, PIXELS1_Y, PIXELS2_X, PIXELS2_Y, LIGHT_GRAY
    ; DRAW SHIP BORDERS
    DEC PIXELS1_X
    DEC PIXELS1_Y
    INC PIXELS2_X
    INC PIXELS2_Y
    
    DRAW_RECTANGLE PIXELS1_X, PIXELS1_Y, PIXELS2_X, PIXELS1_Y, DARK_GRAY
    DRAW_RECTANGLE PIXELS1_X, PIXELS2_Y, PIXELS2_X, PIXELS2_Y, DARK_GRAY 
    DRAW_RECTANGLE PIXELS1_X, PIXELS1_Y, PIXELS1_X, PIXELS2_Y, DARK_GRAY 
    DRAW_RECTANGLE PIXELS2_X, PIXELS1_Y, PIXELS2_X, PIXELS2_Y, DARK_GRAY     
    
    RET
DRAW_SHIP_  ENDP
;-------------------------------------;
GRID_TO_PIXELS_     PROC    NEAR
    ; PARAMETERS
    ; GRID1_X, GRID1_Y, GRID2_X, GRID2_Y
    ; GRID TO PIXELS (UPPER LEFT CORNER)
    
    ; OUTPUT
    ; PIXEL1_X, PIXEL1_Y, PIXEL2_X, PIXEL2_Y
    
    ; PIXEL X = GRID_CORNER1_X + GRID_SQUARE_SIZE * GRID_X
    ; PIXEL Y = GRID_CORNER1_Y + GRID_SQUARE_SIZE * GRID_Y
    
    MOV AX, GRID_SQUARE_SIZE
    MUL GRID1_X
    ADD AX, GRID_CORNER1_X
    MOV PIXELS1_X, AX 

    MOV AX, GRID_SQUARE_SIZE
    MUL GRID1_Y
    ADD AX, GRID_CORNER1_Y
    MOV PIXELS1_Y, AX 

    MOV AX, GRID_SQUARE_SIZE
    MUL GRID2_X
    ADD AX, GRID_CORNER1_X
    MOV PIXELS2_X, AX 

    MOV AX, GRID_SQUARE_SIZE
    MUL GRID2_Y
    ADD AX, GRID_CORNER1_Y
    MOV PIXELS2_Y, AX
    
    RET
GRID_TO_PIXELS_     ENDP
;-------------------------------------;   
DRAW_RECTANGLE_   PROC  NEAR    
    ;PARAMETERS
    ; X1, Y1, X2, Y2, AL = COLOR
    INC X2
    INC Y2  ;TO STOP AT X2 + 1, Y2 + 1
    MOV DX, Y1
    MOV AH, 0CH   ;AH = 0C FOR INT, AL = COLOR
    DRAW_ALL_RECTANGLE_ROWS:
    MOV CX, X1
        DRAW_RECTANGE_ROW:
            INT 10H
            INC CX
            CMP CX, X2
        JNZ DRAW_RECTANGE_ROW
    INC DX
    CMP DX, Y2
    JNZ DRAW_ALL_RECTANGLE_ROWS
    RET
DRAW_RECTANGLE_ ENDP   
;-------------------------------------;    
PRINT_MESSAGE_    PROC NEAR

      MOV AX,1301H
      MOV BX,BP
      MOV CL,[BX]
      MOV CH,00H
      ADD BP,1H
      MOV BX,SI
      INT 10H
      RET

PRINT_MESSAGE_    ENDP
;-------------------------------------;
GET_USER_NAME_     PROC NEAR
     PRINT_MESSAGE PLEASE_ENTER_YOUR_NAME_MSG , 1025H , 0FF0FH
     PRINT_MESSAGE PRESS_ENTER_MSG , 1423H , 0FF0FH
     
     CMP SI,1H
     JNZ PLAYER2
     PRINT_MESSAGE PLAYER1_MSG ,0C2CH , 0FF28H
     JMP CONT
PLAYER2:
     PRINT_MESSAGE PLAYER2_MSG ,0C2CH , 0FF28H
     
CONT:        
     MOV AH,02H             ;MOVE THE CURSOR
     MOV DX,122AH
     INT 10H
        
     MOV AH,0AH            ;GET THE USER INPUT AND STORE IT IN USERNAME1 OR USERNAME2(SENT PARAMETER)
     MOV DX,DI
     INT 21H
     RET 
     
 GET_USER_NAME_     ENDP
;-------------------------------------;
USER_NAMES_     PROC NEAR

     GET_USER_NAME 1H,P1_USERNAME
     CLEAR_GAME_SCREEN  BLACK 
     GET_USER_NAME 2H,P2_USERNAME
     CLEAR_GAME_SCREEN  BLACK
     
     RET 
USER_NAMES_     ENDP
;-------------------------------------;
MAIN_MENU_     PROC NEAR

        PRINT_MESSAGE TO_START_GAME_MSG , 1025H , 0FF0FH
        PRINT_MESSAGE TO_END_PROG_MSG , 1425H , 0FF0FH

  NOTVALID:          
        MOV AH,0
        INT 16H
        CMP AH,3CH
        JZ CONT2
  NOTF2:                 
        CMP AH,01H
        JZ EXIT
        JNZ NOTVALID            ;JZ WHERE ???
  CONT2:       
  CLEAR_GAME_SCREEN BLACK 
     RET 
  EXIT:
        HLT
     
MAIN_MENU_     ENDP
;-------------------------------------;
INITIALIZE_PROGRAM_     PROC NEAR

        MOV AX,4F02H           ;GO TO VIDEOMODE 800*600
        MOV BX,103H
        INT 10H

     RET 
INITIALIZE_PROGRAM_     ENDP
;-------------------------------------;
GET_LEVEL_     PROC NEAR

 PRINT_MESSAGE ENTER_LEVEL_MSG , 1025H , 0FF0FH
  
  NOTVALID2:

        MOV AH,02H                 ;MOVE THE CURSER
        MOV DX,1232H
        INT 10H
        
        MOV AH,0AH                 ;GET USER INPUT AND STORE IT IN LEVEL  
        MOV DX,OFFSET LEVEL
        INT 21H     
        
        MOV BX,DX                  ;CHECK THAT THE USER INPUT 1 OR 2 
        MOV CL,[BX+2]
        CMP CL,31H
        JZ  SET_LEVEL1
        CMP CL,32H
        JNZ NOTVALID2
        JMP SET_LEVEL2
  SET_LEVEL1:
        SET_LEVEL_SETTINGS 1
        JMP BACK
  SET_LEVEL2:
        SET_LEVEL_SETTINGS 2
  BACK:
        CLEAR_GAME_SCREEN WHITE
        RET
GET_LEVEL_     ENDP
;-------------------------------------;
DRAW_GRID_  PROC    NEAR
    ; DI AND SI ARE VALUES TO STOP LOOPING AT  
    MOV DI, GRID_CORNER2_X
    ADD DI, GRID_SQUARE_SIZE
    MOV SI, GRID_CORNER2_Y
    ADD SI, GRID_SQUARE_SIZE
    ; DRAW GRID COLUMNS
    MOV CX, GRID_CORNER1_X
    MOV DX, GRID_CORNER1_Y      ;INITIAL POINT: (20,19)
    MOV AX, 0C00H   ;AH = 0C FOR INT, AL = O0 (BLACK)
    DRAW_ALL_COLUMNS:
        MOV DX, GRID_CORNER1_Y  ;START DRAWING EVERY COLUMN FROM THE INITIAL ROW
        DRAW_COLUMN:
            INT 10H
            INC DX
            CMP DX, GRID_CORNER2_Y + 1
        JNZ DRAW_COLUMN
        ADD CX, GRID_SQUARE_SIZE  ;DISTANCE BETWEEN COLUMNS
        CMP CX, DI ;LAST LINE AT CX = GRID_CORNER2_X SO STOP AT CX = GRID_CORNER2_X + GRID_SQUARE_SIZE = DI
    JNZ DRAW_ALL_COLUMNS
    ; DRAW GRID ROWS
    MOV CX, GRID_CORNER1_X
    MOV DX, GRID_CORNER1_Y      ;INITIAL POINT: (20,19)
    MOV AX, 0C00H   ;AH = 0C FOR INT, AL = O0 (BLACK)
    DRAW_ALL_ROWS:
        MOV CX, GRID_CORNER1_X  ;START DRAWING EVERY ROW FROM THE INITIAL COLUMN
        DRAW_ROW:
            INT 10H
            INC CX
            CMP CX, GRID_CORNER2_X + 1
        JNZ DRAW_ROW
        ADD DX, GRID_SQUARE_SIZE  ;DISTANCE BETWEEN ROWS
        CMP DX, SI ;LAST LINE AT DX = GRID_CORNER2_Y SO STOP AT DX = GRID_CORNER2_Y + GRID_SQUARE_SIZE = SI
    JNZ DRAW_ALL_ROWS
    RET
DRAW_GRID_  ENDP
;-----------------------------------------;

DRAW_SLIDER_     PROC   NEAR   
    ; PARAMETERS
    ; DI = SLIDER_ROW
    ; AL = COLOR
    ;DRAW SLIDER
    MOV CX, SLIDER_COLUMN
    MOV DX, DI
    DEC DX
    MOV AH, 0CH ; AL = COLOR
    MOV BX, 1
    DRAW_ALL_SLIDER_COLUMNS:
        MOV DI, BX
        DRAW_SLIDER_COLUMN:
            INT 10H
            INC DX
            DEC DI
        JNZ DRAW_SLIDER_COLUMN
        MOV DI, BX
        INC DI
        SUB DX, DI
        INC CX
        ADD BX, 2
        CMP BX, 15  ; TO INCREASE SLIDER SIZE ADD 2 (MUST BE ALWAYS ODD)
    JNZ DRAW_ALL_SLIDER_COLUMNS
    RET
DRAW_SLIDER_    ENDP 
;-----------------------------------------;

DRAW_COLUMN_SELECTOR_     PROC   NEAR   
    ; PARAMETERS
    ; DI = COLUMN_SELECTOR_COLUMN, 
    ; AL = COLOR
    ;DRAW SLIDER
    MOV CX, DI
    MOV DX, COLUMN_SELECTOR_ROW 
    DEC DX
    MOV AH, 0CH ; AL = COLOR
    MOV BX, 1
    DRAW_ALL_COLUMN_SELECTOR_ROWS:
        MOV DI, BX
        DRAW_COLUMN_SELECTOR_ROW:
            INT 10H
            INC CX
            DEC DI
        JNZ DRAW_COLUMN_SELECTOR_ROW
        MOV DI, BX
        INC DI
        SUB CX, DI
        INC DX
        ADD BX, 2
        CMP BX, 15  ; TO INCREASE THE SIZE ADD 2 (MUST BE ALWAYS ODD)
    JNZ DRAW_ALL_COLUMN_SELECTOR_ROWS
    RET
DRAW_COLUMN_SELECTOR_    ENDP 
;-----------------------------------------;

DRAW_SLIDER_BAR_    PROC    NEAR   
    MOV CX, SLIDER_BAR_COLUMN
    MOV DX, SLIDER_MAX_UP      ;INITIAL POINT
    MOV AX, 0C00H   ;AH = 0C FOR INT, AL = O0 (BLACK)
    DRAW_ALL_BARS:
        MOV DX, SLIDER_MAX_UP  ;START DRAWING EVERY COLUMN FROM THE INITIAL ROW
        DRAW_BAR:
            INT 10H
            INC DX
            CMP DX, SLIDER_MAX_DOWN
        JNZ DRAW_BAR
        ADD CX, 1  ;DISTANCE BETWEEN COLUMNS
        CMP CX, SLIDER_BAR_COLUMN + 6 ; SO THAT SLIDER BAR WIDTH = 5
    JNZ DRAW_ALL_BARS
    DRAW_SLIDER SLIDER_INITIAL_ROW, LIGHT_BLUE
    RET
DRAW_SLIDER_BAR_    ENDP
;-----------------------------------------;
FIRE_SLIDER_    PROC    NEAR   
    CHECK_USER_CLICK:
    ; CHECK IF USER PRESSED A KEY
    MOV AH, 1
    INT 16H
    JZ MOVE_SLIDER
    ; GET KEY PRESSED
    MOV AH, 0
    INT 16H
    CMP AH, SPACE_SCANCODE
    JZ STOP_SLIDER
    ; MOVE THE SLIDER
    MOVE_SLIDER:
    ; CLEAR THE SLIDER CURRENT POSITION
    DRAW_SLIDER SLIDER_CURRENT_ROW, WHITE
    ; CHECK WHETHER TO MOVE IT UP OR DOWN
    CMP SLIDER_DIRECTION, 0
    JZ  DECREMENT_ROW
    ; MOVE SLIDER DOWN
    INC SLIDER_CURRENT_ROW
    ; CHECK IF ROW IS AT ITS LOWEST, CHANGE THE DIRECTION TO UP (0)
    CMP SLIDER_CURRENT_ROW, SLIDER_MAX_DOWN
    JNZ DRAW_NEW_SLIDER
    MOV SLIDER_DIRECTION, 0
    JMP DRAW_NEW_SLIDER
    ; MOVE SLIDER UP
    DECREMENT_ROW:
    DEC SLIDER_CURRENT_ROW
    ; CHECK IF ROW IS AT ITS HIGHEST, CHANGE THE DIRECTION TO DOWN (1)
    CMP SLIDER_CURRENT_ROW, SLIDER_MAX_UP
    JNZ DRAW_NEW_SLIDER
    MOV SLIDER_DIRECTION, 1
    ; DRAW THE SLIDER NEW POSITION
    DRAW_NEW_SLIDER:
    DRAW_SLIDER SLIDER_CURRENT_ROW, LIGHT_BLUE
    ; DELAY 
    MOV AH,86H
    MOV CX,0 ;CX:DX = INTERVAL IN MICROSECONDS
    MOV DX,03E8H
    INT 15H
    JMP CHECK_USER_CLICK
    STOP_SLIDER:
    RET
FIRE_SLIDER_    ENDP
;-----------------------------------------;
DRAW_STATUS_BAR_TEMPLATE_   PROC    NEAR
;NOTIFICATION BAR                        
    MOV AX, 0C0FH
    MOV CX,0
    MOV DX,545  
    LOOP1:
    INT 10H
    INC CX
    CMP CX,800
    JNZ LOOP1
;CHAT BAR                   
    MOV CX,0    ;STARTING FROM THE LEFT EDGE
    MOV DX,496  ;HEIGHT VALUE
    LOOP2:
    INT 10H
    INC CX
    CMP CX,800  ;ENDING AT THE RIGHT EDGE
    JNZ LOOP2

    PRINT_MESSAGE P1_USERNAME+1,2000H,0FH
    PRINT_MESSAGE P2_USERNAME+1,2100H,0FH
;SCORE BAR                       
    ;PLAYER 1 SCORE
    PRINT_MESSAGE P1_USERNAME+1,1E00H,0FH
    
    MOV DH,1EH ;Y
    MOV DL,P1_USERNAME+1  ;X
    PRINT_MESSAGE SCORE_CONSTANT_TEXT,DX,0FH    

    ;PLAYER 2 SCORE
    PRINT_MESSAGE P2_USERNAME+1,1E40H,0FH
    
    MOV DH,1EH ;Y
    MOV DL,P2_USERNAME+1  ;X
    ADD DL,40H
    PRINT_MESSAGE SCORE_CONSTANT_TEXT,DX,0FH    
 
    RET
DRAW_STATUS_BAR_TEMPLATE_   ENDP
;-----------------------------------------;
PRINT_NOTIFICATION_MESSAGE_   PROC    NEAR
;INDEX = 1 -> MESSAGE #1
;INDEX = 2 -> MESSAGE #2
;prints notification messages
    
    MOV CX,0
    MOV AX,1301H
    MOV BX,BP
    MOV CL,[BX]
    ADD BP,1
    MOV BX,000FH
    INT 10H  
 
    RET
PRINT_NOTIFICATION_MESSAGE_   ENDP
;-----------------------------------------;
PRINT_PLAYER1_SCORE_   PROC    NEAR
    
    ;DECIMAL_TO_STRING:
    MOV AX,0
    MOV AL,P1_SCORE
    MOV BL,10
    DIV BL
    MOV P1_SCORE_STRING, AL
    MOV P1_SCORE_STRING+1, AH
    ADD P1_SCORE_STRING,48
    ADD P1_SCORE_STRING+1,48

    MOV AX,1301H
    MOV DH,1EH ;Y
    MOV DL,P1_USERNAME+1 ;X
    ADD DL,10
    MOV BP,OFFSET P1_SCORE_STRING
    MOV CX,2         ;SIZE
    MOV BX,000FH
    INT 10H
 
    RET
PRINT_PLAYER1_SCORE_   ENDP
;-----------------------------------------;
PRINT_PLAYER2_SCORE_   PROC    NEAR
    
    ;DECIMAL_TO_STRING:
    MOV AX,0
    MOV AL,P2_SCORE
    MOV BL,10
    DIV BL
    MOV P2_SCORE_STRING, AL
    MOV P2_SCORE_STRING+1, AH
    ADD P2_SCORE_STRING,48
    ADD P2_SCORE_STRING+1,48

    MOV AX,1301H
    MOV DH,1EH ;Y
    MOV DL,P2_USERNAME+1 ;X
    ADD DL,4AH
    MOV BP,OFFSET P2_SCORE_STRING
    MOV CX,2         ;SIZE
    MOV BX,000FH
    INT 10H
 
    RET
PRINT_PLAYER2_SCORE_   ENDP
;-----------------------------------------;
CLEAR_GAME_SCREEN_  PROC    NEAR
    ; PARAMETERS
    ; AL = COLOR   
    DRAW_RECTANGLE  0, 0, GAME_SCREEN_MAX_X, GAME_SCREEN_MAX_Y, AL  
    RET
CLEAR_GAME_SCREEN_  ENDP

END     MAIN