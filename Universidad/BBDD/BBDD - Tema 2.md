# Algebra relacional
## Concepto
+ Es un lenguaje de consultas procedimental puro
+ Sistema cerrado de operaciones sobre relaciones
+ Esta formado por una serie de operadores (esenciales y derivados)

Algunos operadores son sobre conjuntos, otros son específicamente relacionales y otros son mixtos

Cardinal - Numero de filas que tiene una tabla
Grado - Numero de columnas que tiene una tabla

## Selección
+ S(F)(R)
> Selección de la tabla R según el predicado F

+ Da lugar a una nueva tabla con los mismos atributos que R (mismo esquema), esta tiene menor cardinal.
+ F se construye con constantes operadores ariméticos comparacioanles y lógicos

**CLIENTE (DNI, NBC, CDC)
PRESTAMO (CS, NP, DNI, I)
CUENTA (CS, NC, DNI, SLD)
SUCURSAL (CS, NBS, CDS)**

*1. Listar las filas de préstamo donde sucursal sea 1*
S(CS = 1)(PRÉSTAMO)

*2. Filas de préstamo con sucursal cs = 1 y un importe superior a la cantidad de 1.000.000 de euros*
S((CS=1)^(I>1.000.000))(PRÉSTAMO)
==O BIEN==
S(CS=1)(S(I>1.000.000)(PRÉSTAMO))

## Proyección
+ P(L)(R)
> Proyección de la tabla R sobre la lista L
+ Genera una tabla donde se seleccionan las columnas de R que están en L.
+ Elimina duplicados
+ Puede reducir la anchura y posiblemente la profundidad

*1. Listar los DNI del los clientes*
P(DNI)(CLIENTES)

*2. Clientes de banco con préstamo y código de sucursal del mismo.*
P(DNI,CS)(PRESTAMO)

*3. Clientes con préstamo superior a 1.000.000 de euros*
P(DNI)(S(I>1.000.000)(PRÉSTAMO))

## Producto cartesiano
+ R x S
> Producto cartesiano de R con S
+ Se genera una tabla con todas las t-uplas al concatenar una de R con otra de S (primero los atributos de R y luego los de S) se usa el nombre de la tabla para saber a cual pertenece.

*1. Clientes que tienen prestamo grande en la laguna*
P(DNI)(S((CDS = 'La Laguna')^(I>10⁶)^(PRESTAMO.CS = SUCURUSAL.CS))(PRESTAMO X SUCURSAL))
==O BIEN==
S(I>10⁶)(PRESTAMO) X S(CDS = 'La Laguna')(SUCURSAL) 
*2. Ciudad en que residen los clientes que tienen alguna cuenta con mas de 10⁶*
P(CDC)(S((CLIENTE.DNI = CUENTA.DNI) ^ SLD(10⁶))(CLIENTE X CUENTA))
*3. DNI de los clientes con cuentas en al menos dos sucursales distintas*
P(A.dni)(S((A.dni = B.dni) ^ (A.cs != B.cs))(A X B))

siendo A = B = CUENTAS para mezclar una cuenta con todas, para revisar cada cuenta con todas y encontrar coincidencias, si se quisieran 3 cuentas en vez de 2 se deben comprobar A con B, A con C y  B con C. NO TODO JUNTO.
## Union
+ R U S
> Unión de R con S
+ Junta las t-uplas de R y S sin duplicados, ambas deben tener el mismo grado. El cardinal de la union es menor o igual a la suma de cardinales 
## Diferencia
R - S
> Todas las filas de R que no están en S

*1. Clientes que tienen un préstamo o una cuenta o ambas en la sucursal de código 1*
A = P(DNI)(S(CS=1)(PRESTAMO))
B = P(DNI)(S(CS=1)(CUENTA))
A U B

*2. Clientes que tienen un préstamo pero no una cuenta en la sucursal con codigo 1*
A - B

## Operadores derivados
### Interseción
+ $R \cap S$
> Todas las filas de R que están en S
+ S - (S - R) = R - (R -S)
*1. Sucursales con titulares de santa cruz y la laguna*
A = P(CS)(S((CDS=SC)^(Cuenta.dni = cliente.dni))(Cliente x cuenta))
B = P(CS)(S((CDS=LL)^(Cuenta.dni = cliente.dni))(Cliente x cuenta))
A$\cap$B

### Yunción
+ R Y(F) S
> Producto cartesiano entre R y S que satisfacen la función F
+ S(F)(RxS)
*1. Sucursales con titulares de santa cruz y la laguna*
A = P(CS)(Cliente Y(CDC=SC)^(Cliente.DNI = Cuenta.DNI) Cuenta)
### Yunción natural
+ R * S
> Asume la igualdad de valores que se llaman igual en ambas tablas para hacer la yunción
+ Si no tienen atributos comunes = RxS
+ Si todos son comunes = R$\cap$S
+ Relaciona correctamente las tablas
*1. Sucursales con titulares de santa cruz y la laguna*
A = P(CS)(S(CDC=SC)(Cuenta\*Cuenta))

*2. Clientes con prestamo superior a 1000 en alguna sucursal de la laguna*
P(DNI)(S((I>1000)^(CDC=LL))(Prestamo\*Sucursal))

*3. Ciudades con clientes con mas de 1000 en la cuenta*
P(CDC)(S(SLD > 1000)(Clientes\*Cuenta))

*4. Dni de clientes con cuenta en una sucursal en al ciudad que viven*
P(DNI)(S(CDC = CDC)(Cliente\*Cuenta\*Sucursal))
### Cociente
+ R/S
+ En R deben estar todos los atributos de S y alguno más
> Da lugar a las columnas de R que no están en S

*1. DNI de los clientes que tienen alguna cuenta en todas las sucursales de la laguna*
S = P(CS)(S(CDC=LaLaguna)(Sucursal))
R = P(DNI, CS)(Cuenta)
R/S

## Operaciones de actualización
...
## Propiedades
...

## Vistas
Un nombre asignado a una expresión algebraica.
Siempre están actualizadas.
Son más ligeras pero más lentas que las tablas.

Sirven para simplificar la formulación de expresiones complejas.
Protegen la confidencialidad del acceso a los datos.
Evitar efectos por cambios en el diseño.

Las vistas materializadas, al crearse la vista, ahora si, se almacena el contenido, ocupan espacio, básicamente son el punto medio entre las tablas y las vistas, también están permanentemente actualizadas

## Álgebra extendida
### Union externa
+ R UE S
> Operador que generaliza la union
+ Los atributos homonimos de R y S deben tener el mismo dominio
+ Permite unir cosas diferentes, añadiendo campos diferentes.

### Yunción natural externa
+ R YE S
+ Lo mismo que la yunción, añadiendo los operando que tengan ? en el atributo común o este no tiene valor en la otra tabla
### Yunción posibilista
+ R YP S
+ Yunción donde nulo es nulo o cualquier otro valor