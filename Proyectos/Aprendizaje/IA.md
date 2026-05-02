# Conceptos básicos
## Definiciones
### Tensor
Es una matriz numérica multidimensional, todo se transforma en un *tensor* para que la ia trabaje con estos datos transformados haciendo operaciones con ellos.

Las GPU están diseñadas para hacer operaciones con estas matrices por lo que son más eficientes que una CPU.
### Gradiente
La ia cuenta con unos parametros internos llamados *pesos* los cuales debe ajustar para minimizar la función L, la cual es una función que mide el grado de discrepancia entre la predicción del modelo y la realidad.

Para minimizarlos usa una aplicación de la regla de la cadena del cálculo diferencia llamada *backpropagation*.

El gradiente descendente es el algoritmo de actualización de pesos:
$$w_{new} = w_{old} - \eta \cdot \nabla L(w_{old})$$

Donde $\eta$ es el radio de aprendizaje.
### Arquitectura Transformer (BERT)
Es un modelo bidireccional de *Self Attention*, esto es, evalúa la relevancia de cada palabra teniendo en cuenta las palabras que la rodean, al ser bidireccional analiza simultáneamente la palabra de la izquierda y la de la derecha.

Está especializado en procesar secuencias y comprender lenguajes. 

### Fine Tuning
Ajuste Fino. Es el proceso de modificar la red neuronal de una inteligencia artificial para enseñarle a hacer algo que no sabía. Económico en tiempo y dinero.

### Capa convulsional
Es una capa de las inteligencias artificiales como otra cualquiera pero especializada en el reconocimiento de patrones visuales, una capa convencional es más torpe en este tipo de operaciones.
*Véase los tipos de capa existentes y su funcionamiento*

A mayor cantidad de capas, mayor capacidad de realizar tareas complejas/abstractas, aunque más no siempre signifique mejor, elegir la mal la cantidad de capas de una ia puede causar:
+ *Overfitting*: una red demasiado compleja para un problema simple memoriza los datos de entrenamiento en lugar de aprender, además de incrementar el coste computacional y diluir la dispersión del gradiente calculado con la *backpropagation*. Este problema se ve cuando el entrenamiento tiene mucho éxito pero con datos nuevos se reduce ese porcentaje.

Para estimar la cantidad de capas que una ia debe tener existen métodos como:
+ *Benchamrking* -> Copiar soluciones de problemas similares en sitios como Papers with Code
+ *Transfer Learning* Adaptar un red existente a la tuya
+ *Regla de la Navaja de Ockham* Empezar con una red simple y aumentar su complejidad en la medida de lo necesario
+ *Hyperparameter Tuning* Usar Optuna o Ray Tune para probar diferentes profundidades y decir cual dió mejor resultado.