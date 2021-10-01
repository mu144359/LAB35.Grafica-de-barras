####################
#                  #
# Copiar todo esto #
#                  #
####################
# Hecho con gusto por Selene Muñoz Ortega (UAEH)
#V3
# LABORATORIO - Gráficos en R con ggplot2 para Ciencia de Datos
# Graficas de barras en R 


#instalando paquete con los datos
#install.packages("gapminder")
#install.packages("ggplot2")
# Grafica de lineas en R


# cargar libreria ggplot2 y gapminder
library(ggplot2)
library(gapminder)


# cargando datos a entorno
data("gapminder")

# filtrando por año 2007
gapminder2007 <- gapminder[gapminder$year == '2007', ]

# grafica de barras
ggplot(data = gapminder2007,
       mapping = aes (x = factor(continent)))+
  geom_bar()

# grafica de barras (VERTICAL)
ggplot(data = gapminder2007,
       mapping = aes (x = factor(continent)))+
  geom_bar()+
  coord_flip()
  
# creando etiqueta para expectativa de vida
gapminder2007$lifeExp_label <- ifelse(
  gapminder2007$lifeExp < 50 ,
  "poca",
  ifelse(gapminder2007$lifeExp < 70,
         "media",
         "alta"))

# guardando grafica en variable
p <- ggplot(data = gapminder2007, 
            mapping = aes(x = factor(continent), 
                           fill = lifeExp_label))

# stacked bar chart (apilalada)
p + geom_bar (position = "stack" , stat = "count")

# dogde bar chart (separada)
p + geom_bar (position = "dodge" , stat = "count")

# LLENA 100% + percent barchart
p + geom_bar (position = "fill" , stat = "count")
