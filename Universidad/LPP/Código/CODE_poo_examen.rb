class Rectangulo
    attr_reader :size_x, :size_y

    def initialize(x, y)
        @size_x = x
        @size_y = y 
    end

    def area
        @size_x * size_y
    end
    
    def perimetro
        @size_x * 2 + size_y * 2
    end

    def privado
        "Metodo privado"
    end

    def protegido
        "Metodo protegido"
    end

    private :privado
    protected :protegido

end

class Caja < Rectangulo
    def initialize(x, y, z)
        super(x, y)
        @size_z = z
    end

    def area
        "not implemented yet"
    end

    def perimetro
        "also not implemented"
    end

    def volumen
        @size_x * @size_y * @size_z
    end

end
