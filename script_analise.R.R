# Projeto de Análise de Dados - Agronegócio Brasileiro


# Fonte dos dados: https://sidra.ibge.gov.br/tabela/1612

# Pacote para leitura de arquivos Excel
library(readxl)

# Importação dos dados da planilha

dados <- read_excel("C:/Users/IMILE-TI/Desktop/Projeto_Cap 7 - Decolando com ciências de dados/Base_Agronegocio_Dados_Reais.xlsx", 
                    sheet = "Base_dados")

# Verificação inicial: nomes das colunas e estrutura dos dados
colnames(dados)
str(dados)

# Algumas colunas foram importadas como texto (chr) e precisam ser convertidas para o tipo adequado:

# 1. Converter "Unidade da Federação" para fator (variável qualitativa nominal)
dados$`Unidade da Federação` <- as.factor(dados$`Unidade da Federação`)

# 2. Converter "Ano" para numérico (variável quantitativa discreta)
dados$Ano <- as.numeric(dados$Ano)

# 3. Converter colunas de área e produção para numérico (variáveis quantitativas contínuas)
dados$`Área plantada (Hectares)` <- as.numeric(dados$`Área plantada (Hectares)`)
dados$`Área colhida (Hectares)` <- as.numeric(dados$`Área colhida (Hectares)`)
dados$`Quantidade produzida (Toneladas)` <- as.numeric(dados$`Quantidade produzida (Toneladas)`)

# 4. Converter "Rendimento médio da produção (Quilogramas por Hectare)" para numérico
dados$`Rendimento médio da produção (Quilogramas por Hectare)` <- as.numeric(dados$`Rendimento médio da produção (Quilogramas por Hectare)`)

# 5. Converter "Nível_tecnologico" para fator ordenado (qualitativa ordinal)
dados$Nivel_tecnologico <- factor(dados$Nivel_tecnologico, levels = c("Baixo", "Médio", "Alto"), ordered = TRUE)

# Verificação da estrutura final após as conversões
str(dados)

# ANÁLISE EXPLORATÓRIA
# Variável escolhida: Rendimento médio da produção (kg/ha)
# Justificativa: variável quantitativa contínua que representa o desempenho da produção agrícola. Permite identificar padrões, variações regionais e temporais.

# MEDIDAS DE TENDÊNCIA CENTRAL

# Média
media_rendimento <- mean(dados$`Rendimento médio da produção (Quilogramas por Hectare)`, na.rm = TRUE)

# Mediana
mediana_rendimento <- median(dados$`Rendimento médio da produção (Quilogramas por Hectare)`, na.rm = TRUE)

# Moda
moda_rendimento <- as.numeric(
  names(
    sort(
      table(dados$`Rendimento médio da produção (Quilogramas por Hectare)`), 
      decreasing = TRUE
    )[1]
  )
)

# MEDIDAS DE DISPERSÃO

# Desvio padrão
desvio_padrao_rendimento <- sd(dados$`Rendimento médio da produção (Quilogramas por Hectare)`, na.rm = TRUE)

# Variância
variancia_rendimento <- var(dados$`Rendimento médio da produção (Quilogramas por Hectare)`, na.rm = TRUE)

# Amplitude (mínimo e máximo)
amplitude_rendimento <- range(dados$`Rendimento médio da produção (Quilogramas por Hectare)`, na.rm = TRUE)

# MEDIDAS SEPARATRIZES

# Quartis
quartis_rendimento <- quantile(dados$`Rendimento médio da produção (Quilogramas por Hectare)`, na.rm = TRUE)

# Percentis (exemplo: 10%, 25%, 50%, 75%, 90%)
percentis_rendimento <- quantile(
  dados$`Rendimento médio da produção (Quilogramas por Hectare)`, 
  probs = c(0.1, 0.25, 0.5, 0.75, 0.9),
  na.rm = TRUE
)

# ANÁLISE GRÁFICA

# Pacote para gráficos
library(ggplot2)

# Histograma
ggplot(dados, aes(x = `Rendimento médio da produção (Quilogramas por Hectare)`)) +
  geom_histogram(binwidth = 100, fill = "lightblue", color = "black") +
  labs(
    title = "Distribuição do Rendimento Médio (kg/ha)", 
    x = "Rendimento Médio (kg/ha)", 
    y = "Frequência"
  ) +
  theme_minimal()

# Boxplot simples
ggplot(dados, aes(y = `Rendimento médio da produção (Quilogramas por Hectare)`)) +
  geom_boxplot(fill = "lightgreen", color = "black") +
  labs(
    title = "Boxplot do Rendimento Médio (kg/ha)", 
    y = "Rendimento Médio (kg/ha)"
  ) +
  theme_minimal()

# Boxplot por ano (comparativo entre 2022 e 2023)
ggplot(dados, aes(x = as.factor(Ano), y = `Rendimento médio da produção (Quilogramas por Hectare)`, fill = as.factor(Ano))) +
  geom_boxplot(color = "black") +
  labs(
    title = "Boxplot do Rendimento Médio por Ano", 
    x = "Ano", 
    y = "Rendimento Médio (kg/ha)"
  ) +
  theme_minimal() +
  scale_fill_manual(values = c("2022" = "yellow", "2023" = "blue"))


  







