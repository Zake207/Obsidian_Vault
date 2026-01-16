# Introducción
[[Tema 1 - Introducción bases de datos.pdf]]
## Motivación de las BBDD
Las bases de datos se crean debido a que el sistema de ficheros estándar usado para guardar información se queda obsoleto, dato que provocan una redundancia e inconsistencia de los datos, dificultaba el acceso a la información y los aislaba. Los datos no se actualizaban los datos de manera correcta por lo que había incoherencias entre datos que deberían ser exactamente iguales.

A esto se le suman dificultades en la supervisión, integridad (no cumplían condiciones de integridad), atomicidad y restructuración.

## Bases de datos
Sistema orientada a datos que permiten manejar grandes volúmenes de datos, estos se almacenan en bases de datos.

Los sistemas gestores de bases de datos se encargan de la creación, acceso y actualización de bases de datos, estas operaciones se agrupan en tres categorías:
+ Descripción
+ Manipulación
+ Control

El sistema gestor sirve como intermediario entre la aplicación y la base de datos. 
+ Visión abstracta de la base de datos (nivel físico, conceptual y externo).
+ Capacidad de modificar el esquema sin afectar a la definición de niveles superiores (independencia física y lógica).

El esquema conceptual define los datos de manera abstracta, al implementar este se obtiene el esquema derivado

Las bases de datos usan diferentes tipos de árboles multi-caminos.

Las transacciones son operaciones átomo desde el punto de vista de la base de datos.
## Modelo de datos
Lenguaje con el que se describe el modelo conceptual, esta descripción se le llama esquema conceptual, se puede resumir como un conjunto de herramientas conceptuales que describen relaciones semánticas y condiciones de integridad de los datos. **El resultado debe ser un fiel reflejo** sobre el esquema se aplica un ddl para generar el esquema canónico.
+ Estructuras de datos
+ Operadores sobre las estructuras
+ Reglas de integridad

Existen dos tipos de modelos de datos:
+ Lógicos (basados en objetos, basados en registro)
+ Físicos (en desuso)

### Modelo entidad relación
Describe la realidad a través de una serie de objetos (entidades) y las relaciones entre ellos (relaciones), se crea iterativamente. Estos diagramas cuentan con diferentes elementos:
+ **Rectángulos** Entidades
+ **Elipses** Atributos de las entidades
+ **Rombos** Relaciones entre entidades
+ **Ligas** Conectan atributos entre entidades y entidades con relaciones

Las relaciones tiene cardinalidades (1-1, 1-N, N-1, N-M)

Las entidades débiles se representan con doble rectángulo y doble rombo de la que dependen, si tienen un atributo que no es identificativo se subraya con discontinua el nombre del atributo.
### Modelo relacional
Las entidades y relaciones ser representan mediante tablas, arreglos bidimensionales donde:
+ Las columnas almacenan los valores de un atributo
+ Las filas se llaman t-uplas y representan una asociación de valores con algún tipo de significado.
## Diseños
### \#1
Tablas:
CLIENTE(*DNI*, NBC, CDC)
CUENTA(*CS, NC*, SLD)
POSEE_C(DNI, CS, NC)

La tabla POSEE_C contiene a los clientes identificados con su dni, su respectivo número de cuenta y la cantidad que almacena en ella, al tener el DNI como clave primaria restringe al usuario a tener una cuenta (1:1), en cambio si se cogiese el CS permite al usuario tener varias cuentas en diferentes sucursales.

*Una base de datos normalizada es fácil de modificar, no supone trabajo para el sistema gestor, sin embargo complica más las consultas, esta base de datos está normalizada.*
### \#2
Tablas
CLIENTE(*DNI*, NBC, CDC)
CUENTA(*CS, NC, DNI,* SLD)

En esta tabla hay más redundancia, es una *desnormalización* del diseño anterio y sigue siendo válido. Invierte los problemas, vuelve más fáciles las consultas pero complica tareas del sistema gestor.

### \#3
CLIENTE(*DNI*, NBC, CDC, *CS, NC*)
CUENTA(*CS, NC,* SLD)

Similar al anterior, un poco menos normalizado
### \#4
BANCO(*DNI, CS, NC,* NBC, CDC, SLD)

El que mayor redundancia tiene pues se repiten demasiados datos en cada registro de cuenta de cada usuario, es válido pero es el más complejo de modificar, también es el mejor para hacer consultas
### Conclusión
Todos son diseños válidos, sin embargo para determinados escenarios es mejor uno que otro, en bancos son de uso preferente los diseños altamente normalizados, dado que son de fácil y rápida actualización.

Como buena práctica se recomienda que los atributos que representen elementos de otra tabla tenga el mismo nombre en las dos.

Si en el diseño 3 en vez de cs, nc en clientes se pone sld, no permite relacionar correctamente las dos tablas por lo que el diseño pasa a ser inválido.

Desarrollemos el diseño 2
CLIENTE(*DNI*, NBC, CDC)
CUENTA(*CS, NC, DNI,* SLD)
PRÉSTAMO (*CS, NP, DNI,* I)
SUCURSAL (*CS,* NBS, CDS)

### Leguajes de bases de datos
DDL - Data Definition Language
DML - Data Manipulation Language
DCL - Data Control Language

#### DDL
Especifica el esquema de la base de datos
Realizan tareas relativas a la estructura lógica
Su ejecución actualiza el diccionario o directorio de datos
#### DML
Otorgan acceso a los datos (Consulta, inserción, modificación, eliminación).
+ Procedimental(especificar la secuencia de pasos *Algebra realcional*) o declarativo (solo hay que especificar los lenguajes que se desean *Calculo relacional*)
+ Conversacionales (Interactivo, uso de terminal) o diferido (las sentencias se agrupan formando un programa)
+ Huesped (Si las secuencias se empotran en un lenguaje de proposito general como C, Python) o indepentdientes en caso contrario
### Procesamiento
+ OLTP: Procesamiento de transacciones, principalmente de actualización, trabajo del dia a dia, se usan con relaciones fuertemente normalizadas
+ OLAP: Procesamiento analítico, predominan las consultas, a veces hacen inserciones incrementales, Cubos OLAP (bases de datos multidimensionales)
### Operadores
Operadores de los programas de aplicaciones (OLTP)
Desarrolladores de programas de apliaciones
Administradores de la BD
Analistas de Datos (OLAP)
### Estructuras
Gestor de almacenamiento
Procesador de consultas
### Arquitecturas
Cliente servidor de dos capas (Programa cliente se comunica con el servidor directamente)
Cliente servidor de tres capas (Programa cliente funciona con frontent/formularios)

## Modelo Relacional
Consiste en una serie de tabla/relaciones (arreglos bidimensionales) con un número finito de filas y columnas, todas distintas, con orden irrelevante en las filas pero importante en las columnas.

**T-uplas** Asociación entre un conjunto de valores

Cada atributo tiene asociado un dominio y se asume que son atómicos

Lo interesante es el esquema de la tabla (intención) y su contenido (extensión), los dominio de un atributo pueden ser cualitativo o cuantitativo, al esquema lo componen cada uno de los esquemas de cada tabla, las t-uplas se relacionan al compartir atributos

Las t-uplas definen su grado en función del numero de elemetos que tiene una t-upla, las tuplas son iguales si lo son todos sus componentes.

Una superclave es un conjunto de atributos que permite identificar de manera univoca cada fila, son condiciones de integridad, mejor es cuanto menor cantidad de atributos pertenezcan a la superclave.

*Preguntar sobre minimal en el sentido de inclusión de conjuntos*

Integridad referencial, se crean algunas acciones compensatorias para conservar la coherencia al actualizar una fila en la tabla padre (borrado en cascada o propagar modificaciones en cascada)

Componentes del modelo relacional de datos: Estructura de datos, operadores y condiciones de integridad
