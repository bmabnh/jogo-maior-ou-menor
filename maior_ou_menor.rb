def da_boas_vindas
  puts "Bem vindo ao jogo da advinhação"
  puts "Qual é o seu nome?"
  nome = gets.strip
  puts "\n"
  puts "Começaremos o jogo para você #{nome}"
  nome
end

def pede_dificuldade
  puts "Qual o nível de dificuldade?"
  puts "(1) Muito fácil (2) Fácil (3) Normal (4) Difícil (5) Impossível"
  puts "Escolha: "
  dificuldade = gets.to_i
end

def sorteia_numero_secreto (dificuldade)
    case dificuldade
    when  1
      maximo = 30
    when  2
      maximo = 100
    when  3
      maximo = 100
    when  4
      maximo = 150
    else
      maximo = 200
    end
    puts "Escolhendo um número secreto entre 1 e #{maximo}..."
    sorteado = rand(maximo) + 1
    puts " Escolhido... que tal adivinhar o nosso numero secreto?"
    sorteado
end

def pede_um_numero (chutes,tentativa, limite_de_tentativas)
  puts "\n"
  puts "Tentativa #{tentativa} de #{limite_de_tentativas}"
  puts "Chutes até agora: #{chutes} "
  puts "Entre com um numero"
  chute = gets.strip
  puts "Será que acertou? Voce chutou #{chute}"
  chute.to_i
end

def verifica_se_acertou(numero_secreto, chute)
  acertou = numero_secreto == chute.to_i

    if acertou
        puts "Acertou"
        return true
    end
    maior = numero_secreto > chute.to_i

    if maior
        puts "O NUMERO SECRETO É MAIOR"

    else
        puts " O NUMERO SECRETO É MENOR"

    end
    return false
end

def joga (nome, dificuldade)
    numero_secreto = sorteia_numero_secreto dificuldade

  pontos_ate_agora = 1000
  limite_de_tentativas = 5
  chutes = []

  for tentativa in 1..limite_de_tentativas
      chute = pede_um_numero chutes, tentativa, limite_de_tentativas
      chutes << chute
      if nome == "Brian"
        puts "Acertou!"
        break
      end

      pontos_a_perder = (chute - numero_secreto).abs / 2.0
      pontos_ate_agora -= pontos_a_perder

      if verifica_se_acertou numero_secreto, chute
          break
      end
  end

  puts "Voce ganhou #{pontos_ate_agora} pontos"
end

def nao_quer_jogar
  puts "Deseja jogar novamento (S/N)"
  quero_jogar = gets.strip
  nao_quer_jogar = quero_jogar.upcase == "N"
end
nome = da_boas_vindas
dificuldade = pede_dificuldade
loop do
  joga nome, dificuldade
  if nao_quer_jogar
    break
  end
end
