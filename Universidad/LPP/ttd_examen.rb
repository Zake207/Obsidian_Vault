require_relative "poo_examen"

RSpec.describe Rectangulo do
    before :each do
        @rectangulo = Rectangulo.new(4,5)
    end

    describe "Inicializacion de la clase" do
        it "clases" do
            expect(@rectangulo.is_a?(Rectangulo)).to be true
            expect(@rectangulo.is_a?(Object)).to be true
            expect(@rectangulo.is_a?(BasicObject)).to be true
        end

        it "instancias" do
            expect(@rectangulo.instance_of?(Rectangulo)).to be true
            expect(@rectangulo.instance_of?(Object)).to be false
            expect(@rectangulo.instance_of?(BasicObject)).to be false
        end

        # continuar...

    end
end