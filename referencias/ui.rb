# definindo funções
def boas_vindas
    # printando msgs no console
    puts
    puts "        P  /_\\  P                              "
    puts "       /_\\_|_|_/_\\                             "
    puts "   n_n | ||. .|| | n_n      Bem vindo ao    "
    puts "   |_|_|nnnn nnnn|_|_|     Jogo da Forca!"
    puts "  |' '  |  |_|  |'  ' |                        "
    puts "  |_____| ' _ ' |_____|                        " 
    puts "        \\__|_|__/                              "
    puts
    puts "Qual é o seu nome?"

    # pegando o que o usuário digitar
    nome = gets.strip

    # printando msg no console
    puts "\n\nComeçaremos o jogo para você, #{nome}"

    # retornando valor para a função
    nome
end

def desenha_forca(erros)
    cabeca = "   "
    corpo = " "
    pernas = "   "
    bracos = "   "
    if erros >= 1
        cabeca = "(_)"
    end
    if erros >= 2
        bracos = " | "
        corpo = "|"
    end
    if erros >= 3
        bracos = "\\|/"
    end
    if erros >= 4
        pernas = "/ \\"
    end

    puts "  _______       "
    puts " |/      |      "
    puts " |      #{cabeca}  "
    puts " |      #{bracos}  "
    puts " |       #{corpo}  "
    puts " |      #{pernas}  "
    puts " |              "
    puts "_|___           "
    puts

end

def escolhe_palavra_secreta
    # printando msgs no console
    puts "Escolhendo uma palavra secreta..."
    puts "*Dica: é 1 das muitas linguagens de programação"
    
    # pegando o que o usuário digitar
    palavra_secreta = lendo_arquivo_de_palavras_sem_consumir_muita_memoria

    # printando msg no console
    puts "Palavra secreta com #{palavra_secreta.size} letras... Boa sorte!"

    # retornando valor para a função
    palavra_secreta
end

def quer_jogar
    # printando msg no console
    puts "Deseja jogar novamente? (S/N)"

    # pegando o que o usuário digitar
    quero_jogar = gets.strip

    # retornando booleano para a função
    quero_jogar.upcase == "S"
end

def cabecalho_de_tentativas(chutes, erros, mascara)
    # printando msgs no console
    puts "\n\n"
    desenha_forca erros
    puts "Palavra secreta: #{mascara}"
    puts "Erros até agora: #{erros}"
    puts "Chutes até agora: #{chutes}"
    puts "Entre com uma letra ou uma palavra"
end

def pede_um_chute
     # pegando o que o usuário digitar
    chute = gets.strip.downcase

    # printando msg no console
    puts "Será que acertou? Você chutou #{chute}"

    # retornando valor para a função
    chute
end

def avisa_chute_efetuado(chute)
    # printando msg no console
    puts "Você já chutou #{chute}"
end

def avisa_letra_nao_encontrada
    # printando msg no console
    puts "Letra não encontrada."
end

def avisa_letra_encontrada(total_encontrado)
    # printando msg no console
    puts "Letra encontrada #{total_encontrado} vezes."
end

def avisa_errou_palavra
    # printando msg no console
    puts "Que pena, você errou!"
end

def avisa_pontos_totais(pontos_totais)
    # printando msg no console
    puts "Você possui: #{pontos_totais} pontos."
end

def avisa_campeao_atual(dados)
    puts "Nosso campeão atual é #{dados[0]} com #{dados[1]} pontos."
end

def avisa_acertou_palavra
    puts "\nParabéns, você ganhou!"
    puts
    puts "       ___________      "
    puts "      '._==_==_=_.'     "
    puts "      .-\\:      /-.    "
    puts "     | (|:.     |) |    "
    puts "      '-|:.     |-'     "
    puts "        \\::.    /      "
    puts "         '::. .'        "
    puts "           ) (          "
    puts "         _.' '._        "
    puts "        '-------'       "
    puts
end

def avisa_pontos(pontos_ate_agora)
    # printando msg no console
    puts "Você ganhou #{pontos_ate_agora} pontos."
end