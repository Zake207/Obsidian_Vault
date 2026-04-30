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

### Fine Tuning
Ajuste Fino. Es el proceso de modificar la red neuronal de una inteligencia artificial para enseñarle a hacer algo que no sabía. Económico en tiempo y dinero.