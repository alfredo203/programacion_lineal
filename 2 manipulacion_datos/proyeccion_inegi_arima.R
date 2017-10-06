## Clase 2. Manipulación de datos


## Carga de información

read.csv(file = "2 manipulacion_datos/BIE_BIE20171005185547.csv") ## Función para leer archivos csv

## El archivo csv no se puede leer o se ve un poco extraño
## Para arreglarlo, nos brincamos las primeras tres líneas


df <-read.csv(file = "2 manipulacion_datos/BIE_BIE20171005185547.csv", skip = 3, header = T)

## Una vez que se pudo leer el archivo, vemos las dimensiones

dim(df)

View(df)

## Cambiar los nombres

names(df) <- 1:ncol(df) ## Funcion que cambia los nombres names(x) <- y

## Instalar la libreria de manipulación de información
install.packages("dplyr")

## Cargar la libreria de manipulación de información
library(dplyr)

## Seleccionamos columnas con la función "select"
pc <- df %>% select("1", "2") ## elegimos la columna de fechas y IPC

## Hay más formas de elegir columnas
pc$`1`
pc$`2`

## Vemos que hay información no últil en los últimos renglones

pc_limpio <-pc[1:211, 1:2 ] ## Funciona como una matriz (primero renglon, luego columnas)
## Elijo desde el renglón 1 hasta el 211 porque en después hay basura de información
## También elijo la columna 1 a 2


## Al fin tenemos el archivo limpio!!

names(pc_limpio) <- c("fecha", "IPC") ## Renombramos las variables

## Empezar el análisis

## Paso 1.Funciones resumen

summary(pc_limpio) ## Estadistica descriptiva

## Que tipo de información tiene nuestra tabla?
## Integer
## Float
## Character...

## Funcion para obtener cada clase de una tabla
lapply(pc_limpio, class)

## Paso 2. Cambiar formato de fecha

pc_limpio$fecha<-as.Date(paste(pc_limpio$fecha,1,sep="/"), "%Y/%m/%d")

class(pc_limpio$fecha) ## Qué formato tiene mi columna?
## Pudimos cambiar el formato de fecha

## Gráfica de línea
plot(x = pc_limpio$fecha, 
     y = pc_limpio$IPC, 
     type = "l",
     col = "blue")



