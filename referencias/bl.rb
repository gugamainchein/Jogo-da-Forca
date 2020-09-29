# importando ui
require_relative 'ui'
# importando rank
require_relative 'rank'

# definindo funções
def lendo_arquivo_de_palavras
    # lendo arquivo de texto
    todas_as_palavras = File.read("referencias/dicionario.txt").split "\n"
    numero_escolhido = rand(todas_as_palavras.size)

    # .downcase -> transforma os caracteres em minúsculo
    todas_as_palavras[numero_escolhido].downcase
end

def lendo_arquivo_de_palavras_sem_consumir_muita_memoria
    # lendo arquivo de texto
    arquivo = File.new("referencias/dicionario.txt")

    # pegando uma linha do meu arquivo
    qtd_palavras = arquivo.gets.to_i

    # escolhendo número
    numero_escolhido = rand(qtd_palavras)

    # percorrendo laço
    for linha in 1..(numero_escolhido-1)
        arquivo.gets
    end

    # retorno da função
    palavra_secreta = arquivo.gets.strip.downcase

    # fechando o arquivo
    arquivo.close

    return palavra_secreta
end

def palavra_mascarada(chutes, palavra_secreta)
    # criando variável local
    mascara = ""

    # percorrendo laço
    # .chars -> qtd de caracteres do array
    for letra in palavra_secreta.chars
        # adicionando valorea à variavel da função
        if chutes.include? letra
            mascara << letra
        else
            mascara << "_"
        end
    end

    # retorno da função
    mascara
end

def pede_chute_valido(chutes, erros, mascara)
    # chamando função
    cabecalho_de_tentativas chutes, erros, mascara
    loop do
        # chamando função
        chute = pede_um_chute

        # verificando se a letra já foi citada
        if chutes.include? chute
            # chamando função
            # retorno da função
            avisa_chute_efetuado chute
        else
            # retorno da função
            return chute
        end
    end
end

def joga(nome)
    # definindo variáveis
    palavra_secreta = escolhe_palavra_secreta

    erros = 0
    chutes = []
    pontos_ate_agora = 0

    # executando 5x o jogo
    while erros < 5
        # chamando função
        mascara = palavra_mascarada chutes, palavra_secreta

        # chamando função
        chute = pede_chute_valido chutes, erros, mascara

        # acrescentando valores no array
        chutes << chute

        # condições de verificação
        chutou_uma_letra = chute.size == 1
        if chutou_uma_letra
            # definindo variáveis
            letra_procurada = chute[0]

            # .count -> conta os valores repetidos
            total_encontrado = palavra_secreta.count letra_procurada

            # condições de verificação
            if total_encontrado == 0
                # chamando função
                avisa_letra_nao_encontrada

                # somando valor na variável
                erros += 1
            else
                # chamando função
                avisa_letra_encontrada total_encontrado
            end
        else
            acertou = chute == palavra_secreta
            if acertou
                # chamando função
                avisa_acertou_palavra

                # somando valor na variável
                pontos_ate_agora += 100

                # parando o laço
                break
            else
                # chamando função
                avisa_errou_palavra

                # subtraindo valor na variável
                pontos_ate_agora -= 30

                # somando valor na variável
                erros += 1
            end
        end
    end

    # chamando função
    avisa_pontos pontos_ate_agora
    pontos_ate_agora
end

def jogo_da_forca
    # chamando as funções
    nome = boas_vindas

    if File.exist?("referencias/rank.txt")
        avisa_campeao_atual lendo_rank
    end

    # definindo valor inicial da variável
    pontos_totais = 0

    # executando o jogo enquanto o usuário quiser jogar
    loop do
        # somando valor à variável definida anteriormente
        pontos_totais += joga nome

        # chamando função
        avisa_pontos_totais pontos_totais

        if File.exist?("referencias/rank.txt")
            # condicional para sobrescrever o arquivo
            if lendo_rank[1].to_i < pontos_totais
                # chamando função
                salva_rank nome, pontos_totais
            end
        else 
            salva_rank nome, pontos_totais
        end

        break if !quer_jogar
    end
end