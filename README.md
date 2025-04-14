# 🌾 Projeto de Análise Exploratória de Dados do Agronegócio Brasileiro

## 🎯 Objetivo

Este projeto tem como foco uma **análise estatística exploratória** da produção agrícola brasileira, com destaque para o **Rendimento Médio da Produção (Kg/ha)** nos anos de **2022 e 2023**.  
O intuito é identificar padrões, variações regionais e fatores que impactam a produtividade nos estados brasileiros.

---

## 📊 Fonte dos Dados

Os dados utilizados são provenientes da base oficial do **SIDRA/IBGE**:  
🔗 [Tabela 1612 - SIDRA/IBGE](https://sidra.ibge.gov.br/tabela/1612)

---

## 📁 Estrutura dos Dados

| Coluna                                                     | Tipo                     | Descrição                                                |
|------------------------------------------------------------|--------------------------|-----------------------------------------------------------|
| **Unidade da Federação**                                   | Qualitativa nominal      | Nome dos estados brasileiros                             |
| **Ano**                                                    | Quantitativa discreta    | Ano de referência (2022 ou 2023)                         |
| **Área plantada (Hectares)**                               | Quantitativa contínua    | Área total plantada por estado                           |
| **Área colhida (Hectares)**                                | Quantitativa contínua    | Área efetivamente colhida                                |
| **Quantidade produzida (Toneladas)**                       | Quantitativa contínua    | Total produzido em toneladas                             |
| **Rendimento médio da produção (Quilogramas por Hectare)** | Quantitativa contínua    | Eficiência produtiva por hectare                         |
| **Nível tecnológico**                                      | Qualitativa ordinal      | Classificação: Baixo, Médio ou Alto                      |

---

## 🛠️ Etapas do Projeto

- **Importação dos dados** de uma planilha real contendo dados da produção agrícola.
- **Tratamento e transformação** das variáveis de acordo com seu tipo (nominal, ordinal, contínua, etc.).
- **Categorização de nível tecnológico** para facilitar análises comparativas.
- **Validação da estrutura dos dados** antes das análises.

---

## 📊 Análise Estatística

### 📌 Medidas de Tendência Central

- **Média**: Valor médio de rendimento entre os estados.
- **Mediana**: Valor central da distribuição.
- **Moda**: Valor mais frequente de rendimento observado.

### 📌 Medidas de Dispersão

- **Desvio Padrão e Variância**: Medem o grau de variação entre os estados.
- **Amplitude**: Diferença entre maior e menor rendimento.

### 📌 Medidas Separatrizes

- **Quartis e Percentis**: Indicadores que dividem os dados em partes para análise de distribuição.

---

## 📉 Análises Gráficas

- **Histograma**: Distribuição dos rendimentos médios.
- **Boxplot Geral**: Visualização de dispersão e outliers no rendimento agrícola.
- **Boxplot por Ano**: Comparação direta entre os anos de 2022 e 2023.

---

## 📚 Interpretação dos Resultados

- A **média geral** do rendimento agrícola está em torno de **3.400 kg/ha**.
- A **mediana próxima à média** indica distribuição aproximadamente simétrica.
- Foram identificados **outliers** em estados específicos.
- Em **2022**, houve maior variação nos rendimentos, sugerindo diferenças regionais mais acentuadas.
- Em **2023**, os dados mostraram maior uniformidade e estabilidade.

---

## 🧩 Fatores que Podem Explicar as Diferenças

| Ano   | Fatores Possíveis                                                                 |
|--------|-----------------------------------------------------------------------------------|
| 2022  | 🌧️ Eventos climáticos extremos<br>📈 Aumento dos custos de produção<br>📉 Desigualdade no acesso à tecnologia |
| 2023  | 🌤️ Clima mais estável<br>🔧 Adoção tecnológica mais ampla<br>📊 Recuperação econômica mais homogênea |

---

## ✅ Conclusão

A análise revelou que o **rendimento médio da produção agrícola** é um excelente indicador de **eficiência e produtividade** no campo.  
Além disso, mostrou como **fatores externos** — climáticos, econômicos e tecnológicos — impactam a produção entre os estados.  
Esses insights podem **guiar políticas públicas e investimentos privados** no setor do agronegócio.

---

## 🔧 Ferramentas Utilizadas

| Item            | Descrição                                   |
|------------------|---------------------------------------------|
| **Linguagem**    | R                                           |
| **Pacotes**      | readxl, ggplot2                            |
| **Técnicas**     | Estatística descritiva, Visualização gráfica |

---

## ▶️ Como Executar

1. Clone ou baixe este repositório.
2. Instale os pacotes `readxl` e `ggplot2` no R.
3. Altere o caminho do arquivo `.xlsx` conforme sua máquina.
4. Execute os scripts no **RStudio** para visualizar os resultados.

---




