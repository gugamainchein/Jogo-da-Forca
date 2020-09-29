# definindo funções
def salva_rank(nome, pontos_totais)
    conteudo = "#{nome}\n#{pontos_totais}"

    # escrevendo um arquivo com o rank
    File.write "referencias/rank.txt", conteudo
end

def lendo_rank
    # lendo arquivo de texto
    conteudo = File.read "referencias/rank.txt"

    # transformando em array
    conteudo.split "\n"
end