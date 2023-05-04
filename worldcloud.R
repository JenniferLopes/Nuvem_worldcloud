# Nuvem de palavras com pacote ggwordcloud.

# Carregando pacotes ------------------------------------------------------
library(ggwordcloud)
library(readxl)
library(ggplot2)
library(tidyverse)

# Definindo diretório -----------------------------------------------------
setwd ("C:\\jennifer_r\\Script_worldcloud\\palavras.xlsx")


# Carregando dados --------------------------------------------------------
palavras <- read_excel("palavras.xlsx")
View(palavras)


# Plot word cloud ---------------------------------------------------------
ggplot(palavras, aes(label= word, size=fqnce))+
  geom_text_wordcloud(area_corr = TRUE)+
  scale_size_area(max_size = 15)+
  theme_minimal()


# Plot word cloud colorido ------------------------------------------------
plotwc <- ggplot(
  palavras,
  aes(
    label = word, size = fqnce,
    color = fqnce,
  )
) +
  geom_text_wordcloud_area() +
  scale_size_area(max_size = 25) +
  theme_minimal() +
  scale_color_gradient(low = "burlywood4", high = "rosybrown4");plotwc


# Exportação --------------------------------------------------------------
jpeg(filename = "WORDCLOUD.jpeg")
plotwc
dev.off()
