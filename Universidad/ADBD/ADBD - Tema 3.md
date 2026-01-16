# Sistema Gestor
## Definición
Cuenta con diferentes componentes vitales para su funcionamiento.
+ Motor de almacenamiento
+ Procesador de consultas
+ Gestor de transacciones

A la hora de realizar consultas
![[Pasted image 20251105131805.png]]

Sabiendo esto se pueden definir estructuras de organización y funcionamiento del sistema gestor:
+ **Una capa** Todas las partes nombradas se encuentran al mismo nivel, no hay separación física ni lógica y se usan en modelos simples.
+ **Dos capas** Separa la interfaz del usuario del servidor de la base de datos permitiendo dividir tareas, esta presenta limitaciones en escalabilidad y capacidad de usuarios.
+ **Tres capas** Separa Cliente-Servidor-Database, donde el servidor intermedio gestiona las operaciones entre el cliente y el sistema gestor, aumenta el rendimiento, capacidad, flexibilidad.
+ **Microservicios** En vez de una capa intermedia hay dos: API y un gestor de servicios, donde cada microservicio gestiona acciones específica sobre diferentes bases de datos

Posgres tiene tres tipos de procesos:
+ Primario
+ Por conexion
+ Utilidad

## Procesamiento de consultas
Una transacción es una operación atómica y debe cumplir los principios ACID.
+ **Atomicidad**
+ **Consistencia**
+ **Aislamiento**
+ **Durabilidad**

## Sistema de Caché
Guarda en RAM el resultado de consultas realizadas anteriormente, esto acelera las consultas posteriores.

Usa ciertas metricas clave
+ Hit
+ TTL
+ Hit Ratio
+ Efectos del TTL

Para mantener cierto espacio en la caché se usan políticas de reemplazo:
+ LRU
+ LFU
+ FIFO
+ Capacidad fija

## Big Data
## Replicación, partición y fragmentación
