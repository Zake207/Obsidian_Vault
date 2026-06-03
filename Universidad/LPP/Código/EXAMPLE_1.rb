##############################################
#                   POO                      #
##############################################

class Medico
    include Comparable

    attr_reader :id, :especialidad, :turno, :precio

    def initialize(id, especialidad, turno, precio)
        @id = id
        @especialidad = especialidad
        @turno = turno
        @precio = precio
    end

    def to_s
        "ID: #{@id}\n\t Especialidad: #{@especialidad}\n\t Turno: #{@turno}\n\t Precio: #{@precio}"
    end

    def <=>(other)
        @id <=> id
    end
end

################################################
require 'test/unit'

class TestMedico < Test::Unit::TestCase 
    def setup
        @medico_1 = Medico.new(1, "Radiografías", "Mañana", 2500)
    end

    def PruebasInicializacion
        assert(@medico_1.is_a?(Medico))
        assert(@medico_1.is_a?(Object))
        assert(@medico_1.is_a?(BasicObject))

        assert_equal(@medico_1.instance_of?(Medico), true)
        assert_equal(@medico_1.instance_of?(Object), false)
        assert_equal(@medico_1.instance_of?(BasicObject), false)
    end

    def PruebasAtributos
        assert_kind_of(Integer, @medico_1.id) 
