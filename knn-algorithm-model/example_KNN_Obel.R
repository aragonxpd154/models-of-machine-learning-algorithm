# Carrega o conjunto de dados iris
data(iris)

# Divide o conjunto de dados em treinamento e teste
set.seed(123)
index <- sample(nrow(iris), round(0.8 * nrow(iris)))
train_data <- iris[index, ]
test_data <- iris[-index, ]

# Instala e carrega o pacote "class"
install.packages("class")
library(class)

# Treina o modelo KNN usando o conjunto de treinamento
modelo_knn <- knn(train_data[, -5], test_data[, -5], train_data[, 5])

# Verifica a acurácia do modelo
accuracy <- mean(modelo_knn == test_data$Species)
print(paste("Acurácia do modelo KNN:", accuracy))

# Plota os resultados do modelo KNN
library(ggplot2)
ggplot(test_data, aes(x = Sepal.Length, y = Sepal.Width, color = modelo_knn)) + 
  geom_point() + 
  ggtitle("Resultados do modelo KNN") + 
  xlab("Comprimento da sépala") + 
  ylab("Largura da sépala") + 
  scale_color_discrete(name = "Espécie prevista")
