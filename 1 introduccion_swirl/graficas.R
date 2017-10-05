library(swirl) ## Función para cargar librería
swirl() ## Abrir Swirl

## Pones tu nombre XXXXXXXXXXX

data(cars)

## Funcion exploratoria

head(cars)

plot(cars) ## grafica la distancia vs velocidad
lines(lowess(cars))
abline(v = 15, col= "red")
