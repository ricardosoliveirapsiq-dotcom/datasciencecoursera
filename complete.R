complete <- function(directory, id = 1:332) {
  
  arquivos <- list.files(directory)
  
  arquivos_selecionados <- arquivos[id]
  
complete <- function(directory, id) {

  arquivos <- list.files(directory)

  arquivos_selecionados <- arquivos[id]

  numero_casos <- numeric(length(arquivos_selecionados))

  for (i in seq_along(arquivos_selecionados)) {

    caminho_arquivo <- file.path(directory, arquivos_selecionados[i])

    dados <- read.csv(caminho_arquivo)

    numero_casos[i] <- sum(complete.cases(dados))
  }

  data.frame(
  id = id,
  nobs = numero_casos
  )
  }
  

}