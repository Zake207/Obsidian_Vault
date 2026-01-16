# SQL
## Conceptos Básicos
+ Las keyword en mayusculas
+ Las sentencias se pueden dividir tanto como quieran
+ Todas las sentencias acaban en ;

### Operaciones
**SELECT** (**DISTINCT**/**UNIQUE**) \[] **FROM** \[] **AS** ...

Equivale a la proyección del álgebra relacional. Lo que se selecciona se puede modificar en la misma consulta (I * 1.1, por ejemplo)

En la clausula FROM se puede poner 
+ cross join b: hace el producto cartesiano
+ natural join: hace la yunción natural
+ inner join on \[]: Hace la yuncion en base al predicado 
+ inner join using \[]: Hace la yuncion estableciendo la igualdad de las columnas especificadas

**WHERE** permite especificar una clausula sobre la cual se muestran los resultados

A **BETWEEN** B permite especificar los valores que estan entre las dos expresiones

**(NOT) IN** da lo que este en determinado conjunto

**ANY** devuelve true si la expresion verifica la condicion con cualquier elemento del conjunto

**LIKE** permite definir formatos que deben seguir las salidas de las peticiones
**EXIST** devuelve verdadero si existe una fila en la tabla de resultado

Las subconsultas escalares devuelven una unica fila y una unica columna. Vectoriales se les llama a las que devuelven multiples columnas, y la matriciales devuelven multiples filas y columnas

**UNION** hace la union de las tablas de dos resultados, estas deben tener el mismo grado y formato de columnas identico, elimina duplicados, si se especifica un ALL no los elimina

**INTERSECT** Intersección entre dos tablas

**MINUS** Hace la diferencia entre dos tablas

**ORDER BY** Ordena los elementos de salida.

## Funciones de grupo
+ AVG - Calcula la media
+ COUNT - Cuenta 
+ SUM - Sumatorio
+ MAX - El máximo del grupo
+ MIN - El minimo del grupo
+ Variance - La varianza del grupo
+ STDDEV - Desviación tipica

Solo pueden aparecer en la clausula SELECT o HAVING

Hay que tener extremo cuidado a la hora de eliminar duplicados y filtrar información.

**GROUP BY** ordena por el atributo especificado.

**HAVING** es a los grupos lo que el WHERE es a las t-uplas, solo se puede usar despues del group by.

**INSERT INTO** TABLA **VALUES** (VALOR1, VALOR2)

**DELETE FROM** TABLA
**WHERE** CONDITION

**UPDATE** tabla
**SET** valores
**WHERE** condición
