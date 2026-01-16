
[[2025-2026 ADBD 2.1 Diseño conceptual, lógico y físico. Modelo entidad-relación.pdf|Trasparencias]]
___

Los sistemas de información se crean cuando se le da semántica a los datos, ahí es donde se crean las bases de datos

Estas son una colección de datos relacionados entre sí, similar a los sistemas de ficheros, sin embargo estos últimos complican la gestion a largo plazo.

Otro método de almacenamiento de la información son los árboles,los cuales no son más que una especificación de una red.

Existen diferentes tipos de bases de datos en base a sus niveles.
+ Externo
+ Conceptual (Arquitectura AUSI SPARC)
+ Físico

Un **modelo de datos** permite describir una porción de todos los datos, dicha descripción se llama **esquema**, los datos recopilados en esa porción es la base de datos.

Los **modelos de datos** tienen diferentes tipos de operaciones:
+ Clasificación
+ Agregación
+ Generalización
+ Asociación

Tienen carácter dinámico (cambios en la DB tras cada actualización) y estática (dado que acepta ciertos datos y rechaza otros), además es importante declarar ciertas restricciones.

Pueden ser:
+ Físico
+ Lógico
+ Conceptual

El modelo conceptual es independiente de su implementación final
## Modelo Entidad-Relación
Existen objetos con nombre de *entidades* unidos entre sí mediante asociaciones llamadas *relaciones*

Las *entidades* son elementos almacenables en la BD
+ Fuertes: Tienen identificación propia
+ Débiles: Su existencia es dependiente de otra entidad

+ Concretas
+ Abstractas

Las entidades se diferencian entre sí por sus atributos, estos pueden tomar determinados valores (dominio), existe siempre uno identificativo y producen diferentes ocurrencias de una entidad.
+ Identificadores
+ Descriptores

![[Pasted image 20250917133334.png]]

Las *relaciones* tienen un grado que depende del número de participantes en la relación:

![[Pasted image 20250917134005.png]] 
grado 3

![[Pasted image 20250917134037.png]] 
grado 1

La cardinalidad puede ser binaria:
+ 1:1
+ 1:N
+ N:M

Ejemplos:
![[Pasted image 20250917134439.png]]
![[Pasted image 20250917134448.png]]
![[Pasted image 20250917134459.png]]

Para definir las cantidades y proporciones las relaciones se le añaden números en el opuesto de lo que se desea medir:
![[Pasted image 20250917135051.png]]

Las relaciones también pueden tener atributos, los cuales solo cobran valor en la relación al depender de las entidades participante.
![[Pasted image 20250924131520.png]]

Existen relaciones sobre mas de dos entidades
![[Pasted image 20250924133144.png]]
![[Pasted image 20250924133155.png]]
![[Pasted image 20250924133206.png]]
![[Pasted image 20250924133229.png]]

Además estas relaciones generan una jerarquías del siguiente tipo, las cuales pueden ser total, parcial, solapada y exclusiva:
![[Pasted image 20250924134723.png]]
![[Pasted image 20250924134825.png]]

