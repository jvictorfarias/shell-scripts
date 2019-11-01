{
  for (i = 1; i <= NF; i++){
    gsub(/[[:punct:]]/, "")
    vector[$(i)] += 1;
    counter += 1
  }
}

END	{
  for (word in vector) {
    printf word ":\t" vector[word] "\n" | "sort"
  }

  printf "Total de Palavras Analisadas: " counter "\n"
}