BEGIN	{
  print "Aluno:Situação:Media"
}

NR > 1 {
  mediaAlunos[$1] = ($2 + $3 + $4)/3.0
  notas_1 += $2
  notas_2 += $3
  notas_3 += $4
}

END	{
  for (aluno in mediaAlunos){
    if (mediaAlunos[aluno] >= 7) {
        printf "%s:Aprovado:%.1f\n", aluno, mediaAlunos[aluno] 
    } else if (mediaAlunos[aluno] >= 5) {
        printf "%s:Final:%.1f\n", aluno, mediaAlunos[aluno] 
    }else{
        printf "%s:Reprovado:%.1f\n", aluno, mediaAlunos[aluno] 
    }
  }

  printf "Média das provas: %.1f %.1f %.1f\n", (notas_1/(NR - 1)), (notas_2/(NR - 1)), (notas_3/(NR - 1))
}