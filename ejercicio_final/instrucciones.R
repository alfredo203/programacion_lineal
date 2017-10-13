## Ejercicio final

## El ejercicio consiste en hacer una gráfica "plot(x,y)" por cada uno de los aviones que
## se encuentran en el archivo de "flights" del paquete "nycflights13"
## flights contiene cerca de 4,000 aviones distintos que deben ser graficados

## Instrucciones para cargar el archivo

install.packages("nycflights")

library(nycflights13)

data(flights)

View(flights)

names(flights)

## Las variables importantes son:
## time_hour = variable de tiempo
## distance = distancia de viaje
## tailnum = identificador del avión

## Recuerda! todo está en swirl (lección 1 en el repositorio)
## si tienes dificultades para resolver