# Projeto de Análise Exploratória de Dados do Agronegócio Brasileiro

## 🎯 Objetivo

O objetivo deste projeto é realizar uma análise estatística exploratória da produção agrícola brasileira, com foco no **Rendimento Médio da Produção (Kg/ha)** nos anos de 2022 e 2023. A intenção é compreender o comportamento da produtividade agrícola nos estados brasileiros e investigar fatores que possam influenciar seus resultados.

---

## 📊 Fonte dos Dados

Os dados foram obtidos diretamente do SIDRA/IBGE:  
🔗 [https://sidra.ibge.gov.br/tabela/1612](https://sidra.ibge.gov.br/tabela/1612)

---

## 📁 Estrutura dos Dados

As colunas disponíveis na base de dados são:

- **Unidade da Federação** (Qualitativa nominal)  
- **Ano** (Quantitativa discreta)  
- **Área plantada (Hectares)** (Quantitativa contínua)  
- **Área colhida (Hectares)** (Quantitativa contínua)  
- **Quantidade produzida (Toneladas)** (Quantitativa contínua)  
- **Rendimento médio da produção (Quilogramas por Hectare)** (Quantitativa contínua)  
- **Nível tecnológico** (Qualitativa ordinal: Baixo, Médio, Alto)

---

## 🛠️ Etapas do Projeto

### 1. 📥 Importação dos Dados

```r
library(readxl)

dados <- read_excel("C:/Users/IMILE-TI/Desktop/Projeto_Cap 7 - Decolando com ciências de dados/Base_Agronegocio_Dados_Reais.xlsx", 
                    sheet = "Base_dados")
# 1. Coluna "Unidade da Federação" para fator (qualitativa nominal)
dados$`Unidade da Federação` <- as.factor(dados$`Unidade da Federação`)

# 2. Coluna "Ano" para numérica (quantitativa discreta)
dados$Ano <- as.numeric(dados$Ano)

# 3. Colunas de áreas e produção para numéricas (quantitativas contínuas)
dados$`Área plantada (Hectares)` <- as.numeric(dados$`Área plantada (Hectares)`)
dados$`Área colhida (Hectares)` <- as.numeric(dados$`Área colhida (Hectares)`)
dados$`Quantidade produzida (Toneladas)` <- as.numeric(dados$`Quantidade produzida (Toneladas)`)

# 4. Coluna "Rendimento médio da produção (Quilogramas por Hectare)" para numérica
dados$`Rendimento médio da produção (Quilogramas por Hectare)` <- as.numeric(dados$`Rendimento médio da produção (Quilogramas por Hectare)`)

# 5. Coluna "Nível_tecnologico" para fator (qualitativa ordinal)
dados$Nivel_tecnologico <- factor(dados$Nivel_tecnologico, levels = c("Baixo", "Médio", "Alto"), ordered = TRUE)

# Verificar se deu bom
str(dados)
📊 Análise Estatística: Rendimento Médio (Kg/ha)
A variável Rendimento Médio da Produção (Kg/ha) foi escolhida por representar o desempenho da produção agrícola ao longo do tempo e entre diferentes estados, permitindo identificar padrões, variações regionais e temporais.

📌 Medidas de Tendência Central
r
Copiar
Editar
# Média do rendimento
media_rendimento <- mean(dados$`Rendimento médio da produção (Quilogramas por Hectare)`, na.rm = TRUE)

# Mediana
mediana_rendimento <- median(dados$`Rendimento médio da produção (Quilogramas por Hectare)`, na.rm = TRUE)

# Moda
moda_rendimento <- as.numeric(names(sort(table(dados$`Rendimento médio da produção (Quilogramas por Hectare)`), decreasing = TRUE )[1]))
📌 Medidas de Dispersão
r
Copiar
Editar
# Desvio padrão
desvio_padrao_rendimento <- sd(dados$`Rendimento médio da produção (Quilogramas por Hectare)`, na.rm = TRUE)

# Variância
variancia_rendimento <- var(dados$`Rendimento médio da produção (Quilogramas por Hectare)`, na.rm = TRUE)

# Amplitude
amplitude_rendimento <- range(dados$`Rendimento médio da produção (Quilogramas por Hectare)`, na.rm = TRUE)
📌 Medidas Separatrizes
r
Copiar
Editar
# Quartis
quartis_rendimento <- quantile(dados$`Rendimento médio da produção (Quilogramas por Hectare)`, na.rm = TRUE) 

# Percentis
percentis_rendimento <- quantile(dados$`Rendimento médio da produção (Quilogramas por Hectare)`, na.rm = TRUE)
📉 Análises Gráficas
📊 Histograma
r
Copiar
Editar
library(ggplot2)

ggplot(dados, aes(x = `Rendimento médio da produção (Quilogramas por Hectare)`)) +
  geom_histogram(binwidth = 100, fill = "lightblue", color = "black") +
  labs(title = "Distribuição do Rendimento Médio (kg/ha)", x = "Rendimento Médio (kg/ha)", y = "Frequência") +
  theme_minimal()
📦 Boxplot Geral
r
Copiar
Editar
ggplot(dados, aes(y = `Rendimento médio da produção (Quilogramas por Hectare)`)) +
  geom_boxplot(fill = "lightgreen", color = "black") +
  labs(title = "Boxplot do Rendimento Médio (Kg/ha)", y = "Rendimento médio (Kg/ha)") +
  theme_minimal()
📦 Boxplot por Ano (2022 e 2023)
r
Copiar
Editar
ggplot(dados, aes(x = as.factor(Ano), y = `Rendimento médio da produção (Quilogramas por Hectare)`, fill = as.factor(Ano))) +
  geom_boxplot(color = "black") +
  labs(title = "Boxplot do Rendimento Médio por Ano", x = "Ano", y = "Rendimento Médio (kg/ha)") +
  theme_minimal() +
  scale_fill_manual(values = c("2022" = "yellow", "2023" = "blue"))
📚 Interpretação dos Resultados
A média geral do rendimento é em torno de 3.400 kg/ha.

A mediana está próxima da média, o que indica distribuição levemente simétrica.

O boxplot geral revelou outliers em alguns estados.

Comparando os anos 2022 e 2023:

Em 2022, a dispersão foi maior, indicando maior variação regional.

Em 2023, os dados foram mais concentrados, mostrando maior estabilidade.

🧩 Fatores que Podem Explicar as Diferenças
A maior dispersão em 2022 pode estar relacionada a:

Eventos climáticos (como seca, excesso de chuva, La Niña ou El Niño)

Aumento nos custos de produção (fertilizantes e combustíveis)

Dificuldades logísticas e acesso à tecnologia

Políticas públicas locais ou regionais

Recuperação econômica pós-pandemia (desigual entre os estados)

✅ Conclusão
A análise exploratória demonstrou a importância do rendimento médio da produção agrícola como indicador de eficiência no campo. A comparação entre os anos evidenciou como fatores externos (econômicos, climáticos e tecnológicos) afetam a produtividade. Esse tipo de estudo pode subsidiar decisões governamentais e privadas no setor agro.

🔧 Ferramentas Utilizadas
Linguagem: R

Pacotes: readxl, ggplot2

Métodos: Estatística descritiva e visualização de dados

Como Executar
Faça o download/clonagem do projeto.

Instale os pacotes necessários no R:

r
Copiar
Editar
install.packages("readxl")
install.packages("ggplot2")
Abra o script .R e altere o caminho para a planilha, se necessário.

Execute os comandos no RStudio.




