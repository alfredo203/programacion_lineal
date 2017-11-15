## Ejercicio final

## El ejercicio consiste en hacer una gráfica "plot(x,y)" por cada uno de los aviones que
## se encuentran en el archivo de "flights" del paquete "nycflights13"
## flights contiene cerca de 4,000 aviones distintos que deben ser graficados

## Instrucciones para cargar el archivo

install.packages("nycflights13")

library(nycflights13)

data(flights)

View(flights)

names(flights)

## Las variables importantes son:
## time_hour = variable de tiempo
## distance = distancia de viaje
## tailnum = identificador del avión

## Recuerda! todo está en swirl (lección 1 en el repositorio)
## si tienes dificultades para resolver el 

## 1. Extraer solo las columnas interesantes con dplyr (select): time_hour, distance, tailnum

## 2. Jugar con 

install.packages("reshape2") 
library(reshape2)
## La función que queremos se llama es dcast(), recuerda que debes definir que time_hour es renglón
## tailnum es la columna y distance es el valor que va en la casilla.

## 3. Tomar el ciclo for que hicimos en la clase de PIB y cambiar los rangos-nombres de las matrices
## o dataframes