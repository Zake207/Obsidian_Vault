class Personal
    include Comparable

    attr_accessor :id, :nombre, :turno, :especialidades

    def initialize(id, nombre, turno, especialidades)
        @id = id
        @nombre = nombre
        if ["mañana", "tarde", "noche", "sin asignar"].include?(turno)
            @turno = turno
        else
            @turno = "sin asignar"
        end
        @especialidades = especialidades
    end

    def to_s
        "Usuario #{@id} (#{@nombre})"
    end

    def <=>(other)
        @id <=> other.id
    end
end

instancia_ejemplo = Personal.new(200, "Fadi", "tarde", ["bocata", "cafe", "postres"])

assert_equal(instancia_ejemplo.is_a?(Personal), true)
...

expect(instancia_ejemplo.is_a?(Personal)).to be true
...

# los empleados que tengan especialidad cafe, que no sean del turno de mañana y el id más pequeño

def funcionalidad(empleados)
    resultado = empleados.select { |e| e.especialidades.include("cafe") }
                        .reject { |e| e.turno == "mañana" }
                        .min
end

# Contraste de empleados de tarde con los de mañana

include 'thread'

$resultado = 0
$mutex = Mutex.new
$lista = []

def contar_tarde()
    $mutex.lock
    $resultado += 1
    $mutex.unlock
end

def contar_noche()
    $mutex.lock
    $resultado -= 1
    $mutex.unlock
end

h_tarde = Thread.new do
    $lista.each |e| do
        if e.turno == "tarde"
            contar_tarde()
        end
    end
end

h_noche = Thread.new do
    $lista.each |e| do
        if e.turno == "noche"
            contar_noche()
        end
    end
end

def f_resultado()
    h_tarde.join
    h_noche.join
end

    