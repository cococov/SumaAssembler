DATA SEGMENT     ;Inicio DATA SEGMENT (declaracion de variables)
     NUM1 DB ?   ;vacio (recibe dato)
     NUM2 DB ?   ;vacio (recibe dato)
     RESULT DB ? ;vacio (recibe dato)
     MSG1 DB 10,13,"Ingrese el primer numero a sumar : $"
     MSG2 DB 10,13,"Ingrese el segundo numero a sumar : $"  
     MSG3 DB 10,13,"La suma es : $"
     MSG4 DB 10,13,"Presione una tecla para terminar... $"
ENDS               ;Fin DATA SEGMENT
CODE SEGMENT       ;Inicio CODE SEGMENT
    ASSUME DS:DATA CS:CODE ;Se asume DATA como DS y CODE como CS
START:             ;Inicio programa (logica)
      MOV AX,DATA  ;Mete el segmento data al registro AX
      MOV DS,AX    ;Data Segment referencia a lo almacenado en AX (DATA)                                 
      
      ;Lectura primer numero ----------------------------------------------------------------------------  
      
      LEA DX,MSG1  ;Almacena en DX la direccion el primer mensaje a mostrar en pantalla
      MOV AH,9     ;Ingresamos la funcion 9(Visualizacion de una cadena de caracteres) en AH
      INT 21H      ;Interrupcion 21H (Ejecula la funcion almacenada en AH)
     
      MOV AH,1     ;Ingresamos la funcion 1(Entrada de Caracter con Eco y se almacena el AL) en AH
      INT 21H      ;Interrupcion 21H (Ejecula la funcion almacenada en AH)
      SUB AL,30H   ;Se le resta 30H a el valor del registro AL (8bits) 
      MOV NUM1,AL  ;Mete el numero captado en la variable NUM1
      
      ;Lectura segundo numero ---------------------------------------------------------------------------
      
      LEA DX,MSG2  ;Almacena en DX la direccion el segundo mensaje a mostrar en pantalla
      MOV AH,9     ;Ingresamos la funcion 9(Visualizacion de una cadena de caracteres) en AH
      INT 21H      ;Interrupcion 21H (Ejecula la funcion almacenada en AH)
     
      MOV AH,1     ;Ingresamos la funcion 1(Entrada de Caracter con Eco y se almacena el AL) en AH
      INT 21H      ;Interrupcion 21H (Ejecula la funcion almacenada en AH)
      SUB AL,30H   ;Se le resta 30H a el valor del registro AL (8bits) 
      MOV NUM2,AL  ;Mete el numero captado en la variable NUM2
      
      ;SUMA----------------------------------------------------------------------------------------------
      
      ADD AL,NUM1  ;Se agrega NUM1 a el registro AL, en el cual ya estaba NUM2, por lo que se suman
              
      MOV RESULT,AL;Se agrega el valor del registro AL a la variable RESULT
     
      MOV AH,0     ;Se pone un 0 en el registro AH
      AAA          ;Si el valor es mayor a 9 se divide en 2 registros AH y AL
     
      ADD AH,30H   ;Se le suma 30H al registro para sacar su valor ASCII, si AL<= 9 -> AH = 0
      ADD AL,30H   ;Se le suma 30H al registro para sacar su valor ASCII
     
      MOV BX,AX    ;Se mueve AX a BX
      
      ;Imprimir el resultado en pantalla-----------------------------------------------------------------
      
      LEA DX,MSG3  ;Almacena en DX la direccion el tercer mensaje a mostrar en pantalla
      MOV AH,9     ;Ingresamos la funcion 9(Visualizacion de una cadena de caracteres) en AH
      INT 21H      ;Interrupcion 21H (Ejecula la funcion almacenada en AH)
     
      MOV AH,2     ;Ingresamos la funcion 2(Visualizacion de un caracter) en AH
      MOV DL,BH    ;Ingresamos en DL el ASCII a imprimir
      INT 21H      ;Interrupcion 21H (Ejecula la funcion almacenada en AH)
     
      MOV AH,2     ;Ingresamos la funcion 2(Visualizacion de una cadena de caracteres) en AH
      MOV DL,BL    ;Ingresamos en DL el ASCII a imprimir
      INT 21H      ;Interrupcion 21H (Ejecula la funcion almacenada en AH)                               
      
      ;FIN del programa-----------------------------------------------------------------------------------------------
      ;Pausa 
      LEA DX,MSG4  ;Almacena en DX la direccion el cuarto mensaje a mostrar en pantalla
      MOV AH,9     ;Ingresamos la funcion 9(Visualizacion de una cadena de caracteres) en AH
      INT 21H      ;Interrupcion 21H (Ejecula la funcion almacenada en AH)
      MOV AH,1     ;Ingresamos la funcion 9(Entrada de Caracter con Eco y se almacena el AL) en AH
      INT 21H      ;Interrupcion 21H (Ejecula la funcion almacenada en AH)
      ;FIN
      MOV AH,4CH   ;Ingresamos la funcion 4CH(Finalizar programa) en AH
      INT 21H      ;Interrupcion 21H (Ejecula la funcion almacenada en AH)
ENDS               ;Fin Code Segment
END START          ;Fin START