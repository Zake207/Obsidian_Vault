class GMX
    include Comparable
    attr_accessor :name, :atk, :def, :type, :effect

    def initialize(n, a, d, t, e)
        @name = n
        @atk = a
        @def = d
        @type = t
        @effect = e
    end

    def to_s
        "#{@name} - #{@type}"
    end

    def <=>(g)
        @atk + @def <=> g.atk + g.def
    end

end

daneen = GMX.new("Daneen", 1500, 800, "Dinosaur", "Fusion")
comprex = GMX.new("Comprex", 3600, 2000, "Dinosaur", "Overkill")
noma = GMX.new("Noma", 1000, 500, "Reptile", "Recover")

assert_equal(daneen.is_a?(GMX), true)
...

assert_equal(daneen.instance_of?(GMX), true)
...

assert_equal(daneen.name, "Daneen")
...

#-------------------------------------------------------------------

expect(comprex.is_a?(GMX)).to be true
...

expect(comprex.instance_of?(GMX)).to be true
...

expect(comprex.effect).to eq "Overkill"
...

#<===================================================================>

list_example = [daneen, comprex, noma]

def function(list, atk) # Shortest effect of gmx that have equal or higher atk
    resultado = list.select { |l| l.atk >= atk}
                    .map { |l| l.effect}
                    .min
    resultado
end

#<===================================================================>

$field = []
cv_daneen = ConditionVariable.new
cv_comprex = ConditionVariable.new
$mutex = Mutex.new
n = 5

def enter_field(gmx)
    $field << gmx
    p "#{gmx} entró al campo"
end

def exit_field(gmx)
    $field.delete(gmx)
    p "#{gmx} salió del campo"
end

h_daneen = Thread.new do
    n.times do |i|
        $mutex.synchronize do
            while !$field.empty? do
                cv_daneen.wait($mutex)
            end
            enter_field("Daneen")
            sleep(1)
            exit_field("Daneen")
            cv_comprex.signal
        end
    end
end

...


#<===================================================================>

class DSL_GMX
    def initialize(n, a, d, t, &block)
        @name = n
        @atk = a
        @def = d
        @type = t
        if block_given?
            if &block.arity == 1
                yield self
            end
        else
            instace_eval(&block)
        end
    end

    def effect(efecto, opciones = {})
        e = efecto
        e << " #{opciones[:restricciones]}" if opciones[:restricciones]
        @effect = e
    end            
end

comprex = DSL_GMX.new("Comprex", 3600, 2000, "Dinosaur") do 
    effect "Untargeteable", :restricciones => "si se fusiona con 3 o mas dinos"
    effect "Overkill", :restricciones => "si se fusiona con 4 o mas dinos"
    effect "Drain", :restricciones => "si se fusiona con 5 o mas dinos"
end
