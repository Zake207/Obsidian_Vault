## Programación imperativa
Ensamblador, procedural, estructurada, OOP, concurrente y paralela.
### Nivel 1 - Máquina
En la arquitectura de Von Newmann comprende la cpu (unidad de control con una serie de registros) y memoria (celdas con direcciones de memoria). Aquí se trabaja con el lenguaje máquina (0s y 1s).

### Nivel 2 - Ensamblador
El siguiente paso de abstracción usando el lenguaje ensamblador, este usa la memoria de programa y la memoria de datos, dividiendo en estos dos grupos la memoria, ademas de unos registros especiales llamados program counter (pc), que se mueve por la memoria de programa, y stack pointer (sp), que se mueve por la memoria de datos, se trabaja con instrucciones.

### Nivel 3 - Procedural
Al abstraerse, mediante subprogramas y estructuras de datos, se llegan a los lenguajes procedurales, el cual compila bajo ciertos labels un conjunto de instrucciones que realizan instrucciones mas complejas (suma, resta, etc...), además los datos se estructuran en estáticos, pila y head(montón). La pila en concreto se divide en una serie de registros de activación (valor a devolver, parámetros, zona de control, variables locales, variables temporales).

#### Ejemplo explicativo
En un void func(), no se crean las estrucuras de parametros ni valor a devolver, si se inicializan variables dentro de esta irían a la zona de variables locales, si dentro de esta se llamara a otra función (int sum(int a, int b)).

El registro de control de sum apuntará a func, pues es la que la llamó, mientras que la zona de control de func no apunta a ningun lado pues es la iniciadora *preguntar esto último*. 

En todo este proceso, suma guarda variables temporales con el valor de los parámetros

### Nivel 4 - Estructurada
Resuelve el problema fundamental de la programación estructurada, Djisktra no recomendaba el anterior método debido al GO TO statement.
Usa variables y sentencias(subprogramas más complejos)
### Nivel 5 - Paralela y Concurrente
Posee varios flujos de ejecución
### Nivel 6 - POO
Se agrupan las variables y subprogramas en objetos.

## Ruby
Es un lenguaje interpretado y completamente orientada a objeto, imperativo.

**comentarios y funciones**
```ruby title=example.ru
# comentario de una linea

=begin
Comentario 
de varias
lineas
=end
def myfunc(str)
	puts "Hola!#{str}"
end

def myotherfunc()
	puts "bye bye"
end

myfunc("Mundo")
myotherfunc()
myotherfunc
```

**Variables**
+ Local - lowercaseletter and underscores
+ Instancias - @ (ámbito de clase)
+ Varaibles de clase - @@
+ Globales - $

**Arrays**
+ Array.new
+ \[\]
+ \["a", "b"\] - una con cadenas dobles permiten cambios en esta
+ %w\[a b c\]

**Estructuras**
if ...
ifelse...

case
when a > 5 puts "#{a} is greater than 5"
when ...
...
end

until *expression*
	....
end

regex = /chapter_\d+/i

---
Llamamos subprograma/metodos a todo bloque def ... end, dado que la palabra función tiene otra connotación diferente.

Teniendo varias ramas sin fusionar, si se desea empujar todo al repo remoto se ejecuta *git push --all*

Si hubieran conflictos a la hora de fusionar dos ramas, git anota los conflictos dentro de los ficheros, hay que solucionar los conflictos editando el fichero, despues de eso hacer un git add commit y push y listo, solo queda hacer un merge con la main original y la nueva.
___
Orden descendente de abstracción tenemos a los lenguajes declarativos y luego los imperativos, estos mediante interpretes o traductores se pasan a lenguaje ensamblador/máquina. Todo esto trabaja con programas en pasivo, al ejecutarlos pasan a estar activos (procesos).

**Secuencial**
	Al comenzar un proceso esta en estado de inicio, al asignarle recursos como el program counter memoria y demás pasa a estar listo, después se le asigna tiempo de cpu para estar en ejecución y alterna entre estas dos ultimas hasta terminar (terminador). Puede estar bloqueado hasta que no ocurra determinado evento.
**Hilos**
	Todos los procesos hijos (ligeros) comparten recursos con el proceso padre, al cual se le asignaron recursos en un inicio.
**Paralelos**
	Los procesos se ejecutan en diferentes unidades de computo, existiendo un paso de mensajes entre ellos y una memoria compartida para todos los procesos.
**Distribuido**
	Un tipo de paralelo que se ejecuta a través de sockets RMI.


Secuencial en Ruby: una sentencia detrás de otra
Concurrente en Ruby: Un hilo para cada sentencia

Condiciones de **Berstein** cada sentencia se define como un conjunto de variable a las que se acceden (de lectura y de escritura). Se debe verificar que dos sentencias se pueden ejecutar se comprueba que no hay coincidencias entre sus conjuntos (sus intersecciones dan nulo, menos la de las dos lecturas, que son irrelevantes).
1. a = x + y; L_1={x,y}; E_1={a};
2. b = z + 1; L_2={z}; E_2={b};
3. c = a + b; L_3={a,b}; E_3={c}
4. d = c - 1; L_4={c}; E_4={d}

1 Se ejecuta.
2, 3, 4 revisa $L_{1}\cap E_{2}$ $L_{2}\cap E_{1}$ $E_{1}\cap E_{2}$ y todos deben dar vacío.
3, 4 revisan si pueden ejecutarse con 2.
4 revisa si puede ejecutarse con 3.

Dado que 3 no se puede ejecutar con la 1 y 2, 4 no se puede ejecutar con 3 por lo que da igual si se ejecuta 1 o 2 primero, pero siempre deben calcularse antes que 3 y este antes que 4. Esto es no determinista.

Si hay una sentencia del tipo x = x + 1 se transformará en una serie de instrucciones
MOV x R
ADD \#1 R
MOV R x

Una condición de carrera *que es? preguntar indeterminista* 

**RSpec** lenguaje de dominio específico, permite desarrollar con la metodología TDD

Programación con TDD
```
context "algo"
	it "algo algo" do
		expect(algo).to_eq(otro algo)
	end
end
```

*PEDIR TUTORIA ==> CONDICIÓN DE CARRERA*

## Hilos
La sentencia Thread permite iniciar diferentes hilos de ejecución, estas se almacenan en variables y se ejecutan con un .join.

No se usa el mismo estilo de programación si se usa por ejemplo un .each (una función) que un for (sentencia)

Para evitar que varios procesos accedan a las mismas instrucciones creando la condicion de carrera se arregla con mutex.lock o con sychronize, con resource.wait y .signal se pueden comunicar recursos para avisar y ceder recursos, eso se llama secuencialización.

## Biblioteca y gemas
Las bibliotecas son un conjunto de métodos y código de Ruby
Las gemas son bibliotecas externas que se instalan con geminstally se usan en codigo mediante la sentencia require, todas estas se publican en RubyGems.org

Bundler es una gema que gestiona y mantiene las dependencias, se llama ejecutando bundle gem/install \<name>, para todas las preguntas se responde no para la version más simple. Los datos de la gema se almacenan en un fichero .gemspec, en la cual se pueden añadir dependencias.

Una vez instalada crea un GemFile.lock que permite no tener que volver a install.

Dentro de los ficheros creados se instancias diferentes fragmentos de código, al igual que tests y demás

## Clases
La sobre carga de operadores tiene esta pinta
```rb title=example.rb
def +(value) 
	Point.new(x + value, y + value)
end

def +(value) 
	Point.new(x + value.x, y + value.y)
end

def -@
	Point.new(-x, -y)
end
```
Se pueden almacenar datos generales en la clase como tal, no como instancia

```rb title=example.rb
class Point
	@@var = 7
	def self.func
		puts @@var
	end
	# CONSTANTE
	ORIGIN = Point.new(0,0)
end
```

También se pueden hacer herencias de clases
Todas las clases creadas por el usuario y en general de Ruby acaban heredando en ultima instancia de Object que hereda de BasicObject

En lib se almacena un directorio de la gema con su código dentro y un fichero gema.rb con el mismo nombre de la gema

En la rama guard, se crea un fichero guardfile
el gema.gemspec se añaden las dependecias de desarrollo este genera el gemfile y el gemfile.lock

bundle exec guard init genera el fichero el Guardfile.
bundle exec guard ejecuta guard bajo el control de bundler
usar guard: hay que añadirlo primero al gemspec, generar el guard file y ya puedes empezar a usarla


También se deben usar generadores automáticos de documentación, al terminar el codigo se debe crear una rama doc en la que se modifica el gitignore para que suba la documentación. En el gemspec debería estar la gema yard, bundle exec yard ejecuta yard y genera la documentación de manera automática.

Hay que hacer pruebas de TODO TIPO
## Modulos
No se pueden instanciar (no se les puede hacer .new), hay dos tipos diferentes de modulo:
+ Permiten crear espacios de nombre
+ Permiten simular herencia múltiple

Si en dos modulos se definen dos funciones con el mismo nombre se usara la que esta mas abajo en los require:
```rb title=example.rb
require 'a'
require 'b' # <- Se usará la definicion de este modulo
```

Para resolver esto se deben usar los operadores :: con el nombre del modulo, como en c++, sin embargo si se desea usar un método de una clase sin tener declarado un objeto de la misma, se debe hacer lo siguiente: *Modulo::Clase.new.método*

Con la sentencia include se puede hacer una simulación de herencia multiple, no hay herencia pero puedes usar los metodos del modulo que nombre el include.

Para hacer que una clase sea comparable, podrá usar los métodos del modulo comparable, se debe incluir el modulo Comparable dentro de dicha clase para definir el método <=> dentro de la clase a comparar, se usan directamente tras definir el operador <=>

Para definir el .each de nuestra clase se deben hacer declaraciones sobre el orden con el se quiere operar con los atributos, con yield @attr

El operador de acceso se define con un case when y se analizan las posibles entradas.

Para poder operar de manera conmutativa con los operadores se debe definir el metodo coerce
```rb title=example.rb
def coerce(other)
	[self, other]
end
```

de esta manera al definir el operador de multiplicación por ejemplo, no hay que tener un orden obligatorio, este metodo permite colocar primero al objeto (3 * Point no dará error)

RUBY BUSCA DE ABAJO PARA ARRIBA LA PRIMERA DEFINICION DEL OPERADOR
por esto si se define el <=> y luego el == usara la segunda definición 

*Qué es la sentencia rescue?*

Tambien se pueden crear clases con struc y modificar esta "abriendola" con class Clase, para por ejemplo definir métodos, métodos que no deberían romper el principio de encapsulamiento (duplicando la instancia para operar con self.dup) y si lo rompen deberían avisar con un ! al final del nombre del metodo.

Los interpretes de ruby implementan los objetos mediante estructuras de datos, donde se guardan flags, la clase y instance var. Las clases son un poco más complejas, se guardan flags, class, instace var y los instance methods, estos diagramas de clases se representan con los mismos diagramas de bases de datos en el modelo relacional.

Un metodo singleton se define solo para una objeto. Estos crean una clase anonima, al que apunta el diagrama del objeto, donde ahora cuenta con el método singleton.

```rb
obj = MyClass.new()

def obj.metodo_songleton
	return "metodo singleton"
end
##################################
def MyClass.method1
	return 1
end
##################################
def self.method2
	return 2
end
```

Al final de esto se crea la clase anonima, llamada eigenclass, que es a donde apunta la instacia de nuestro objeto con metodo singleton
*Que es la singleton Class?*
## Métodos lookup
Se busca entre los método definidos en la eigenclass del objeto, en el caso de que no esté se busca en los metodos de instancia de la clase del objeto, si tampoco está se busca en los módulos incluidos en la clase del objeto, si aún no lo encuentra se repiten los pasos 2 y 3 hasta que se encuentra en el final de la jerarquía, mirando en la superclase de la clase del objeto. Si no se ha encontrado cambia el metodo llamado por *method_mising*, y pasa a buscar a este desde el principio.

Si hay varios includes busca desde el ultimo por la derecha hacia la izquierda, el último incluido.

**PREGUNTA DE EXAMEN**

En \/lib están las clases con su jerarquía de clases (en "modelo relacional"). Nuestras clases también se definen aquí, con su jerarquía donde la clase más alta en esta apunta, desde su campo superclase hacia la clase Object y este a BasicObject. Todos son de la clase Class.

**LOS OBJETOS SON LAS INSTANCIAS (LAS QUE SE CLEAN CON NEW), Y LOS QUE SE CREAN CON CLASS SON CLASES**

Todo metodo de clase es un metodo singleton de la clase. Cuando se crea una clase anonima, la superclase de esta es la clase anonima de la superclase de la clase.

Los modulos no tienen eigenclass.

**Los circulos que representan objetos tienen un campo para atributos y métodos y otro campo class, el cual apunta a su clase, los cuadrados de clases tienen un campo superclase, un campo class que apunta a su clase anonimo de la cual, la superclase es class**

**Cuidado, que eso es la superclase de la clase anonima, la de la clase principal es Object**

Cuando el interprete de ruby detecta un include comparable por ejemplo dentro de una clase, este crea una clase anónima que tiene como superclase Object, esta clase anonima pasa a ser la superclase de la clase en la que se escribió. Si se hace mas de un include se crean varias clases anónimas, estas tiene superclase otra de las clases anónimas creadas en los include, a modo de pila, la ultima acaba teniendo como superclase Object.

**Busqueda de constantes** se hace en ámbito léxico, no cuando se ejecuta. El valor de las constantes viene determinado de una búsqueda en vertical, la primera coincidencia que encuentre, ya sea en definiciones locales o en includes, es que persiste. Si dentro de un modulo se crea una clase que tiene un include, el valor de la constante sera primero el de la clase, luego el del módulo y finalmente el de los includes, despues de eso la super clase de la clase, luego el ambito global y finalmente i hay algo definido en algun modulo que no se incluye ni nada se modifica con el valor que se le da a ese módulo.

Una variable de clase se define con @@var y son compartidas por todos las instacias de la clase. Los métodos de clase se crean con *def class.method* o con *def self.method* o también abriendo la clase: *class << self \n def method ... end*
Para hacer metodos de instancia se accede a la clase pero si se desea acceder a los métodos de clase se accede a la clase anónima.

Existen variables de instancias de la clase, que se crean fuera de los metodos de instancia que no son accesibles a través de estos.


