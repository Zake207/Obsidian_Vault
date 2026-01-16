# Modelo Relacional
## Introducción
Todos los datos se representan con relaciones con tablas donde la filas son tuplas y las columnas los atributos, la relación es el producto cartesiano de los dominios de los atributos.
![[Pasted image 20251001133550.png]]

No admite filas duplicadas, el orden de estas es irrelevante y los atributos solo admiten valores del dominio

Tiene clave primaria (PRIMARY KEY), valores unicos (UNIQUE), obligatoriedad (NOT NULL) e integridad referencial.

Existen preferencias al trabajar con las claves foráneas

Para el caso de entidades débiles se hace referencia de la entidad fuerte en la tabla de la debil.

Los atributos calculados pueden no representarse y darse sobre la marcha o bien se puede añadir una columna extra, cada una tiene sus ventajas y desventajas.

### Relaciones
1:1 no generan tablas, solo se comparten atributos para referenciar a la otra tabla.

M:N genera otras tablas

### Relación de grado 3
+ N:N:N - Crea tabla 
+ 1:N:N - Crea tabla
+ 1:1:N - No crea tabla
### Restricciones semanticas
+ Totalidad - Parcialidad
+ Solapamiento - Exclusividad

Se pueden crear tablas para cada una de las entidades, solo para las subclases o solo para las super-entidades

### Restricciones CHECK
Definen los posibles valores que puede tomar una columna, el nombre de estas restricciones se generan automáticamente, se pueden asignar nombres especificos con la sentencia CONSTRAINT

**column_name data_type CONSTRAINT constraint_name CHECK(...)**

Si se desea añadir restricciones a una tabla *ya existente* 
**ALTER TABLE prices_list 
ADD CONSTRAINT price_discount_check 
CHECK (
	price > 0
	AND discount >= 0
	AND price > discount
);**

Para añadir atributos calculados
**CREATE TABLE people (
    ...,
    height_cm numeric,
    height_in numeric GENERATED ALWAYS AS (height_cm / 2.54) STORED
);**

Se pueden crear disparadores que ejecutan códigoal activarse un trigger
**CREATE TRIGGER emp_stamp BEFORE INSERT OR UPDATE ON emp
    FOR EACH ROW EXECUTE PROCEDURE emp_stamp();**

# Bases de Datos Relacionales
Son aquellas que almacenan los datos en tablas, lo demás se considera no relacional (jerarquica, red, etc...)

Actualmente en las tablas se estan forzando ciertos tipos se situaciones como guardar imágenes, elementos de texto grandes, transacciones complejas y demás...

Para mejorar esto existen las bases de datos orientadas a objetos, que permiten integración con las aplicaciones desarrolladas usando este paradigma, permitiendo dar persistencia a los objetos, donde existen:
+ Estado: definido por sus atributos
+ Comportamiento: definido por sus métodos

Esta estructura es ventajosa para bases de datos grandes o complejas.
![[Pasted image 20251015132322.png]]

Si se desea programar sin tener que involucrarse en la base de datos se usan ORM, estos sirven como capa intermedia que mapea los objetos en la base de datos. Estas herramientas permiten el evitar trabajar con sql, se pueden hacer consultas que entienda el ORM, para que este lo traduzca.

## TIPOS DE DATOS
Los array pueden ser un tipo de datos asignados a los atributos de una tabla (Ej. text\[\])

Tambien es posible diseñar nuestros propios tipos de datos

Existen los enum que son listas de valores fijos definidos dentro de la base de datos, esto permite evitar determinadas restricciones de tipo check

El tipo bytea me permite guardar objetos grandes como pdf o fotos, puede guardar hasta 1 GB de información, dicha inforacion es accedida a traves del oid
## HERENCIA
Permite la incorporación de campos de una tabla padre dentro de otra (hija), a la hora de hacer consultas se pueden hacer restricciones ONLY para evitar buscar en las tablas padre
## MULTIMEDIA
Hojas de exel, fotos, videos, pdf, etc...

Para solucionar esta problemática se incluyen tipos de datos complejos como json, xml y demás

