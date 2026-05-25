require "test-unit"
require_relative "poo_examen"

class PruebaEjemplo < Test::Unit::TestCase
    def setup
        # poo
        @rectangulo_1 = Rectangulo.new(4,5)
        @rectangulo_2 = Rectangulo.new(8,3)

        #metaprogamacion
        #pendiente de desarrollar...

    end

    def tests_poo_rectagulos_1
        assert_not_nil(@rectangulo_1)
        assert_not_nil(@rectangulo_2)
        
        assert_equal(@rectangulo_1.class, Rectangulo)
        assert_equal(@rectangulo_2.class, Rectangulo)

        assert_