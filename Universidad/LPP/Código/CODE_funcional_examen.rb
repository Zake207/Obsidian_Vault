example_vector = [1, 2, 3, 4, 5, 6, 7, 3, 4, 5, 8, 9, 10, 0, -1, -2]

# OPERACIONES
cuadrados = example_vector.map { |n| n*n }
pares = example_vector.select { |n| n//2 == 0}
impares = example_vector.reject { |n| n//2 == 1}
cero = example_vector.find { |n| n == 0}
sumatorio = example_vector.reduce(:+) # Para juntar todos los elementos, sumando en este caso

# COMPROBACIONES
example_vector.all? { |n| n.is_a?(Numeric)}     # Son todos numeros?
example_vector.any? { |n| n.is_a?(Numeric)}     # Hay algun numero?
example_vector.none? { |n| n.is_a?(Numeric)}    # No hay ningun numero?

pares_impares = example_vector.group_by? { |n| n//2 == 0 }

# ENCADENAMIENTO
suma_pares_menores_a_diez_al_cuadrado = example_vector
    .select { |n| n//2 == 0}
    .reject { |n| n>=10 }
    .map { |n| n**2}
    .reduce(:+)

    