

## Introducción a dplyr
## Herramienta de exploración y manipulación

## Si aprendes dplyr, SQL easy as hell

## Tenemos 5 funciones básicos: filter, select, arrange, mutate, summarise (plus group_by)

# cargas de paquetes
library(dplyr)
library(hflights)

# chequemos la info
data(hflights)
head(hflights)

# convert to local data frame
flights <- tbl_df(hflights)

# printing only shows 10 rows and as many columns as can fit on your screen
flights

# Si quisieramos ver los vuelos del primero de enero, elegimos el día 1 (R matricial)
flights[flights$Month==1 & flights$DayofMonth==1, ]

# usando dplyr 
# nota: usando coma puedes elegir condiciones para varias variables
filter(flights, Month==1, DayofMonth==1)

# Se puede utilizar la condición "o" con |
filter(flights, UniqueCarrier=="AA" | UniqueCarrier=="UA")

# también puedes utilizar %in% para buscar dentro de un conjunto de opciones
filter(flights, UniqueCarrier %in% c("AA", "UA"))

# Si quisieramos elegir "DepTime", "ArrTime", "FlightNum" en R
flights[, c("DepTime", "ArrTime", "FlightNum")]

# dplyr 
select(flights, DepTime, ArrTime, FlightNum)

## Encadenamiento de funciones (SELECT + FILTER)
flights %>%
  select(UniqueCarrier, DepDelay) %>%
  filter(DepDelay > 60)

flights %>%
  select(UniqueCarrier, DepDelay) %>%
  arrange(DepDelay)

## Summarise o agregación
flights %>%
  select(tailnum, distance) %>%
  group_by(tailnum) %>%
  summarise(num_viajes = n(),
            distancia_total = sum(distance))

## Ejercicio 1: Se necesita darle servicio inmediato a aviones muy utilizados
## y evitar costos en aquellos que tienen poca distancia. Como encargado de 
## presupuestos, averigua los 10 aviones que recorrieron más distancia para darles servicio
## Qué aviones recorrieron más distancia? (tip: buscar función arrange)



## Ejercicio 2: Cuál es la distancia promedio de los aviones que van del aeropuerto John F Kennedy
## Nueva York al aeropuerto MIA (Miami). (Tip: origen y destino deben ser filtrados primero)



