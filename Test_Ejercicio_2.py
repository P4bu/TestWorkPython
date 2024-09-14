# Programacion
# 2. Escriba un metodo/funcion tal que dado un numero entero, entregue su representacion en palabras ej: 145 -> Ciento cuarenta y cinco

#Diccionarios de Numeros
unidad = [
    {"numero": 0, "text": "cero"},
    {"numero": 1, "text": "uno"},
    {"numero": 2, "text": "dos"},
    {"numero": 3, "text": "tres"},
    {"numero": 4, "text": "cuatro"},
    {"numero": 5, "text": "cinco"},
    {"numero": 6, "text": "seis"},
    {"numero": 7, "text": "siete"},
    {"numero": 8, "text": "ocho"},
    {"numero": 9, "text": "nueve"}
]

decena = [
    {"numero": 1, "text": "diez"},
    {"numero": 2, "text": "veinte"},
    {"numero": 3, "text": "treinta"},
    {"numero": 4, "text": "cuarenta"},
    {"numero": 5, "text": "cincuenta"},
    {"numero": 6, "text": "sesenta"},
    {"numero": 7, "text": "setenta"},
    {"numero": 8, "text": "ochenta"},
    {"numero": 9, "text": "noventa"}
]

centena = [
    {"numero": 1, "text": "cien"},
    {"numero": 2, "text": "docientos"},
    {"numero": 3, "text": "trecientos"},
    {"numero": 4, "text": "cuatrocientos"},
    {"numero": 5, "text": "quinientos"},
    {"numero": 6, "text": "seiscientos"},
    {"numero": 7, "text": "setecientos"},
    {"numero": 8, "text": "ochocientos"},
    {"numero": 9, "text": "novecientos"}
]

# ingresar un numero y validar que sea un entero
def ingresar():
    while True: 
        number =  input("Ingrese un numero: ")
        if(number.isdigit() or (number[0] == '-' and number[1:].isdigit())):
            number_int = int(number)
            break
        else: 
            print("Haz ingresado algo distinto a un Numero!")
    #print(number_int)
    return number_int    

# Traducir el numero ingresado a palabras
def traducir(number_int):
    print(number_int)
    # print("XD", unidad[0]["text"])
    # Verificar si el numero es unidad - decena - centena
    if(number_int >= 0 and number_int <= 9 ):
        print("El numero es una unidad")
        traduccion_unidad = [uni["text"] for uni in unidad if uni["numero"] == number_int]
        # print("desde la funcion traducir ",number_int)
        print(traduccion_unidad[0])

    if(number_int >= 10 and number_int <= 99):
        print("El numero es una decena")
        decena_numero = number_int // 10
        # print("XD ",decena_numero)
        unidad_numero = number_int % 10 
        # print("XDXD", unidad_numero)
        traduccion_decena = [dec["text"] for dec in decena if dec["numero"] == decena_numero]
        traduccion_unidad = [uni["text"] for uni in unidad if uni["numero"] == unidad_numero]
        print(traduccion_decena[0], "y" , traduccion_unidad[0]) 

    if(number_int >= 100 and number_int <= 999):
        print("El numero es una centena")
        centana_numero = number_int // 100
        print("=> ", centana_numero)
        decena_numero = (number_int // 10) % 10
        print("=> ", decena_numero)
        unidad_numero = number_int % 10
        print("=> ", unidad_numero)

        traduccion_centena = [cen["text"] for cen in centena if cen["numero"] == centana_numero]
        traduccion_decena = [dec["text"] for dec in decena if dec["numero"] == decena_numero]
        traduccion_unidad = [uni["text"] for uni in unidad if uni["numero"] == unidad_numero]  
        print(traduccion_centena[0], traduccion_decena[0], "y" , traduccion_unidad[0]) 

# Llamado a las funciones ingresar para traducir
traducir(ingresar())





    
