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

        it "atributos de inicio" do
            expect(@rectangulo.instance_variable_get(:@size_x)).to eq(4)
            expect(@rectangulo.instance_variable_get(:@size_y)).to eq(5)
        end

        it "atributos públicos" do
            expect(@rectangulo.size_x).to eq(4)
            expect(@rectangulo.size_y).to eq(5)
        end

        it "visibilidad de los metodos" do 
            expect(@rectangulo.public_methods).to include(:area)
            expect(@rectangulo.private_methods).to include(:privado)
            expect(@rectangulo.protected_methods).to include(:protegido)
        end           
    end
end