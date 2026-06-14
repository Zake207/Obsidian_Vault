class Insecto
    include Comparable
    attr_accessor :nombre, :especie, :habitat, :n_amenazado

    def initialize(nombre, especie, habitat, n_amenazado)
        @nombre = nombre
        @especie = especie
        @habitat = habitat
        @n_amenazado = n_amenazado
    end

    def to_s
        "Insecto: #{@nombre} (#{@especie}) - #{habitat} [#{@n_amenazado}]"
    end

    def <=>(other)
        @n_amenazado <=> other.n_amenazado
    end

end

#########################################

insecto_ejemplo_1 = Insecto.new("Araña de Embudo", "Aracnido", "Autralia", 3)
insecto_ejemplo_2 = Insecto.new("Migala", "Aracnido", "Latam", 3)
insecto_ejemplo_3 = Insecto.new("Viuda negra", "Aracnido", "EEUU", 4)

expect(insecto_ejemplo_1.is_a?(Insecto)).to be true
...

expect(insecto_ejemplo_1.instance_of?(Insecto)).to be true
...

expect(insecto_ejemplo_1.habitat).to eq "Australia"
...

#########################################

l_ejemplo = [insecto_ejemplo_1, insecto_ejemplo_2, insecto_ejemplo_3]

def f_ejemplo(lista)
    resultado = lista.select { |i| i.n_amenazado == 3}
                     .map { |i| i.nombre}
end

#########################################

# Dos hilos: uno el porcentaje de una especie y otro la media de amenaza

$h_resultados = []
$mutex = Mutex.new

def p_especie(lista, especie)
    coincidencias = 0
    total = lista.size
    lista.each do |i|
        if i.especie == especie
            coincidencias += 1
        end
    end
    resultado = (coincidencias / total) * 100
    $mutex.lock
    $h_resultados << resultado
    $mutex.unlock
end

def m_amenaza(lista)
    suma = 0
    total = lista.size
    lista.each do |i|
        suma += i.n_amenazado
    end
    resultado = suma / total
    $mutex.lock
    $h_resultados << resultado
    $mutex.unlock
end

def h_funcion(lista)
    h_especie = Thread.new {p_especie(lista)}
    h_amenaza = Thread.new {m_amenaza(lista)}
    $h_resultados << h_amenaza.join << h_especie.join

    "----> #{$h_resultados}"
end

#########################################

class DslInsecto
    attr_accessor :nombre, :especie

    def initialize(nombre, especie, &block)
        @nombre = nombre
        @especie = especie
        @partes = []
        
        if block_given?
            if block.arity == 1
                yield self
            end
        else
            instace_eval(&block)
        end
    end

    def partes(nombre, opciones = {})
        atributo = nombre
        atributo << " cantidad: #{opciones[:cantidad]}" if opciones[:cantidad]
        @partes << atributo
    end
end

ejemplo = DslInsecto.new ("Araña de Embudo", "Aracnido") do
    partes "patas", :cantidad => 8
    partes "colmillos", :cantidad => 2
    partes "ojos", :cantidad => 10
end