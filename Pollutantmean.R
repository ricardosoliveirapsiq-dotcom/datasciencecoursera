pollutantmean <- function(directory, pollutant, id) {
  
  arquivos <- list.files(directory)
  
  arquivos_selecionados <- arquivos[id]
  
  dados_lista <- vector("list", length(arquivos_selecionados))
  
  valores_lista <- vector("list", length(arquivos_selecionados))
  
  for (i in seq_along(arquivos_selecionados)) {
    
    caminho_arquivo <- file.path(directory, arquivos_selecionados[i])
    
    dados_lista[[i]] <- read.csv(caminho_arquivo)
    
    valores_lista[[i]] <- dados_lista[[i]][[pollutant]]
  }
  
  valores_combinados <- unlist(valores_lista)
  
  mean(valores_combinados, na.rm = TRUE)
}
