corr <- function(directory, threshold = 0) {

  arquivos <- list.files(directory)

  correlacoes <- numeric(0)

  for (i in seq_along(arquivos)) {

    caminho_arquivo <- file.path(directory, arquivos[i])
    dados <- read.csv(caminho_arquivo)

    casos_completos <- sum(complete.cases(dados))

    if (casos_completos > threshold) {
      correlacoes <- c(
        correlacoes,
        cor(dados$nitrate, dados$sulfate, use = "complete.obs")
      )
    }
  }

  return(correlacoes)
}