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


## Cambiar el formato a días,
## no hace sentido ver una gráfica por hora
flights$time_month <- format(flights$time_hour, format = "%Y-%m-%d")

## Agrupamos la distancia por avión y por mes
df <- flights %>% 
  select(tailnum, distance, time_month) %>% 
  group_by(tailnum, time_month) %>% 
  summarise(total_distance = sum(distance))

## Cambiamos el formato para obtener una bonita "matriz"
library(reshape2)

df_matriz <- dcast(df, time_month ~ tailnum, value.var = "total_distance")
# df_matriz$time_month <- as.Date(df_matriz$time_month)
df_matriz$time_month<-cut(df_matriz$time_month, breaks = "months")

## Aplicamos el ciclo for para obtener unas gráficas bien locas
rango <- ncol(df_matriz)

nombres <-names(df_matriz)

for(i in 2:50){ ## fijo a sólo 50 gráficas
  a <-(df_matriz[ , i])
  plot(df_matriz$time_month, a, main = nombres[i], "l")
}

## Quizás un poco de análisis? 
## tiren su magia (/￣ー￣)/~~☆’.･.･:★’.･.･:☆
## siempre hay hipótesis interesantes que resolver!

## Qué avión voló más ditancia en el año?
## cuál es la velocidad promedio de viaje?
## Quiénes viajaban más rápido en el mes de septiembre? etc.