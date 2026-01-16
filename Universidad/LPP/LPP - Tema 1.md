# Teoría
## Conceptos básicos
### Modelos
Un modelo se plantea para abordar un problema, el cual se resuelve usando un algortimo.

Mediante formalización se usa un lenguaje a modo de notación para plantear dicho algoritmo en un programa.
### Lenguajes de alto nivel
+ Declarativos: Usan funciones o reglas
+ Imperativos: Pueden usar la lógica de Von Newmann, objetos y concurrente paralelos
### Lenguajes de bajo nivel
Se escriben directamente las instrucciones que interpreta la máquina
### Lenguaje
+ No requiere conocimiento del usuario de código máquina
+ Independiente de la máquina
+ Genera instrucciones
+ Emplea una notación lo más cercana posible a la del problema

El pensamiento computacional $\neq$ programación informática
### Compiladores
+ Compilador: traduce de alto nivel a bajo nivel.
+ Interprete: Traduce directamente en proceso sin pasos intermedios.
+ Transpilador: Traduce lenguajes en el mismo nivel.
### IDE
Con un editor y un sistema de control de versiones se crea el código fuente, este puede se pasado al compilador que tras una serie de pasos genera el programa objetivo.

Todas estas herramientas son congregadas en un entorno iterado de desarrollo (IDE)

El compilador cuenta con varias fases.
+ Análisis léxico
+ Análisis sintáctico 
+ Análisis semántico (ámbito y tipo)
+ Generación de código intermedio
+ Generación de código
+ Optimización

Los primeros tres pasos forman parte de la fase de análisis, donde se crean los token (unidades mínimas)

Los tres últimos son parte de la fase de síntesis, donde traduce el código a lenguaje máquina.
## Control de versiones
Han existido diferentes tipos de sistemas de control de versiones (locales, centralizados, distribuido), **Git** es de tipo distribuido, el cual usa diferentes comandos para operar. Su configuración se guarda en un fichero llamado en .gitconfig

Hay dos ficheros de este tipo, uno en el home del usuario, para cambios relacionados con este y uno en el directorio \/etc para hacer configuraciones globales que afectan a todos los usuarios.

El directorio de .git dentro de un repositorio guarda las diferentes versiones a las que se ha sometido el repositorio.

En un repo los ficheros sometidos a control de versiones tienen varios estados:
+ Stayed - Cuando se hace el git add y se les añade al .git
+ Commited - Cuando se les hace el git commit
+ Modified - Cuando tienen cambios no registrados hechos con el editor

Un fichero bajo control de versiones, al hacer un *git add* de dicho fichero, e guarda una representación de dicho fichero en forma de clave llamado **blob** Estos se almacenan en *.git* en forma de árbol. Cada cambio registrado crea un árbol que apunta hacia los ficheros cambiados.

Como este árbol apunta a los ficheros cambiados, aquellos que no se modificaron el nuevo árbol apunta hacia la última instancia de estos en árboles anteriores *Foto de esto en mi chat de Whatsapp*

Al hacer git log, todas las confirmaciones, las cuales son los cambios (cada uno de los árboles que apuntan a los cambios generados) commited

Una **rama** es un puntero hacia una confirmación, el puntero **main** es una rama que apunta hacia la confirmación principal, el puntero **head** apunta siempre a la confirmación que esta a la cabeza.

Con **git branch** se crea una rama adicional, si hacemos **git checkout** a esta rama head pasará a apuntar a dicha rama. Si tras editar ficheros en esta rama auxiliar haces **git checkout** main, recuperas los ficheros en main. Con **git merge** tras hacer esto fusionas los cambios entre la rama en la que estas y la rama a la que apunta head. En este momento puedes borrar el puntero a a nueva rama porque a esta ya esta apuntando main. Es una fusion sin conflicto (fastforward)

Si se fusionaran ramas paralelas, esto es una fusión confirmada, si no hay conflictos se hará la fusión.

Una confirmación guarda los cambios en la rama maestra, lo correcto es para cada fase del proyecto crear una rama que se identifique como la fase del proyecto en la que se encuentra, al finalizar cada fase se hace merge de la rama.

Con dos ramas a fusionar:
+ git checkout main; git merge \[rama1\] - FastForwardFusion
+ git checkout main; git merge \[rama2\] - ConfirmedFusion

Denotar que tras finalizar de manera segura las operaciones se deben borrar los punteros a ramas adicionales.

Una reorganización es diferente, usa *git rebase*, suponiendo el escenario anterior de dos ramas paralelas se hace:
+ git checkout main; git merge \[rama1\] - FastForwardFusion
+ git rebase \[rama2\] - rebase desde el nuevo main

De esta manera se nos queda igual una misma linea, habiendo creado una copia de rama2 que sigue desde el main ubicado al final de rama1, a la que apunta el puntero de rama2.

Con git remote add \[name\] URL se entrega en el repo remoto, de esta manera se crea un camino del local al remoto, lo inverso se logra con git clone, este camino siempre se va a llamar origin, este caso hay dos ramas que apuntan al main (main y origin/main).
+ Las ramas remotas se cambian con push
+ Las ramas locales se cambian con add; commit

Si quisieras avanzar la origin/main debes hacer un push
Con git checkout -b volver \[código de la rama\] creas una rama en ese commit

