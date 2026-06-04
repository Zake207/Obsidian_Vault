## Creación básica de hilos
thread_example = Thread.new do
    p "Ejemplo de Thread"
end

thread_example.join

def thread_function()
    return "thread function called"
end
another_example = Thread.new {thread_function}
another_example.join

## Para acceder a los threads disponibles
# Thread.list

# Thread.main

# Thread.current

# Thread.kill(thread_example)       Para pasar la ejecución al siguiente    
# Thread.pass

# Thread.exit                       Sale del hilo, hecho en main mata todos los hilos pues se sale del principal

## Para solventar condiciones de carrera
$result = 0
$mutex = Mutex.new

def function_1()
    $mutex.lock
    $result += 1
    $mutex.unlock
end

def function_2()
    $mutex.synchronize do
        $result = 0
    end
end

hilos = []
i = 0
while i < 10 do
    hilos[i] = Thread.new {function_1}
    i += 1
end

i = 0
while i < 10 do
    hilos[i].join
    i += 1
end
