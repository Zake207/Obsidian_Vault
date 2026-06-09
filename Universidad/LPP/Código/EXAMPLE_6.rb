class Ritual
    include Comparable
    attr_accessor :nombre, :nivel, :atk, :def, :efecto

    def initialize(n, nv, a, d, e)
        @nombre = n
        @nivel = nv
        @atk = a
        @def = d
        @efecto = e
    end

    def to_s
        "#{@nombre} (lvl #{@nivel})\n #{@efecto}\n\t\t[#{@atk} / #{@def}]"
    end

    def <=>(other)
        @atk + @def <=> other.atk + other.def
    end

end

######################################################################################

habakiri = Ritual.new("Habakiri",8, 2400, 1800, "No irse nunca baneado")
murakumo = Ritual.new("Murakumo", 8, 3200, 800, "Peta todo el campo")
futsu = Ritual.new("Futsu", 8, 2000, 3400, "No para de traerte mierdas al campo")
aramasa = Ritual.new("Aramasa", 4, 1200, 900, "Traer Habakiri xd")

deck = [habakiri, murakumo, futsu, aramasa]

def peor_stats_mejor_nivel(lista)
    nivel = lista.max_by { |r| r.nivel}.nivel
    resultado = lista.select { |r| r.nivel == nivel}.min
end

######################################################################################

def f_sum_atk(lista)
    resultado = lista.map { |r| r.atk }.sum
    resultado
end

def f_sum_def(lista)
    resultado = lista.map { |r| r.def }.sum
    resultado
end

def f_calculos(lista)
    h_atk = Thread.new {f_sum_atk(lista)}
    h_def = Thread.new {f_sum_def(lista)}

    [h_atk.value, h_def.value]
end

######################################################################################

class DslReptil
    attr_accessor :nombre, :nivel, :atk, :def, :efecto

    def initialize(nombre, nivel, atk, dfs, &block)
        @nombre = nombre
        @nivel = nivel
        @atk = atk
        @def = dfs
        @efecto = ""
        if block_given?
            if block.arity == 1
                yield self
            end
        else
            instace_eval(&block)
        end
    end

    def efecto(efecto, opciones = {})
        texto << efecto
        texto << " #{opciones[:restricciones]}.\n" if opciones[:restricciones]
        @efecto = texto
    end

end

murakumo = DslReptil.new("Ame no Murakumo no Mitsurugi", 8, 3200, 800) do 
    efecto "Si esta carta es invocada, destruye todos los monstruos que controle el rival.", 
        :restricciones => "Una vez por nombre"
    efecto "Si esta carta es sacrificada, busca y añade carta mitsurugi en deck, luego invoca esta carta",
        :restricciones => "Una vez por nombre"
end
