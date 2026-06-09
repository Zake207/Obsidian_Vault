expect(biancaviso.is_a?(Payaso)).to be true
...

expect(biancaviso.instance_of?(Payaso)).to be true
...

expect(biancaviso.nombre).to eq "Biancaviso"
...

class Payaso
    include Comparable

    attr_accessor :nombre, :show, :actos, :sueldo

    def initialize(nombre, show, actos, sueldo)
        @nombre, @show, @actos, @sueldo = nombre, show, actos, sueldo
    end

    def to_s
        "¡Hola amigos, soy #{@nombre}!"
    end

    def <=>(other)
        (@actos * @sueldo) <=> (other.actos * other.sueldo)
    end
end

biancaviso = Payaso.new("Biancaviso", "Clown Crew", 3, 2500)
flare = Payaso.new("Flare", "Clown Crew", 3, 500)


assert_equal(biancaviso.is_a?(Payaso), true)
...

###############################################################

lista_payasos = [biancaviso, flare]

def barato_por_show(lista, show)
    resultado = lista.reject { |l| l.show != show}
                     .min
    resultado
end

###############################################################

$escenario = []
n = 5
cv_biancaviso = ConditionVariable.new
cv_flare = ConditionVariable.new
$mutex = Mutex.new

def entra_en_escena(payaso)
    p "payaso #{payaso} entra en escena"
    $escenario << payaso
end

def sale_de_escena(payaso)
    p "payaso #{payaso} sale de escena"
    $escenario.delete(payaso)
end

h_biancaviso = Thread.new do
    n.times do |i|
        mutex.synchronize do
            while !$escenario.empty?
                cv_biancaviso.wait(mutex)
            end
            entra_en_escena("biancaviso")
            cv_flare.signal
        end
    end
end
...


