class Quirofano
    attr_accessor :id, :nombre, :tipo, :personal

    def initialize(id, nombre, tipo, &block)
        @id = id
        @nombre = nombre
        @tipo = tipo
        @personal = []

        if block_given?
            if block.arity == 1
                yield self
            else
                instance_eval(&block)
            end
        end
    end

    def personal(nombre, opciones = {})
        integrante = nombre
        integrante << " #{opciones[:estado]}" if opciones[:estado]
        @personal << integrante
    end

    def to_s 
        output = "Quirofano ##{@id} (#{@nombre}) - #{@tipo}\n"
        output << "Personal asignado:\n"
        @personal.each do |integrante|
            output << "\n\t#{integrante}"
        end
        output
    end
end

### PRUEBAS ###

quirofano_0 = Quirofano.new(0, "Prototipo", "Prueba") do 
    personal "Fadi<3", :estado "cafe"
    personal "Ale", :estado "moto"
    personal "Yoel", :estado "carta"
end

assert_equal quirofano_0.is_a?(Quirofano) true
...

assert_equal quirofano_0.instance_of?(Quirofano) true
...

assert_equal quirofano_0.id 0
...

