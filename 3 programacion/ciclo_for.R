## Ya conocimos los conceptos básicos de swirl
## Podemos graficar y hacer forecast automatizados


## Suponiendo que queremos hacer una predicción del PIB de muchos países?
## Cómo usamos los conocimientos de programación para este sentido

## Aprendemos ciclos

## Un ciclo es la repetición simple de una acción
## cada auto rojo, cuéntalo
## por cada valor, suma 5 dólares
## por cada país, realiza un modelo arima!

## Ejercicio 1
for(x in 1:100){
  print(x)
}

## Ejercicio 2
for(x in 1:9){
  print(x+5)
}

## Ejercicio 3: Por cada x, saca la raíz cuadrada e imprimela
for(i in 1:9){
 print(i^0.5)
}

## Ejercicio 4: Gráfica de la función logaritmo
y <- 1:5000
for(i in 1:5000){
  y[i] <-(log(i))
}
plot(y, type = "l")


## Haciendo el arima para cada país

df<-read.csv("3 programacion/Popular Indicators/gdp_data.csv", stringsAsFactors = F)

View(df)
## Vemos que hay informacion no util para el analisis
## eliminamos columnas no deseadas
## llamamos a el paquete de manipulacion dplyr

library(dplyr)

df_limpio <-df %>% select(-Series.Name,
              -Series.Code,
              -Time.Code)

df_final <-df_limpio[1:24, ]

df_final$Turks.and.Caicos.Islands..TCA.

## Vamos a hacer un arima por cada pais

son_numericos <- sapply(df_final, is.numeric)

df_pib <-df_final[ , son_numericos]

## Grafica para comprobar que la informacion
## se puede leer correctamente
plot(df_pib$Time, df_pib$Mexico..MEX., type = "l")


## La magia del ciclo for!
rango <-length(names(df_final))
nombres <-names(df_final)

## Grafica cada uno de mis paises
for(i in 1:rango){
  a <-(df_pib[ , i])
  plot(df_pib$Time, a, main = nombres[i], type = "l")
}

## Haz un arima con cada uno de los paises


