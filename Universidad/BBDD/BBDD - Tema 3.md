# Calculo Relacional
Se basa en lógica de predicados
+ Basado en t-uplas
+ Basado en dominios
## Lógica de predicados
La base son los predicados que son sentencias verdaderas sobre las que se hacen operaciones.

+ Implicación $P\to Q$
+ Equivalencia $P\Longleftrightarrow Q$
+ Tautología (siempre es verdadera)

Equivalencias lógicas
$P \land V \iff P$
$P \lor F \iff P$ 

*revisar diapos para mas equivalencias*

las variables representan filas de la tabla

$t_n / P(+)$ Toda fila de grado n de la tabla que cumple con P (todo los predicados P deben estar planificadas)
*1. DNI de clientes con préstamo superior a 1000 euros*
P(DNI)(S(I>1000)(Prestamo)) == $t_{1} / (\exists p) (p[I] > 1000) ^ (t[DNI] = p[DNI])$
teniendo p un dominio en la tabla prestamo

*2. DNI de los clientes ... con codigo de sucursal 1*
$t_{1} / (\exists p) ((t[DNI] = p[DNI]) ^ (p[S] = 1) ^ (p[I] > 1000 ))$

*3. Clientes con un prestamo grande en alguna sucursal de la laguna*
P(DNI)(S((I > 1000) ^ (CDS = LaLaguna))(Prestamo x Sucursal))
dominio p = prestamo, 
dominio s = Sucursal
$t_{1} / (\exists p,s)((p[I] > 1000) \land (p[CS] == s[CS]) \land (s[CDS] == LaLaguna))$

*DNI de los clientes con cuentas en al menos dos sucursales distintas*
C1=C2=Cuenta
P(DNI)(S((C1.DNI == C2.DNI) ^ (C1.CS != C2.CS))(C1 x C2))
$t_{1} / \exists c_{1},c_{2} ((t[DNI] == c_{1}[DNI]) \land (c_{1}[DNI] == c_{2}[DNI]) \land (c_{1}[CS] \neq c_{2}[CS]) )$

*SIGUIENTE*
dom d = CLIENTE
dom c = CUENTA
dom s = SUCURSAL

$t_{1} / \exists d (t[DNI] == d[DNI]) \land (\exists c) (c[DNI] == d[DNI]) \land (s[CS] == c[CS]) \land (s[CDS] == d[CDS])$

*SIGUIENTE*
dom c = cuenta
dom p = prestamo
> [!WARNING]
> NO SE PUEDEN ABREVIAR LAS COSAS EN CALCULO

$t_{1} / (\exists p) ((t[DNI] == p[DNI]) \land (p[CS] == 1)) \lor (\exists c) ((c[DNI] == T[DNI]) \land (c[CS] == 1)$
preguntar si esta bien

*DNI DE LOS CLIENTES CON CUENTA EN TODAS LAS SUCURSALES DE LA LAGUNA*
A = P(CS)(S(S.CDS == 'LA LAGUNA')(SUCURSAL))
B = P(DNI, CS)(CUENTA) 
B/A

dom s SUCURSAL
dom c CUENTA

$t_{1} / (\forall s) (s[CDS] != lalaguna) \lor ((\exists c)(t[DNI] == c[DNI]) \land (c[CS] == s[CS]))$

*DNI DE CLIENTE CON MENOR SALDO*
dom c1 = dom c2 = CUENTA

$t_{1} / (\exists c_{1})(t_{1}[DNI] = c_{1}[DNI]) \land (\forall c_{2})(c_{2}[SLD] \geq c_{1}[SLD])$

*DNI CON MENOR SALDO EN LA SUCURSAL CON CODIGO 1*
dom c1 = dom c2 = CUENTA
dom s = SUCURSAL

$t_{1} / (\exists c_{1})(t_{1}[DNI] = c_{1}[DNI]) \land (c_{1}[CS] = 1) \land (\forall c_{2})(c_{2}[SLD] \geq c_{1}[SLD]) \lor (c_{2}[CS] \neq 1)$

## Calculo restringido de t-uplas
Tienen la forma: $e \notin TABLA$ y no se suelen usar porque no son expresiones seguras o sanas, tienen una expresión algebraica equivalente.

La union es un t que pertenece tanto a S como a R
La - es un t que pertenece a S pero no a R
R x S es, existe una variable x en el que x y t tienen el mismo atributo en una tabla y un z en la otra tabla que tiene los mismos atributos

P(L)(R) $t_{1} / (\exists x)(t_{1}[L] = x[L])$
S(F)(R) $t_{1} / (t \in R \land (F))$

La conclusion es que si se puede hacer en algebra se puede hacer en calculo y viceversa.

El **calculo relacional de t-uplas** tiene predicados formados por átomos y operadores y tienen las siguientes reglas:
+ Un átomo es un predicado
+ Todas las variables deben estar cuantificados menos la variable libre

El **cálculo relacional de dominios**, sus variables representan dominios de un atributo de la tabla, tienen el siguiente aspecto $\{ <x_{1}, \dots, x_{n}> / P(x_{1}, \dots, x_{n}) \}$ y tiene las 