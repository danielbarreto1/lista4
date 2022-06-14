#!/bin/bash


opc="
[R] - Digite o nome de um arquivo a ser processado.
[A] - Remova todas as letras do arquivo.
[B] - Remova todos os dígitos do arquivo.
[C] - Substitua todos os caracteres que não são letras nem dígitos do arquivo por ~.
[Q] - Sair do Script
"
function escolher_arq (){

	read -p "Informe o arquivo a ser processado: " arq
	if [ ! -e "${arq}" ]; then
		echo -e "\nArquivo Inválido\n"
	fi
}
function rmvl (){
	if [ ! -e "${arq}" ]; then
		echo -e "Informe um arquivo válido "
	else
		sed -E -e 's/[[:alpha:]]//g' < ${arq} > ${arq}-proc.txt
		echo -e "\nLetras Removidas!\n"
		echo -e "Nome do novo arquivo: ${arq}-proc.txt"
	fi
}
function rmvn (){
	if [ ! -e "${arq}" ]; then
		echo -e "Informe um arquivo válido para continuar ;)"
	else
		sed -E -e 's/[[:digit:]]//g' < ${arq} > ${arq}-proc.txt
		echo -e "\nDigítos Removidos!\n"
		echo -e "Nome do novo arquivo: ${arq}-proc.txt"
	fi
}
function subc (){
	if [ ! -e "${arq}" ]; then
		echo -e "Informe um arquivo válido: "
	else
		sed 's/[^A-Aa-z0-9_.;]/~/g' "$arq" > ${arq}-proc.txt
		echo -e "\nCaracteres Substituidos!\n"
		echo -e "Nome do novo arquivo: ${arq}-proc.txt"
	fi
}

while true; do
	echo "$opc"
	read -p "Opção escohida: " escolha
	case "$escolha" in
		"r"|"R") escolher_arq;;
		"a"|"A") rmvl;;
		"b"|"B") rmvn;;
		"c"|"C") subc;;
		"q"|"Q") exit 1;;
		*) echo "Opção Inválida";;
	esac
done
