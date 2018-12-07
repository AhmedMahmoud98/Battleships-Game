INCLUDE YOSRY.INC
INCLUDE AHMAD.INC
INCLUDE NADER.INC
.MODEL LARGE
.386
.STACK 64
.DATA

;---------------- ATTACK -----------------------------------
SELECT_ATTACK_COLUMN_MSG                DB  84,"- Navigate through columns and press SPACE "
                                        DB  "to select the column of the attacked cell"
FIRE_SLIDER_MSG                         DB  64,"- Press SPACE to stop the slider at the row of the attacked cell"
CELL_ALREADY_ATTACKED_MSG               DB  81,"- You attacked the cell that you already attacked before! Press ENTER to continue"
GRID_MISSED_MSG                         DB  47,"- You missed the grid ! Press ENTER to continue"
ON_TARGET_MSG                           DB  61,"- Your attack hit a ship ! Good job ! Press ENTER to continue"
NOT_ON_TARGET_MSG                       DB  69,"- Your attack didn't hit a ship ! Hard Luck ! Press ENTER to continue"
ATTACKX                                 DW ?        
ATTACKY                                 DW ?               
IS_EVEN                                 DB ?
IS_ONTARGET                             DB ?
IS_ATTACKED_BEFORE                      DB ?
IS_ON_GRID                              DB ?
PLAYER_ATTACKING                        DB 1
PLAYER_ATTACKED                         DB 2
GAME_END                                DB 0

;---------------- STATUS BAR - ------------------------; 
SCORE_CONSTANT_TEXT                     DB  10,"'s score: "
EMPTY_STRING                            DB  100,100 DUP(' ')
;----------------------- NADER (EXPERIMENTAL) - ------------------------; 
START_PLACING_SHIPS_MSG                 DB  88,"- You are going to place your ships (on the right) on the grid now, press ENTER to start"
ALL_SHIPS_PLACED_MSG                    DB  53,"- You placed all your ships ! Press ENTER to continue"
STATUS_TEST1                            DB  70,"- Please select the starting cell of the highlighted ship on the right"
STATUS_TEST2                            DB  68,"- Please select the orientation of the highlighted ship on the right"
                         
;---------------- CELLS SELECTOR------------------------;
SELECTOR_INITIAL_X1                     EQU 20
SELECTOR_INITIAL_Y1                     EQU 19
SELECTOR_INITIAL_X2                     EQU 20
SELECTOR_INITIAL_Y2                     EQU 19
SELECTOR_X1                             DW  ?
SELECTOR_Y1                             DW  ?
SELECTOR_X2                             DW  ?
SELECTOR_Y2                             DW  ?
SELECTOR_GRID_INITIAL_X1                EQU 0
SELECTOR_GRID_INITIAL_Y1                EQU 0
SELECTOR_GRID_X1                        DW  ?
SELECTOR_GRID_Y1                        DW  ?
SELECTOR_GRID_X2                        DW  ?
SELECTOR_GRID_Y2                        DW  ?
JUMP_COUNTER                            DW  1
UP_ORIENTATION                          DB  ?   ;ORIENTATION = 0 : INVALID
DOWN_ORIENTATION                        DB  ?   ;            = 1 : VALID
LEFT_ORIENTATION                        DB  ?
RIGHT_ORIENTATION                       DB  ?
SELECTED_PLAYER_SHIPS                   DB  ?
NO_POSSIBLE_ORIENTATION                 DB  96,"- Sorry there is no possible orientation on this cell, press ENTER and choose another valid cell"
;---------------- COORDINATES TRANSFER PARAMETERS ----------
GRID1_X            DW  ?
GRID2_X            DW  ?
GRID1_Y            DW  ?
GRID2_Y            DW  ?
PIXELS1_X          DW  ?
PIXELS2_X          DW  ?
PIXELS1_Y          DW  ?
PIXELS2_Y          DW  ?

;---------------- GAME SCREEN ------------------------------ DONE
GAME_SCREEN_MAX_X   EQU 799
GAME_SCREEN_MAX_Y   EQU 479
 
;---------------- GRID  ------------------------------------
GRID_SIZE_MAX                   EQU 400
GRID_SQUARE_SIZE_MAX            EQU 44
GRID_SQUARE_SIZE                DW  ?
GRID_MAX_COORDINATE_MIN         EQU 16
GRID_MAX_COORDINATE             DW  ?
GRID_CORNER1_X                  EQU 20
GRID_CORNER1_Y                  EQU 19
GRID_CORNER2_X                  EQU 460
GRID_CORNER2_Y                  EQU 459
GRID_CELLS_MAX_COORDINATE_MIN   EQU 9 
GRID_CELLS_MAX_COORDINATE       DW  ?

;---------------- COLUMN SELECTOR -------------------------- DONE
COLUMN_SELECTOR_ROW                 EQU GRID_CORNER2_Y+2
COLUMN_SELECTOR_CURRENT_COLUMN      DW  ?
COLUMN_SELECTOR_MIN_COLUMN          DW  ?
COLUMN_SELECTOR_MAX_COLUMN          DW  ?

;---------------- COLORS ----------------------------------------
VARIABLE_COLOR      DB  ?
BLACK               DB  00H
BLUE                DB  01H
GREEN               DB  02H
CYAN                DB  03H
RED                 DB  04H
MAGENTA             DB  05H
BROWN               DB  06H
LIGHT_GRAY          DB  07H
DARK_GRAY           DB  08H
LIGHT_BLUE          DB  09H
LIGHT_GREEN         DB  0AH
LIGHT_CYAN          DB  0BH
LIGHT_RED           DB  0CH
LIGHT_MAGENTA       DB  0DH
YELLOW              DB  0EH
WHITE               DB  0FH
;---------------- DRAW RECTANGLE PARAMETERS ----------------------
X1                  DW  ?
X2                  DW  ?
Y1                  DW  ?
Y2                  DW  ?
;---------------- SLIDER DATA ------------------------------------ DONE
SLIDER_BAR_COLUMN   EQU 470
SLIDER_COLUMN       EQU 480
SLIDER_INITIAL_ROW  EQU 473
SLIDER_CURRENT_ROW  DW  SLIDER_INITIAL_ROW
SLIDER_DIRECTION    DB  0   ; 0 UP, 1 DOWN
SLIDER_MAX_UP       EQU  5
SLIDER_MAX_DOWN     EQU 473

;---------------- KEY SCAN CODES ------------------------------- DONE
SPACE_SCANCODE      EQU 39H
F2_SCANCODE         EQU 3CH
EXIT_SCANCODE       EQU 01H
ENTER_SCANCODE      EQU 1CH
UP_SCANCODE         EQU 48H
DOWN_SCANCODE       EQU 50H
RIGHT_SCANCODE      EQU 4DH
LEFT_SCANCODE       EQU 4BH

;---------------- MAIN MENU MESSAGES DATA FOR THE USER ------------  DONE
PLEASE_ENTER_YOUR_NAME_MSG  DB    19H,'- Please enter your name:'
PLAYER1_MSG                 DB    7H ,'player1' 
PLAYER2_MSG                 DB    7H ,'player2'         
PRESS_ENTER_MSG             DB    1BH,'Press ENTER key to continue' 
TO_START_GAME_MSG           DB    1CH,'- To start the game press F2'
ENTER_LEVEL_MSG             DB    1EH,'- Choose the game level 1 or 2'
TO_END_PROG_MSG             DB    1EH,'- To end the program press ESC'
;---------------- COMMON DATA FOR BOTH PLAYERS -------------------
LEVEL               DB     2,?,?,?   ; 1 OR 2

;---- NUMBER OF SHIPS AND CELLS ----------------------------------  DONE
N_SHIPS          EQU 10         ; PLAYER 1 NUMBER OF SHIPS
TOTAL_N_CELLS    EQU 32

;---------------- PLAYER 1 DATA ----------------------------------
P1_USERNAME         DB  20, ?, 20 DUP ('?')
P1_SCORE            DB  TOTAL_N_CELLS ; NUMBER OF REMAINING CELLS, INITIALLY TOTAL CELLS OF ALL SHIPS
P1_SCORE_STRING                         DB  2 DUP(?)

;-------- P1 ATTACKS ---------------------------------------------
;GRID CELLS THAT P1 ATTACKED (CELL1X, CELL1Y, CELL2X, CELL2Y, ..)
P1_ATTACKS_ONTARGET_NUM     DW  0
P1_ATTACKS_ONTARGET         DW  (GRID_SIZE_MAX * 2) DUP('*')
P1_ATTACKS_MISSED_NUM       DW  0
P1_ATTACKS_MISSED           DW  (GRID_SIZE_MAX * 2) DUP('*') 


;-------- P1 SHIPS DATA ------------------------------------------
P1_SHIPS LABEL BYTE
P1_SHIPS_POINTS             DW  N_SHIPS * 4 DUP(-2)       ; FOR EACH SHIP STORE POINT1_X, POINT1_Y
                                                         ; POINT2_X, POINT2_Y
P1_SHIPS_SIZES              DW  5, 4, 4, 4, 3, 3, 3, 2, 2, 2
P1_SHIPS_REMAINING_CELLS    DB  N_SHIPS DUP(?)            ; NUMBER OF REMAINING CELLS FOR EACH SHIP
P1_SHIPS_IS_VERTICAL        DW  N_SHIPS DUP(1)            ; IS THE SHIP VERTICAL? (0: HORIZONTAL, 1:VERTICAL)
       
;---------------- PLAYER 2 DATA ----------------------------------
P2_USERNAME         DB  20, ?, 20 DUP ('?')
P2_SCORE            DB  TOTAL_N_CELLS ; NUMBER OF REMAINING CELLS, INITIALLY TOTAL CELLS OF ALL SHIPS
P2_SCORE_STRING                         DB  2 DUP(?)

;-------- P2 ATTACKS ---------------------------------------------
;GRID CELLS THAT P2 ATTACKED (CELL1X, CELL1Y, CELL2X, CELL2Y, ..)

P2_ATTACKS_ONTARGET_NUM     DW  0
P2_ATTACKS_ONTARGET         DW  (GRID_SIZE_MAX * 2) DUP('*')
P2_ATTACKS_MISSED_NUM       DW  0
P2_ATTACKS_MISSED           DW  (GRID_SIZE_MAX * 2) DUP('*')  

;-------- P2 SHIPS DATA ------------------------------------------
P2_SHIPS LABEL BYTE
P2_SHIPS_POINTS             DW  N_SHIPS * 4 DUP(-2)       ; FOR EACH SHIP STORE POINT1_X, POINT1_Y
                                                         ; WE DON'T NEED POINT 2 AS WE HAVE SIZE & VERTICAL OR HORIZONTAL
                                                         ; BUT KEEP THEM NOT TO CALCUALTE THEM EACH TIME
P2_SHIPS_SIZES              DW  5, 4, 4, 4, 3, 3, 3, 2, 2, 2
P2_SHIPS_REMAINING_CELLS    DB  N_SHIPS DUP(?)            ; NUMBER OF REMAINING CELLS FOR EACH SHIP
P2_SHIPS_IS_VERTICAL        DW  N_SHIPS DUP(1)            ; IS THE SHIP VERTICAL? (0: HORIZONTAL, 1:VERTICAL)

.CODE
MAIN PROC FAR
MOV AX, @DATA
MOV DS, AX
MOV ES, AX

        INITIALIZE_PROGRAM
        USER_NAMES
        
STARTING_POINT:

        MAIN_MENU
        GET_LEVEL
        DRAW_STATUS_BAR_TEMPLATE 
        PRINT_PLAYER1_SCORE
        PRINT_PLAYER2_SCORE
        PLACE_SHIPS_ON_GRID 1
        PLACE_SHIPS_ON_GRID 2
        START_THE_GAME
            
THE_END:   
  
HLT
RET
MAIN    ENDP

;-------------------------------------;
;--------- YOUSRY PROCEDURES ---------;
;-------------------------------------;

IS_CELL_ON_GRID_   PROC    NEAR
    CMP ATTACKY, 0
    JL NOT_ON_GRID
    MOV AX, GRID_CELLS_MAX_COORDINATE
    CMP ATTACKY, AX
    JA NOT_ON_GRID
    MOV IS_ON_GRID, 1
    JMP DETERMINED
    
    NOT_ON_GRID:
    MOV IS_ON_GRID, 0
    DETERMINED:
    RET

IS_CELL_ON_GRID_   ENDP
;-------------------------------------;

PLACE_SHIPS_ON_GRID_     PROC    NEAR
    ; PARAMETERS
    ; AL = PLAYER NUMBER (1 OR 2)
    CLEAR_GAME_SCREEN WHITE
    DRAW_GRID
    DRAW_SELECTION_SHIPS AL
    MOV SELECTED_PLAYER_SHIPS,AL
    MOV CX, 0
    CMP AL, 1
    JNZ PLAYER2_PLACE_SHIPS
    ; PLAYER 1 PLACE SHIPS:
    MOV BX, OFFSET P1_SHIPS_POINTS
    MOV DI, OFFSET P1_SHIPS_SIZES
    MOV SI, OFFSET P1_SHIPS_IS_VERTICAL
    JMP DISPLAY_STARTING_MSG
    
    PLAYER2_PLACE_SHIPS:
    MOV BX, OFFSET P2_SHIPS_POINTS
    MOV DI, OFFSET P2_SHIPS_SIZES
    MOV SI, OFFSET P2_SHIPS_IS_VERTICAL 
    
    DISPLAY_STARTING_MSG:
    PUSH AX
    PRINT_NOTIFICATION_MESSAGE  START_PLACING_SHIPS_MSG, 1
    WAIT_FOR_ENTER_TO_START_PLACING_SHIPS:
        MOV AH, 0
        INT 16H
        CMP AH, ENTER_SCANCODE
        JNZ WAIT_FOR_ENTER_TO_START_PLACING_SHIPS
    POP AX

    MOV AH, 0
    PUSH AX ; TO STORE THE PLAYER NUMBER
    PLACE_SHIP:   
        ; HIGHLIGHT THE SHIP TO BE PLACED
        DRAW_SELECTION_SHIP CX, [DI], RED
        
        CELLS_SELECTOR [DI]
        MOV AX, SELECTOR_GRID_X1
        CMP AX, SELECTOR_GRID_X2
        JZ SET_VERTICAL_SHIP
        ; IF HORIZONTAL:
        MOV WORD PTR [SI], 0
        ORDER_CELL_SELECTOR_POINTS 0
        JMP STORE_SHIP_POINTS
        
        ;ELSE IF VERTICAL:
        SET_VERTICAL_SHIP:
        MOV WORD PTR [SI], 1
        ORDER_CELL_SELECTOR_POINTS 1    
        
        STORE_SHIP_POINTS:
        MOV AX, SELECTOR_GRID_X1
        MOV WORD PTR [BX], AX
        ADD BX, 2
        MOV AX, SELECTOR_GRID_Y1
        MOV WORD PTR [BX], AX
        ADD BX, 2
        MOV AX, SELECTOR_GRID_X2
        MOV WORD PTR [BX], AX
        ADD BX, 2
        MOV AX, SELECTOR_GRID_Y2
        MOV WORD PTR [BX], AX
        ADD BX, 2
        
        ; REMOVE THE HIGHLIGHTING
        DRAW_SELECTION_SHIP CX, [DI] , DARK_GRAY
        
        POP AX
        DRAW_ALL_SHIPS_ON_GRID AL
        PUSH AX
        
        ; NEXT SHIP
        ADD DI, 2
        ADD SI,2
        INC CX
        CMP CX, N_SHIPS
    JNZ PLACE_SHIP
    POP AX
    
    PRINT_NOTIFICATION_MESSAGE  ALL_SHIPS_PLACED_MSG, 1
    WAIT_FOR_ENTER_TO_FINISH_PLACING_SHIPS:
        MOV AH, 0
        INT 16H
        CMP AH, ENTER_SCANCODE
        JNZ WAIT_FOR_ENTER_TO_FINISH_PLACING_SHIPS
     
    RET
PLACE_SHIPS_ON_GRID_     ENDP 
 
;-------------------------------------;

ORDER_CELL_SELECTOR_POINTS_   PROC    NEAR
    ; PARAMETERS
    ; AL = IS_VERTICAL (1 IF VERTICAL)
    CMP AL, 1
    JNZ ORDER_HORIZONTAL_SHIP_POINTS
    MOV AX, SELECTOR_GRID_Y1
    CMP AX, SELECTOR_GRID_Y2
    JB POINTS_ORDERED
    MOV BX, SELECTOR_GRID_Y2
    MOV SELECTOR_GRID_Y1, BX
    MOV SELECTOR_GRID_Y2, AX
    JMP POINTS_ORDERED
    
    ORDER_HORIZONTAL_SHIP_POINTS:
    MOV AX, SELECTOR_GRID_X1
    CMP AX, SELECTOR_GRID_X2
    JB POINTS_ORDERED
    MOV BX, SELECTOR_GRID_X2
    MOV SELECTOR_GRID_X1, BX
    MOV SELECTOR_GRID_X2, AX
    
    POINTS_ORDERED:
    RET
ORDER_CELL_SELECTOR_POINTS_ ENDP
;-------------------------------------;

PIXELS_TO_GRID_    PROC    NEAR
    
   ; 4 PARAMETERS CX:PIXELX , DX:PIXELY , SI:OFFSET GRIDX  , DI:OFFSET GRIDY
    
    SUB CX, GRID_CORNER1_X
    MOV DX, 0
    MOV AX, CX
    DIV GRID_SQUARE_SIZE
    MOV [SI], AX
    
    SUB BX, GRID_CORNER1_Y
    MOV DX, 0
    MOV AX, BX
    DIV GRID_SQUARE_SIZE 
    MOV [DI], AX
    RET

 PIXELS_TO_GRID_ ENDP    
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
    ; GRID CELLS MAX COORDINATE
    MOV AX, GRID_CELLS_MAX_COORDINATE_MIN
    MUL BL
    MOV AH, 0
    MOV GRID_CELLS_MAX_COORDINATE, AX
    CMP BL, 2
    JNZ COLUMN_SELECTOR_MIN_AND_MAX
    INC GRID_CELLS_MAX_COORDINATE
    ; COLUMN SELECTOR MIN AND MAX
    COLUMN_SELECTOR_MIN_AND_MAX:
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
;-------------------------------------;
DRAW_SELECTION_SHIPS_   PROC    NEAR
    ; PARAMETERS AL: 1 OR 2 (PLAYER)
    MOV CX, 0
    CMP AL, 1
    JNZ PLAYER2_SELECTION_SHIPS
    MOV DI, OFFSET P1_SHIPS_SIZES
    JMP DRAW_ALL_SELECTION_SHIPS
    PLAYER2_SELECTION_SHIPS:
    MOV DI, OFFSET P2_SHIPS_SIZES
    DRAW_ALL_SELECTION_SHIPS:
        DRAW_SELECTION_SHIP CX, [DI], DARK_GRAY
        ADD DI, 2
        INC CX
        CMP CX, N_SHIPS
    JNZ DRAW_ALL_SELECTION_SHIPS
    RET
DRAW_SELECTION_SHIPS_   ENDP
;-------------------------------------;

DRAW_SELECTION_SHIP_     PROC    NEAR
    ; PARAMETERS
    ; AX = INDEX, BX = SIZE, CL = BORDER_COLOR
    MOV DX, GRID_MAX_COORDINATE
    SUB DX, BX
    INC DX
    MOV GRID1_X, DX
    MOV DX, GRID_MAX_COORDINATE
    MOV GRID2_X, DX
    MOV GRID1_Y, AX
    MOV GRID2_Y, AX
    MOV DL, CL
    DRAW_SHIP GRID1_X, GRID1_Y, GRID2_X, GRID2_Y, DL
    RET
DRAW_SELECTION_SHIP_ ENDP

;-------------------------------------;

DRAW_SHIP_      PROC    NEAR
    ; PARAMETERS
    ; AX = POINT1_X, BX = POINT1_Y, CX = POINT2_X, SI = POINT2_Y, DL = BORDER_COLOR
    GRID_TO_PIXELS AX, BX, CX, SI
   
    ; MOVE THE SECOND POINT FROM THE UPPER LEFT CORNER TO THE LOWER RIGHT CORNER
    MOV AX, PIXELS2_X
    ADD AX, GRID_SQUARE_SIZE
    MOV PIXELS2_X, AX
    MOV AX, PIXELS2_Y
    ADD AX, GRID_SQUARE_SIZE
    MOV PIXELS2_Y, AX

    ; ADJUST SHIP SIZE (SMALLER THAN GRID)   ; SET MARGIN
    MOV AX, 12
    DIV LEVEL   ; MARGIN = 10 / LEVEL   
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
    
    DRAW_RECTANGLE PIXELS1_X, PIXELS1_Y, PIXELS2_X, PIXELS1_Y, DL        ;NOW THE FUNCTION DRAW LINES NOT RECTANGLES
    DRAW_RECTANGLE PIXELS1_X, PIXELS2_Y, PIXELS2_X, PIXELS2_Y, DL 
    DRAW_RECTANGLE PIXELS1_X, PIXELS1_Y, PIXELS1_X, PIXELS2_Y, DL 
    DRAW_RECTANGLE PIXELS2_X, PIXELS1_Y, PIXELS2_X, PIXELS2_Y, DL
    
    ; SECOND LAYER 
    DEC PIXELS1_X
    DEC PIXELS1_Y
    INC PIXELS2_X
    INC PIXELS2_Y
    
    DRAW_RECTANGLE PIXELS1_X, PIXELS1_Y, PIXELS2_X, PIXELS1_Y, DL        ;NOW THE FUNCTION DRAW LINES NOT RECTANGLES
    DRAW_RECTANGLE PIXELS1_X, PIXELS2_Y, PIXELS2_X, PIXELS2_Y, DL 
    DRAW_RECTANGLE PIXELS1_X, PIXELS1_Y, PIXELS1_X, PIXELS2_Y, DL 
    DRAW_RECTANGLE PIXELS2_X, PIXELS1_Y, PIXELS2_X, PIXELS2_Y, DL 

    
    
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
;--------- AHMED PROCEDURES ----------;
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
     PRINT_MESSAGE PRESS_ENTER_MSG , 1425H , 0FF0FH
     
     CMP SI,1H
     JNZ PLAYER2
     PRINT_MESSAGE PLAYER1_MSG ,0C2EH , 0FF28H
     JMP CONT
PLAYER2:
     PRINT_MESSAGE PLAYER2_MSG ,0C2EH , 0FF28H
     
CONT:        
     MOV AH,02H             ;MOVE THE CURSOR
     MOV DX,122FH
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
        CMP AH,F2_SCANCODE
        JZ CONT2
  NOTF2:                 
        CMP AH,EXIT_SCANCODE
        JZ THE_END
        JNZ NOTVALID            
  CONT2:       
  CLEAR_GAME_SCREEN BLACK 
     RET 

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

        RET
GET_LEVEL_     ENDP
;-------------------------------------;

DRAW_ALL_SHIPS_ON_GRID_   PROC    NEAR
    
    ;PARAMETERS AL: 1 OR 2 (PLAYER)
    MOV CX,0
    CMP AL, 1
    JNZ PLAYER2_ALL_SHIPS
    MOV SI, OFFSET P1_SHIPS_POINTS
    JMP DRAW_ALL_SHIPS
    
    PLAYER2_ALL_SHIPS:  
        MOV SI, OFFSET P2_SHIPS_POINTS
            
        DRAW_ALL_SHIPS:
            MOV DX, WORD PTR [SI]
            MOV GRID1_X, DX
            MOV DX, WORD PTR [SI + 2]
            MOV GRID1_Y, DX
            MOV DX, WORD PTR [SI + 4]
            MOV GRID2_X, DX
            MOV DX, WORD PTR [SI + 6]
            MOV GRID2_Y, DX
            DRAW_SHIP GRID1_X, GRID1_Y, GRID2_X, GRID2_Y, DARK_GRAY
            ADD SI, 8
            INC CX
            CMP CX, N_SHIPS
            JNZ DRAW_ALL_SHIPS
    RET
    
    DRAW_ALL_SHIPS_ON_GRID_   ENDP
;-------------------------------------;
DRAW_X_SIGN_   PROC    NEAR

     GRID_TO_PIXELS GRID1_X, GRID1_Y, GRID1_X, GRID1_Y 
      
    ; MOVE THE SECOND POINT FROM THE UPPER LEFT CORNER TO THE UPPER RIGHT CORNER
    MOV AX, PIXELS2_X
    ADD AX, GRID_SQUARE_SIZE
    MOV PIXELS2_X, AX
    
    ; GET LOWER Y TO CHECK THE END OF X-SIGN
    MOV BP, PIXELS2_Y
    ADD BP, GRID_SQUARE_SIZE

    ; ADJUST SHIP SIZE (SMALLER THAN GRID)   ; SET MARGIN
    MOV AX, 10
    DIV LEVEL   ; MARGIN = 10 / LEVEL   ;I EDIT 6 TO 10 IN THE COMMENT ;CHECK YOUSRY 
    ADD PIXELS1_X, AX
    ADD PIXELS1_Y, AX
    SUB PIXELS2_X, AX
    ADD PIXELS2_Y, AX                ;POINT 2 IS THE UPPER RIGHT CORNER
    SUB BP,AX                        ;BP HAS THE LOWER Y
    
 
    MOV SI,PIXELS2_X        ;THE UPPER RIGHT CORNER COORDINATES
    MOV DI,PIXELS2_Y  
    
    MOV AH,0CH 
    MOV CX,PIXELS1_X        ;THE UPPER LEFT CORNER COORDINATES
    MOV DX,PIXELS1_Y  
    
    MOV AL,VARIABLE_COLOR
    MOV BX,00               ;I WILL NEED IT TO CHECK THE NEXT ITERATION IS ODD OR EVEN 
    NEXT_TWO_PIXELS: 
         
         INT 10H           ;DRAW EACH PIXEL 3 TIMES TO MAKE THE IT BOLD ( MORE OBVIOUS )
         INC CX
         INT 10H
         SUB CX,2
         INT 10H
         INC CX
         
         EVENORODD  BX                   ;AT EVEN ITERATIONS I DRAW \ SO INC CX
         CMP IS_EVEN,0                    ;AT ODD ITERATIONS I DRAW / SO DEC CX
         JNE IF_ODD
         IF_EVEN: 
             INC CX
             JMP DONE
             IF_ODD:  
                 DEC CX 
         DONE:
         INC DX
         XCHG CX , SI
         XCHG DX , DI
         INC BX
         CMP DX, BP
         JNZ NEXT_TWO_PIXELS
         
         RET

 DRAW_X_SIGN_   ENDP
;-----------------------------------------; 
DRAW_ALL_X_SIGNS_   PROC    NEAR
    
    ;PARAMETERS AL: 1 OR 2 (PLAYER)
    CMP AL, 1
    JNZ PLAYER2_ALL_ATTACKS
    MOV SI, OFFSET P1_ATTACKS_ONTARGET 
    MOV DI, OFFSET P1_ATTACKS_MISSED 
    MOV CX, P1_ATTACKS_ONTARGET_NUM 
    MOV DX, P1_ATTACKS_MISSED_NUM    
    JMP DRAW_ALL_ATTACKS
    
    PLAYER2_ALL_ATTACKS:  
         MOV SI, OFFSET P2_ATTACKS_ONTARGET 
         MOV DI, OFFSET P2_ATTACKS_MISSED
         MOV CX, P2_ATTACKS_ONTARGET_NUM 
         MOV DX, P2_ATTACKS_MISSED_NUM  
         
        DRAW_ALL_ATTACKS:
            ONTARGET_ATTACKS:
               CMP CX,0
               JZ MISSED_ATTACKS
               MOV AX,[SI]
               MOV GRID1_X,AX
               MOV AX,[SI + 2]
               MOV GRID1_Y,AX
               DRAW_X_SIGN GRID1_X, GRID1_Y, 0CH
               ADD SI,4
               DEC CX
               JMP ONTARGET_ATTACKS
               
               
            MISSED_ATTACKS: 
               CMP DX,0
               JZ ALL_DRAWN
               MOV AX,[DI]
               MOV GRID1_X,AX
               MOV AX,[DI + 2]
               MOV GRID1_Y,AX
               DRAW_X_SIGN GRID1_X, GRID1_Y, 00H
               ADD DI,4
               DEC DX
               JMP MISSED_ATTACKS
      ALL_DRAWN:         
        
     RET
           
DRAW_ALL_X_SIGNS_   ENDP
;-------------------------------------; 
 CELL_HAS_SHIP_   PROC    NEAR
   
    MOV CX,0
    CMP AL, 1
    JNZ CHECK_PLAYER2_SHIPS
    MOV SI, OFFSET P1_SHIPS_POINTS
    MOV DI, OFFSET P1_SHIPS_IS_VERTICAL    
    JMP CHECK_ALL_SHIPS
    
    CHECK_PLAYER2_SHIPS:
           MOV SI, OFFSET P2_SHIPS_POINTS
           MOV DI, OFFSET P2_SHIPS_IS_VERTICAL 
         
           CHECK_ALL_SHIPS:
                
                CHECK_SHIP:
                MOV BX, [DI]              
                CMP BX ,1                 
                JNZ HORIZONTAL_SHIP        
                
                MOV  AX, GRID1_X
                CMP  AX ,  WORD PTR[SI]
                JNZ  EDIT_AND_CHECK_AGAIN  
                MOV  AX, GRID1_Y
                CMP  AX , WORD PTR[SI + 2]                       
                JB EDIT_AND_CHECK_AGAIN
                CMP  AX , WORD PTR[SI + 6] 
                JA  EDIT_AND_CHECK_AGAIN
                MOV IS_ONTARGET,1
                RET
                
                
                HORIZONTAL_SHIP:  
                MOV  AX, GRID1_Y
                CMP  AX ,  WORD PTR[SI + 2]
                JNZ  EDIT_AND_CHECK_AGAIN  
                MOV  AX, GRID1_X      
                CMP AX , WORD PTR[SI]                      
                JB EDIT_AND_CHECK_AGAIN
                CMP AX , WORD PTR[SI + 4]
                JA  EDIT_AND_CHECK_AGAIN
                MOV IS_ONTARGET,1
                RET
                
                EDIT_AND_CHECK_AGAIN:
                ADD SI ,8
                ADD DI,2
                INC CX
                CMP CX ,N_SHIPS
                JNZ CHECK_SHIP
                MOV IS_ONTARGET,0
                RET

                    
  CELL_HAS_SHIP_   ENDP
;-------------------------------------; 
IS_CELL_ATTACKED_BEFORE_  PROC NEAR
    
   ;PARAMETERS AL: 1 OR 2 (PLAYER)
    MOV BX,0
    CMP AL, 1
    JNZ CHECK_PLAYER2_ALL_ATTACKS
    MOV SI, OFFSET P1_ATTACKS_ONTARGET 
    MOV DI, OFFSET P1_ATTACKS_MISSED 
    MOV CX, P1_ATTACKS_ONTARGET_NUM 
    MOV DX, P1_ATTACKS_MISSED_NUM    
    JMP CHECK_ALL_ATTACKS
    
    CHECK_PLAYER2_ALL_ATTACKS:  
         MOV SI, OFFSET P2_ATTACKS_ONTARGET 
         MOV DI, OFFSET P2_ATTACKS_MISSED
         MOV CX, P2_ATTACKS_ONTARGET_NUM 
         MOV DX, P2_ATTACKS_MISSED_NUM 
         
         CHECK_ALL_ATTACKS:
               CMP CX ,0
               JZ CHECK_MISSED_ATTACKS
               MOV AX, [SI]
               CMP AX,ATTACKX                       
               JNZ CHECK_NEXT_ATTACK1
               MOV AX, [SI + 2]
               CMP AX,ATTACKY
               JNZ CHECK_NEXT_ATTACK1
               MOV IS_ATTACKED_BEFORE,1
               RET      
               CHECK_NEXT_ATTACK1:  
                   ADD SI,4
                   DEC CX 
                   JMP CHECK_ALL_ATTACKS
        
          CHECK_MISSED_ATTACKS:     
               MOV SI,DI
               MOV CX,DX
               INC BX
               CMP BX,2                   ;AX IS USED TO REPEAT THE OPERATION TWICE (ONE FOR MISSED AND ONE FOR ONYARGET)
               JNZ CHECK_ALL_ATTACKS
              
          
                
               MOV IS_ATTACKED_BEFORE,0
               RET      
           

IS_CELL_ATTACKED_BEFORE_   ENDP
;-------------------------------------; 
GET_CELL_FROM_PLAYER_  PROC NEAR
         
         GET_ATTACK_COLUMN                ;IT MODIFY COLUMN_SELECTOR_CURRENT_COLUMN
         PRINT_NOTIFICATION_MESSAGE  FIRE_SLIDER_MSG, 1
         FIRE_SLIDER                      ;IT MODIFY  SLIDER_CURRENT_ROW
         PIXELS_TO_GRID COLUMN_SELECTOR_CURRENT_COLUMN , SLIDER_CURRENT_ROW , ATTACKX , ATTACKY
         MOV AX , ATTACKX
         MOV [SI] , AX
         MOV BX , ATTACKY
         MOV [DI] , BX
         RET
GET_CELL_FROM_PLAYER_   ENDP
;-------------------------------------;
 
EVENORODD_  PROC NEAR
    ; PARAMETERS
    ; BX = NUMBER
    MOV AX,BX
    MOV DL,2
    DIV DL
    MOV IS_EVEN,AH
    RET                  
EVENORODD_   ENDP
;-----------------------------------------;
CHECK_CELL_AND_UPDATE_ATTACKS_DATA_  PROC NEAR

    IS_CELL_ON_GRID
    CMP IS_ON_GRID, 0
    JZ DATA_UPDATED
   
    IS_CELL_ATTACKED_BEFORE PLAYER_ATTACKING
     CELL_HAS_SHIP ATTACKX , ATTACKY ,PLAYER_ATTACKED
    
    CMP IS_ATTACKED_BEFORE , 1
    JZ DATA_UPDATED                    ;NO DATA NEEDS TO BE UPDATED IF PLAYER CHOOSE A CELL TWICE
    
    CMP PLAYER_ATTACKED , 2
    JNZ PLAYER1_IS_ATTACKED
    
    PLAYER2_IS_ATTACKED:   
        CMP IS_ONTARGET , 1
        JNZ PLAYER1_ATTACK_MISSED
    
    PLAYER1_ATTACK_ONTARGET:
        MOV SI , OFFSET P2_SCORE
        MOV CX ,[SI]         ;DECREMENT THE SCORE
        DEC CX 
        MOV [SI] , CX 
        PRINT_PLAYER2_SCORE

        
        MOV BX, OFFSET P1_ATTACKS_ONTARGET
        MOV SI, OFFSET P1_ATTACKS_ONTARGET_NUM
        DRAW_X_SIGN ATTACKX, ATTACKY,0CH

       JMP EDIT_DATA 
  
    PLAYER1_ATTACK_MISSED:
        MOV BX, OFFSET P1_ATTACKS_MISSED
        MOV SI, OFFSET P1_ATTACKS_MISSED_NUM
        DRAW_X_SIGN ATTACKX,ATTACKY,00H 
        JMP EDIT_DATA 
    
    PLAYER1_IS_ATTACKED:
        CMP IS_ONTARGET , 1
        JNZ PLAYER2_ATTACK_MISSED
    
    PLAYER2_ATTACK_ONTARGET:
        MOV SI , OFFSET P1_SCORE
        MOV CX ,[SI]         ;DECREMENT THE SCORE
        DEC CX 
        MOV [SI] , CX 
        PRINT_PLAYER1_SCORE
        
        MOV BX, OFFSET P2_ATTACKS_ONTARGET
        MOV SI, OFFSET P2_ATTACKS_ONTARGET_NUM
        DRAW_X_SIGN ATTACKX, ATTACKY,0CH
        JMP EDIT_DATA  
  
    PLAYER2_ATTACK_MISSED:
        MOV BX, OFFSET P2_ATTACKS_MISSED
        MOV SI, OFFSET P2_ATTACKS_MISSED_NUM
        DRAW_X_SIGN ATTACKX,ATTACKY,00H
        
        EDIT_DATA:  
            MOV AX, [SI]         ;INCREMENT NUMBER OF MISSED OR ONTARGET ATTACKS
            INC AX 
            MOV [SI] , AX
            DEC AX
            
            MOV CL , 04H         ;PUT THE CELL IN ONTARGET OR MISSED ( PLAYER 1 OR 2) ARRAY OF ATTACKS 
            MUL CL
            ADD BX,AX 
            MOV CX ,ATTACKX 
            MOV [BX] , CX
            MOV CX ,ATTACKY 
            MOV [BX + 2] ,CX  
            JMP DATA_UPDATED
            
    DATA_UPDATED:
    RET
                  
CHECK_CELL_AND_UPDATE_ATTACKS_DATA_   ENDP
;-------------------------------------; 
SCENE1_PLAYER_ATTACKS_  PROC NEAR
    
    CLEAR_GAME_SCREEN   WHITE
    DRAW_GRID   
    DRAW_SLIDER_BAR 
    DRAW_ALL_X_SIGNS PLAYER_ATTACKING
    RET
                
SCENE1_PLAYER_ATTACKS_   ENDP
;-----------------------------------------;
SCENE2_PLAYER_WATCHES_  PROC NEAR
    
    CLEAR_GAME_SCREEN   WHITE
    DRAW_GRID
    DRAW_ALL_SHIPS_ON_GRID PLAYER_ATTACKED
    DRAW_ALL_X_SIGNS PLAYER_ATTACKING
    RET
    
SCENE2_PLAYER_WATCHES_   ENDP
;-----------------------------------------;
IS_IT_THE_END_  PROC NEAR
    
    CMP P1_SCORE , 0
    JNZ CHECK_PLAYER_2_SCORE 
    MOV GAME_END , 1
    JMP THE_END_IS_NEAR
    
    CHECK_PLAYER_2_SCORE:
    CMP P2_SCORE , 0
    JNZ THE_END_IS_NEAR
    MOV GAME_END , 1   
    
  THE_END_IS_NEAR:
    RET 
    
IS_IT_THE_END_   ENDP
;-----------------------------------------;
REFRESH_DATA_  PROC NEAR
    MOV P1_SCORE , TOTAL_N_CELLS 
    MOV P2_SCORE , TOTAL_N_CELLS 
    MOV P1_ATTACKS_ONTARGET_NUM ,0
    MOV P1_ATTACKS_MISSED_NUM ,0 
    MOV P2_ATTACKS_ONTARGET_NUM ,0 
    MOV P2_ATTACKS_MISSED_NUM ,0
    MOV PLAYER_ATTACKING ,1
    MOV PLAYER_ATTACKING ,2
    MOV GAME_END,0
    
    MOV CX, 0
    MOV SI, P1_SHIPS_POINTS
    MOV DI, P2_SHIPS_POINTS
    RESET_SHIPS_POSITIONS:
        MOV WORD PTR [SI], -2
        MOV WORD PTR [DI], -2
        ADD SI, 2
        ADD DI, 2
        CMP CX, N_SHIPS * 4
    JNZ RESET_SHIPS_POSITIONS
    RET 
    
REFRESH_DATA_   ENDP
;-----------------------------------------;
PRINT_ATTACK_MSG_    PROC    NEAR
    CMP IS_ON_GRID, 0
    JZ ATTACK_OUTSIDE_GRID
    
    CMP IS_ATTACKED_BEFORE, 1
    JZ ATTACK_NO_EFFECT
    
    CMP IS_ONTARGET, 1
    JZ ATTACK_ON_TARGET
    
    PRINT_NOTIFICATION_MESSAGE  NOT_ON_TARGET_MSG, 1
    JMP WAIT_FOR_ENTER_GO_ON
    
    ATTACK_OUTSIDE_GRID:
    PRINT_NOTIFICATION_MESSAGE  GRID_MISSED_MSG, 1
    JMP WAIT_FOR_ENTER_GO_ON
    
    ATTACK_NO_EFFECT:
    PRINT_NOTIFICATION_MESSAGE  CELL_ALREADY_ATTACKED_MSG, 1
    JMP WAIT_FOR_ENTER_GO_ON
    
    ATTACK_ON_TARGET:
    PRINT_NOTIFICATION_MESSAGE  ON_TARGET_MSG, 1
    
    WAIT_FOR_ENTER_GO_ON:
    NOT_ENTER:
    MOV AH,0                      ;WAIT FOR THE USER TO CLICK ENTER
    INT 16H
    CMP AH,ENTER_SCANCODE
    JNZ NOT_ENTER
    
    RET

PRINT_ATTACK_MSG_    ENDP

;-----------------------------------------;

START_THE_GAME_  PROC NEAR
MAIN_LOOP:
    SCENE1_PLAYER_ATTACKS
    GET_CELL_FROM_PLAYER ATTACKX,ATTACKY
    CHECK_CELL_AND_UPDATE_ATTACKS_DATA
    
    PRINT_ATTACK_MSG

    SCENE2_PLAYER_WATCHES
    
    PRINT_NOTIFICATION_MESSAGE  PRESS_ENTER_MSG, 1
    NOT_ENTER2:
    MOV AH,0                        ;WAIT FOR THE USER TO CLICK ENTER
    INT 16H
    CMP AH,ENTER_SCANCODE
    JNZ NOT_ENTER2
    
    MOV AL ,PLAYER_ATTACKING        ;EXCHANGE THE TWO PLAYERS ROLE
    MOV AH ,PLAYER_ATTACKED
    MOV PLAYER_ATTACKING , AH
    MOV PLAYER_ATTACKED , AL
    
    IS_IT_THE_END 
    
    CMP GAME_END , 1
    JNZ MAIN_LOOP
    
    REFRESH_DATA
    JMP STARTING_POINT      ;RETURN TO THE MAIN MENU IF THE GAME HAS BEEN ENDED
    
START_THE_GAME_   ENDP
;-------------------------------------;   
;--------- NADER PROCEDURES ----------;
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
    MOV SLIDER_CURRENT_ROW, SLIDER_INITIAL_ROW
    MOV SLIDER_DIRECTION, 0
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
;PRINTS NOTIFICATION MESSAGES
    
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
;-------------------------------------;
CALCULATE_SELECTOR_INITIAL_POSITION_   PROC    NEAR
    
    MOV SELECTOR_X1, SELECTOR_INITIAL_X1
    MOV SELECTOR_Y1, SELECTOR_INITIAL_Y1
    MOV SELECTOR_X2, SELECTOR_INITIAL_X2
    MOV SELECTOR_Y2, SELECTOR_INITIAL_Y2
    MOV SELECTOR_GRID_X1, SELECTOR_GRID_INITIAL_X1
    MOV SELECTOR_GRID_Y1, SELECTOR_GRID_INITIAL_Y1   
    MOV DX,GRID_SQUARE_SIZE
    ADD SELECTOR_X2,DX
    ADD SELECTOR_Y2,DX
    MOV AX, 10
    DIV LEVEL   ; MARGIN = 10 / LEVEL 
    ADD SELECTOR_X1, AX
    ADD SELECTOR_Y1, AX
    SUB SELECTOR_X2, AX
    SUB SELECTOR_Y2, AX
    MOV UP_ORIENTATION,0
    MOV DOWN_ORIENTATION,0
    MOV LEFT_ORIENTATION,0
    MOV RIGHT_ORIENTATION,0    

CHECK_FOR_SELECTOR_INITIAL_POSITION:
    CELL_HAS_SHIP SELECTOR_GRID_X1,SELECTOR_GRID_Y1,SELECTED_PLAYER_SHIPS
    CMP IS_ONTARGET,0
    JE  VALID_INITIAL_POSITION
    ;IF THERE IS A SHIP, SELECTOR IS MOVED TO THE RIGHT, BUT IT CHECKS WHETHER THERE IS A SHIP ON ITS RIGHT
    ;IF ALL THE RIGHT CELLS ARE FULL, MOVE TO THE NEXT ROW, AND SO ON...
    MOV AX,GRID_CELLS_MAX_COORDINATE
    CMP SELECTOR_GRID_X1,AX
    JE MOVE_TO_NEXT_ROW
    INC SELECTOR_GRID_X1
    ADD SELECTOR_X1,DX
    ADD SELECTOR_X2,DX
    JMP CHECK_FOR_SELECTOR_INITIAL_POSITION
    
MOVE_TO_NEXT_ROW:
    MOV SELECTOR_GRID_X1,0
    MOV SELECTOR_X1, SELECTOR_INITIAL_X1
    MOV SELECTOR_X2, SELECTOR_INITIAL_X2
    ADD SELECTOR_X2,DX
   
    INC SELECTOR_GRID_Y1
    ADD SELECTOR_Y1,DX
    ADD SELECTOR_Y2,DX
    MOV AX, 10
    DIV LEVEL   ; MARGIN = 10 / LEVEL 
    ADD SELECTOR_X1, AX
    SUB SELECTOR_X2, AX
    JMP CHECK_FOR_SELECTOR_INITIAL_POSITION
    
VALID_INITIAL_POSITION:    
    RET
CALCULATE_SELECTOR_INITIAL_POSITION_   ENDP
;-----------------------------------------;
CELLS_SELECTOR_   PROC    NEAR 
    ;PARAMETERS:
    ;CX: SHIP SIZE 
    ;RETURNS: 2 POINTS IN GRID COORDINATES THAT THE PLAYER CHOSE (SELECTOR_GRID 1 AND 2) , THEY ARE NOT NECESSARILY IN THE RIGHT FORMAT
    
    ; INITIALIZATION
    DEC CX
    MOV DX,GRID_SQUARE_SIZE
    CALCULATE_SELECTOR_INITIAL_POSITION
    
    PRINT_NOTIFICATION_MESSAGE STATUS_TEST1,1
WAIT_FOR_DIRECTION_KEY:
    DRAW_RECTANGLE SELECTOR_X1,SELECTOR_Y1,SELECTOR_X2,SELECTOR_Y2,RED
    MOV AH,0
    INT 16H
    CMP AH,ENTER_SCANCODE ;CHECKS IF THE USER HAS ALREADY CHOSEN THE FIRST CELL OF THE SELECTED SHIP
    JE SELECTOR_SECOND_POINT
    ;AFTER GETTING DIRECTION KEY, REMOVE THE OLD SELECTOR ICON, TO DRAW THE NEW ONE
    DRAW_RECTANGLE SELECTOR_X1,SELECTOR_Y1,SELECTOR_X2,SELECTOR_Y2,WHITE
    CMP AH,UP_SCANCODE 
    JE SELECTOR_UP
    CMP AH,DOWN_SCANCODE
    JE SELECTOR_DOWN
    CMP AH,LEFT_SCANCODE 
    JE SELECTOR_LEFT
    CMP AH,RIGHT_SCANCODE 
    JE SELECTOR_RIGHT
    JMP WAIT_FOR_DIRECTION_KEY
SELECTOR_UP:
    CMP SELECTOR_GRID_Y1,0    ;BOUNDARIES CHECK
    JE WAIT_FOR_DIRECTION_KEY
    RECHECK_SELECTOR_UP:
    DEC SELECTOR_GRID_Y1     
    CELL_HAS_SHIP SELECTOR_GRID_X1,SELECTOR_GRID_Y1,SELECTED_PLAYER_SHIPS  ;CHECKS WHETHER THE CELL HAS A SHIP PLACED ON IT OR NOT
    CMP IS_ONTARGET,0
    JE  SELECTOR_UP_CONTINUE
;IF THERE IS A SHIP,DO NOTHING (SHIP IS ON ONE OF THE BORDERS), OR JUMP OVER IT
    
    ;IF THE SHIP IS IN THE LAST CELL IN THE RESPECTIVE DIRECTION, DO NOTHING AND WAIT FOR ANOTHER DIRECTION
    CMP SELECTOR_GRID_Y1,0 
    JE RESET_UP_SHIP_JUMP
    
    ;IF IT'S NOT ON A BORDER CELL, JUMP OVER IT AND CHECK 
    INC JUMP_COUNTER
    JMP RECHECK_SELECTOR_UP  
    
    RESET_UP_SHIP_JUMP:
    MOV SI,CX       ;SAVE CX VALUE AS IT'LL BE USED AS A COUNTER
    MOV CX,JUMP_COUNTER
    RESET_SELECTOR_UP_COORDINATES:    
    INC SELECTOR_GRID_Y1
    LOOP RESET_SELECTOR_UP_COORDINATES  
    MOV CX,SI
    MOV JUMP_COUNTER,1  
    JMP WAIT_FOR_DIRECTION_KEY
    
    SELECTOR_UP_CONTINUE:
    MOV SI,CX       ;SAVE CX VALUE AS IT'LL BE USED AS A COUNTER
    MOV CX,JUMP_COUNTER
    DECREMENT_SELECTOR_UP_PIXEL_COORDINATES:    
    SUB SELECTOR_Y1,DX
    SUB SELECTOR_Y2,DX
    LOOP DECREMENT_SELECTOR_UP_PIXEL_COORDINATES  
    MOV CX,SI   
    MOV JUMP_COUNTER,1
    JMP WAIT_FOR_DIRECTION_KEY 
SELECTOR_DOWN:
    MOV AX, SELECTOR_GRID_Y1
    CMP AX,GRID_CELLS_MAX_COORDINATE    ;BOUNDARIES CHECK
    JE  WAIT_FOR_DIRECTION_KEY
    RECHECK_SELECTOR_DOWN:
    INC SELECTOR_GRID_Y1     
    CELL_HAS_SHIP SELECTOR_GRID_X1,SELECTOR_GRID_Y1,SELECTED_PLAYER_SHIPS  ;CHECKS WHETHER THE CELL HAS A SHIP PLACED ON IT OR NOT
    CMP IS_ONTARGET,0
    JE  SELECTOR_DOWN_CONTINUE
;IF THERE IS A SHIP,DO NOTHING (SHIP IS ON ONE OF THE BORDERS), OR JUMP OVER IT
    
    ;IF THE SHIP IS IN THE LAST CELL IN THE RESPECTIVE DIRECTION, DO NOTHING AND WAIT FOR ANOTHER DIRECTION
    MOV AX,GRID_CELLS_MAX_COORDINATE
    CMP SELECTOR_GRID_Y1,AX 
    JE RESET_DOWN_SHIP_JUMP
    
    ;IF IT'S NOT ON A BORDER CELL, JUMP OVER IT AND CHECK 
    INC JUMP_COUNTER
    JMP RECHECK_SELECTOR_DOWN  
    
    RESET_DOWN_SHIP_JUMP:
    MOV SI,CX       ;SAVE CX VALUE AS IT'LL BE USED AS A COUNTER
    MOV CX,JUMP_COUNTER
    RESET_SELECTOR_DOWN_COORDINATES:    
    DEC SELECTOR_GRID_Y1
    LOOP RESET_SELECTOR_DOWN_COORDINATES  
    MOV CX,SI
    MOV JUMP_COUNTER,1  
    JMP WAIT_FOR_DIRECTION_KEY
    
    SELECTOR_DOWN_CONTINUE:
    MOV SI,CX       ;SAVE CX VALUE AS IT'LL BE USED AS A COUNTER
    MOV CX,JUMP_COUNTER
    INCREMENT_SELECTOR_DOWN_PIXEL_COORDINATES:    
    ADD SELECTOR_Y1,DX
    ADD SELECTOR_Y2,DX
    LOOP INCREMENT_SELECTOR_DOWN_PIXEL_COORDINATES  
    MOV CX,SI   
    MOV JUMP_COUNTER,1
    JMP WAIT_FOR_DIRECTION_KEY   
SELECTOR_LEFT:
    CMP SELECTOR_GRID_X1,0    ;BOUNDARIES CHECK
    JE  WAIT_FOR_DIRECTION_KEY
    RECHECK_SELECTOR_LEFT:
    DEC SELECTOR_GRID_X1     
    CELL_HAS_SHIP SELECTOR_GRID_X1,SELECTOR_GRID_Y1,SELECTED_PLAYER_SHIPS  ;CHECKS WHETHER THE CELL HAS A SHIP PLACED ON IT OR NOT
    CMP IS_ONTARGET,0
    JE  SELECTOR_LEFT_CONTINUE
;IF THERE IS A SHIP,DO NOTHING (SHIP IS ON ONE OF THE BORDERS), OR JUMP OVER IT
    
    ;IF THE SHIP IS IN THE LAST CELL IN THE RESPECTIVE DIRECTION, DO NOTHING AND WAIT FOR ANOTHER DIRECTION
    CMP SELECTOR_GRID_X1,0 
    JE RESET_LEFT_SHIP_JUMP
    
    ;IF IT'S NOT ON A BORDER CELL, JUMP OVER IT AND CHECK 
    INC JUMP_COUNTER
    JMP RECHECK_SELECTOR_LEFT  
    
    RESET_LEFT_SHIP_JUMP:
    MOV SI,CX       ;SAVE CX VALUE AS IT'LL BE USED AS A COUNTER
    MOV CX,JUMP_COUNTER
    RESET_SELECTOR_LEFT_COORDINATES:    
    INC SELECTOR_GRID_X1
    LOOP RESET_SELECTOR_LEFT_COORDINATES  
    MOV CX,SI
    MOV JUMP_COUNTER,1  
    JMP WAIT_FOR_DIRECTION_KEY
    
    SELECTOR_LEFT_CONTINUE:
    MOV SI,CX       ;SAVE CX VALUE AS IT'LL BE USED AS A COUNTER
    MOV CX,JUMP_COUNTER
    DECREMENT_SELECTOR_LEFT_PIXEL_COORDINATES:    
    SUB SELECTOR_X1,DX
    SUB SELECTOR_X2,DX
    LOOP DECREMENT_SELECTOR_LEFT_PIXEL_COORDINATES  
    MOV CX,SI   
    MOV JUMP_COUNTER,1
    JMP WAIT_FOR_DIRECTION_KEY
SELECTOR_RIGHT:
    MOV AX, SELECTOR_GRID_X1
    CMP AX,GRID_CELLS_MAX_COORDINATE    ;BOUNDARIES CHECK
    JE  WAIT_FOR_DIRECTION_KEY
    RECHECK_SELECTOR_RIGHT:
    INC SELECTOR_GRID_X1     
    CELL_HAS_SHIP SELECTOR_GRID_X1,SELECTOR_GRID_Y1,SELECTED_PLAYER_SHIPS  ;CHECKS WHETHER THE CELL HAS A SHIP PLACED ON IT OR NOT
    CMP IS_ONTARGET,0
    JE  SELECTOR_RIGHT_CONTINUE
;IF THERE IS A SHIP,DO NOTHING (SHIP IS ON ONE OF THE BORDERS), OR JUMP OVER IT
    
    ;IF THE SHIP IS IN THE LAST CELL IN THE RESPECTIVE DIRECTION, DO NOTHING AND WAIT FOR ANOTHER DIRECTION
    MOV AX,GRID_CELLS_MAX_COORDINATE
    CMP SELECTOR_GRID_X1,AX 
    JE RESET_RIGHT_SHIP_JUMP
    
    ;IF IT'S NOT ON A BORDER CELL, JUMP OVER IT AND CHECK 
    INC JUMP_COUNTER
    JMP RECHECK_SELECTOR_RIGHT  
    
    RESET_RIGHT_SHIP_JUMP:
    MOV SI,CX       ;SAVE CX VALUE AS IT'LL BE USED AS A COUNTER
    MOV CX,JUMP_COUNTER
    RESET_SELECTOR_RIGHT_COORDINATES:    
    DEC SELECTOR_GRID_X1
    LOOP RESET_SELECTOR_RIGHT_COORDINATES  
    MOV CX,SI
    MOV JUMP_COUNTER,1  
    JMP WAIT_FOR_DIRECTION_KEY
    
    SELECTOR_RIGHT_CONTINUE:
    MOV SI,CX       ;SAVE CX VALUE AS IT'LL BE USED AS A COUNTER
    MOV CX,JUMP_COUNTER
    INCREMENT_SELECTOR_RIGHT_PIXEL_COORDINATES:    
    ADD SELECTOR_X1,DX
    ADD SELECTOR_X2,DX
    LOOP INCREMENT_SELECTOR_RIGHT_PIXEL_COORDINATES  
    MOV CX,SI   
    MOV JUMP_COUNTER,1
    JMP WAIT_FOR_DIRECTION_KEY
    
SELECTOR_SECOND_POINT:
    PRINT_NOTIFICATION_MESSAGE STATUS_TEST2,1
UP_ORIENTATION_CHECK:
    MOV AX,SELECTOR_GRID_X1
    MOV SELECTOR_GRID_X2,AX
    MOV AX,SELECTOR_GRID_Y1
    MOV SELECTOR_GRID_Y2,AX    ;COPY POINT 1 TO POINT 2
    MOV DX,CX                  ;COPY SIZE TO DX
    CMP SELECTOR_GRID_Y1,CX
    JAE UP_ORIENTATION_SHIP_CHECK   
    MOV UP_ORIENTATION,0
    JMP DOWN_ORIENTATION_CHECK 
    UP_ORIENTATION_SHIP_CHECK:     ;CHECKS WHETHER THE UP-REGION HAS SHIPS PLACED IN ITS DIRECTION 
        DEC SELECTOR_GRID_Y2       ;TRAVERSE ON THE Y-AXIS UPWARDS
        CELL_HAS_SHIP SELECTOR_GRID_X2,SELECTOR_GRID_Y2,SELECTED_PLAYER_SHIPS
        CMP IS_ONTARGET,0
        JNE UP_ORIENTATION_INVALID
        LOOP UP_ORIENTATION_SHIP_CHECK
        MOV UP_ORIENTATION,1            ;ORIENTATION IS VALID
        ;HIGHLIGHT ORIENTATION REGION
        MOV AX,SELECTOR_X1
        MOV PIXELS1_X,AX
        MOV AX,SELECTOR_Y1
        MOV PIXELS1_Y,AX
        MOV AX,SELECTOR_X2
        MOV PIXELS2_X,AX
        MOV AX,SELECTOR_Y2  
        MOV PIXELS2_Y,AX   ;STORE SELECTOR PIXELS COORDINATES
        MOV AX,GRID_SQUARE_SIZE
        MOV CX,DX          ;SET COUNTER
        UP_HIGHLIGHT:
        SUB PIXELS1_Y,AX
        SUB PIXELS2_Y,AX
        DRAW_RECTANGLE PIXELS1_X,PIXELS1_Y,PIXELS2_X,PIXELS2_Y,YELLOW
        LOOP UP_HIGHLIGHT
        
        JMP DOWN_ORIENTATION_CHECK
        UP_ORIENTATION_INVALID:
           MOV UP_ORIENTATION,0 
           
DOWN_ORIENTATION_CHECK:
    MOV CX,DX                  ;RETURN CX TO ITS ORIGINAL VALUE
    MOV AX,SELECTOR_GRID_X1
    MOV SELECTOR_GRID_X2,AX
    MOV AX,SELECTOR_GRID_Y1
    MOV SELECTOR_GRID_Y2,AX    ;RETURN POINT 2 TO ITS INTIAL VALUE
    
    MOV SI,GRID_CELLS_MAX_COORDINATE
    SUB SI,SELECTOR_GRID_Y1
    CMP SI,CX
    JAE DOWN_ORIENTATION_SHIP_CHECK   
    MOV DOWN_ORIENTATION,0
    JMP LEFT_ORIENTATION_CHECK 
    DOWN_ORIENTATION_SHIP_CHECK:     ;CHECKS WHETHER THE DOWN-REGION HAS SHIPS PLACED IN ITS DIRECTION 
        INC SELECTOR_GRID_Y2       ;TRAVERSE ON THE Y-AXIS DOWNWARDS
        CELL_HAS_SHIP SELECTOR_GRID_X2,SELECTOR_GRID_Y2,SELECTED_PLAYER_SHIPS
        CMP IS_ONTARGET,0
        JNE DOWN_ORIENTATION_INVALID
        LOOP DOWN_ORIENTATION_SHIP_CHECK
        MOV DOWN_ORIENTATION,1            ;ORIENTATION IS VALID
        ;HIGHLIGHT ORIENTATION REGION
        MOV AX,SELECTOR_X1
        MOV PIXELS1_X,AX
        MOV AX,SELECTOR_Y1
        MOV PIXELS1_Y,AX
        MOV AX,SELECTOR_X2
        MOV PIXELS2_X,AX
        MOV AX,SELECTOR_Y2  
        MOV PIXELS2_Y,AX   ;STORE SELECTOR PIXELS COORDINATES
        MOV AX,GRID_SQUARE_SIZE
        MOV CX,DX          ;SET COUNTER
        DOWN_HIGHLIGHT:
        ADD PIXELS1_Y,AX
        ADD PIXELS2_Y,AX
        DRAW_RECTANGLE PIXELS1_X,PIXELS1_Y,PIXELS2_X,PIXELS2_Y,YELLOW
        LOOP DOWN_HIGHLIGHT
        
        JMP LEFT_ORIENTATION_CHECK
        DOWN_ORIENTATION_INVALID:
        MOV DOWN_ORIENTATION,0 
                          
LEFT_ORIENTATION_CHECK:
    MOV CX,DX                  ;RETURN CX TO ITS ORIGINAL VALUE
    MOV AX,SELECTOR_GRID_X1
    MOV SELECTOR_GRID_X2,AX
    MOV AX,SELECTOR_GRID_Y1
    MOV SELECTOR_GRID_Y2,AX    ;RETURN POINT 2 TO ITS INTIAL VALUE
    
    CMP SELECTOR_GRID_X1,CX
    JAE LEFT_ORIENTATION_SHIP_CHECK   
    MOV LEFT_ORIENTATION,0
    JMP RIGHT_ORIENTATION_CHECK 
    LEFT_ORIENTATION_SHIP_CHECK:     ;CHECKS WHETHER THE LEFT-REGION HAS SHIPS PLACED IN ITS DIRECTION 
        DEC SELECTOR_GRID_X2       ;TRAVERSE ON THE X-AXIS IN THE LEFT DIRECTION
        CELL_HAS_SHIP SELECTOR_GRID_X2,SELECTOR_GRID_Y2,SELECTED_PLAYER_SHIPS
        CMP IS_ONTARGET,0
        JNE LEFT_ORIENTATION_INVALID
        LOOP LEFT_ORIENTATION_SHIP_CHECK
        MOV LEFT_ORIENTATION,1            ;ORIENTATION IS VALID
        ;HIGHLIGHT ORIENTATION REGION
        MOV AX,SELECTOR_X1
        MOV PIXELS1_X,AX
        MOV AX,SELECTOR_Y1
        MOV PIXELS1_Y,AX
        MOV AX,SELECTOR_X2
        MOV PIXELS2_X,AX
        MOV AX,SELECTOR_Y2  
        MOV PIXELS2_Y,AX   ;STORE SELECTOR PIXELS COORDINATES
        MOV AX,GRID_SQUARE_SIZE
        MOV CX,DX          ;SET COUNTER
        LEFT_HIGHLIGHT:
        SUB PIXELS1_X,AX
        SUB PIXELS2_X,AX
        DRAW_RECTANGLE PIXELS1_X,PIXELS1_Y,PIXELS2_X,PIXELS2_Y,YELLOW
        LOOP LEFT_HIGHLIGHT
        
        JMP RIGHT_ORIENTATION_CHECK
        LEFT_ORIENTATION_INVALID:
        MOV LEFT_ORIENTATION,0
RIGHT_ORIENTATION_CHECK:
    MOV CX,DX                  ;RETURN CX TO ITS ORIGINAL VALUE
    MOV AX,SELECTOR_GRID_X1
    MOV SELECTOR_GRID_X2,AX
    MOV AX,SELECTOR_GRID_Y1
    MOV SELECTOR_GRID_Y2,AX    ;RETURN POINT 2 TO ITS INTIAL VALUE
    
    MOV SI,GRID_CELLS_MAX_COORDINATE
    SUB SI,SELECTOR_GRID_X1
    CMP SI,CX
    JAE RIGHT_ORIENTATION_SHIP_CHECK   
    MOV RIGHT_ORIENTATION,0
    JMP CHECK_POSSIBLE_ORIENTATION 
    RIGHT_ORIENTATION_SHIP_CHECK:     ;CHECKS WHETHER THE RIGHT-REGION HAS SHIPS PLACED IN ITS DIRECTION 
        INC SELECTOR_GRID_X2       ;TRAVERSE ON THE X-AXIS IN THE RIGHT DIRECTION
        CELL_HAS_SHIP SELECTOR_GRID_X2,SELECTOR_GRID_Y2,SELECTED_PLAYER_SHIPS
        CMP IS_ONTARGET,0
        JNE RIGHT_ORIENTATION_INVALID
        LOOP RIGHT_ORIENTATION_SHIP_CHECK
        MOV RIGHT_ORIENTATION,1            ;ORIENTATION IS VALID
        ;HIGHLIGHT ORIENTATION REGION
        MOV AX,SELECTOR_X1
        MOV PIXELS1_X,AX
        MOV AX,SELECTOR_Y1
        MOV PIXELS1_Y,AX
        MOV AX,SELECTOR_X2
        MOV PIXELS2_X,AX
        MOV AX,SELECTOR_Y2  
        MOV PIXELS2_Y,AX   ;STORE SELECTOR PIXELS COORDINATES
        MOV AX,GRID_SQUARE_SIZE
        MOV CX,DX          ;SET COUNTER
        RIGHT_HIGHLIGHT:
        ADD PIXELS1_X,AX
        ADD PIXELS2_X,AX
        DRAW_RECTANGLE PIXELS1_X,PIXELS1_Y,PIXELS2_X,PIXELS2_Y,YELLOW
        LOOP RIGHT_HIGHLIGHT
        
        JMP CHECK_POSSIBLE_ORIENTATION
        RIGHT_ORIENTATION_INVALID:
        MOV RIGHT_ORIENTATION,0
        ;CHECK IF THERE IS AT LEAST ONE POSSIBLE ORIENTATION
CHECK_POSSIBLE_ORIENTATION:
        MOV AL,0
        OR AL,UP_ORIENTATION
        OR AL,DOWN_ORIENTATION        
        OR AL,LEFT_ORIENTATION
        OR AL,RIGHT_ORIENTATION 
        CMP AL,0
        JNE GET_SECOND_POINT
        PRINT_NOTIFICATION_MESSAGE NO_POSSIBLE_ORIENTATION,1
        WAIT_FOR_ENTER_TO_WAIT_FOR_DIRECTION_KEY:
        MOV AH, 0
        INT 16H
        CMP AH, ENTER_SCANCODE
        JNZ WAIT_FOR_ENTER_TO_WAIT_FOR_DIRECTION_KEY
        PRINT_NOTIFICATION_MESSAGE STATUS_TEST1,1
        ;RESET DATA
        MOV DX,GRID_SQUARE_SIZE
        JMP WAIT_FOR_DIRECTION_KEY
        
GET_SECOND_POINT:
    MOV CX,DX
    MOV AX,SELECTOR_GRID_X1
    MOV SELECTOR_GRID_X2,AX
    MOV AX,SELECTOR_GRID_Y1
    MOV SELECTOR_GRID_Y2,AX
    WAIT_ORIENTATION_SELECTION:
        MOV AH,0
        INT 16H
        CMP AH,UP_SCANCODE 
        JE UP_ORIENTATION_SELECTED
        CMP AH,DOWN_SCANCODE
        JE DOWN_ORIENTATION_SELECTED
        CMP AH,LEFT_SCANCODE 
        JE LEFT_ORIENTATION_SELECTED
        CMP AH,RIGHT_SCANCODE 
        JE RIGHT_ORIENTATION_SELECTED
        JMP WAIT_ORIENTATION_SELECTION
UP_ORIENTATION_SELECTED:   
        CMP UP_ORIENTATION,0
        JE  WAIT_ORIENTATION_SELECTION
        SUB SELECTOR_GRID_Y2,CX
        CLEAR_GRID 
        RET   
DOWN_ORIENTATION_SELECTED:
        CMP DOWN_ORIENTATION,0
        JE  WAIT_ORIENTATION_SELECTION 
        ADD SELECTOR_GRID_Y2,CX
        CLEAR_GRID
        RET       
LEFT_ORIENTATION_SELECTED: 
        CMP LEFT_ORIENTATION,0
        JE  WAIT_ORIENTATION_SELECTION
        SUB SELECTOR_GRID_X2,CX
        CLEAR_GRID
        RET        
RIGHT_ORIENTATION_SELECTED:
        CMP RIGHT_ORIENTATION,0
        JE  WAIT_ORIENTATION_SELECTION          
        ADD SELECTOR_GRID_X2,CX
        CLEAR_GRID
    RET
CELLS_SELECTOR_   ENDP
;-----------------------------------------;  
CLEAR_GRID_   PROC    NEAR 
    DRAW_RECTANGLE  GRID_CORNER1_X,GRID_CORNER1_Y,GRID_CORNER2_X,GRID_CORNER2_Y,WHITE
    DRAW_GRID 
    RET
CLEAR_GRID_   ENDP
;-----------------------------------------;    
CLEAR_GAME_SCREEN_  PROC    NEAR
    ; PARAMETERS
    ; AL = COLOR   
    DRAW_RECTANGLE  0, 0, GAME_SCREEN_MAX_X, GAME_SCREEN_MAX_Y, AL  
    RET
CLEAR_GAME_SCREEN_  ENDP

END     MAIN