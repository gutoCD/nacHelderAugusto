clear 
inicio(){
	controle=0
        if [$controle==0] || [$controle<=7]; then
                echo " "
                echo "Digite um número para seguir com as opcões abaixo:"
                echo " "
                echo "(1) - Verificar compatibilidade do script com o sistema;"
                echo "(2) - Instalar o Apache;"
                echo "(3) - Verificar o diretório de backup e fazer o backup inicial;"
                echo "(4) - Fazer backup do webserver;"
                echo "(5) - Mostrar o caminho do diretório de backup;"
                echo "(6) - Automatizar o script para auto execução;"
                echo "(7) - Sair do programa"
                read ver
        fi
        case $ver in
                1) verSistema; inicio ;;
                2) apache; inicio ;;
                3) verDiretorio; doBackup; inicio ;;
                4) realizeBackup; inicio ;;
                5) verPath; inicio ;;
                6) autoPes; inicio ;;
                7) echo "Programa finalizado."; exit ;;
                *) echo "Opção selecionada desconhecida."; inicio ;;
        esac
}
apache(){
    	sudo apt-get install apache2
	return inicio;
}
verSistema(){
    	sisOp=$(cat /etc/*release | grep ^NAME | cut -d "=" -f2 | cut -d '"' -f2)
    	if [$sisOp==Ubuntu]; then
    		echo "Sistema: $sisOp"
        	echo "Sistema $sisOp é compatível com o script!"
    	else
    		echo "Sistema $sisOp não é compatível."
    		exit
    	fi
}
verDiretorio(){
    	if [-e "/Backup_Apache" ]; then
    		echo "O diretório existe!"
    	else
    		echo "O diretório não existe!"
    		mkdir /Backup_Apache
		echo "Diretório criado com sucesso!"
	fi
}
realizeBackup(){
    	data=$(date "+%d-%m-%y_%Hh%Mm")
    	localBackup="/Backup_Apache"
    	varDir=("/var/log/apache2" "/var/www")
    	varArc=("/etc/apache2/apache2.conf" "/etc/apache2/conf-available" "/etc/apache2/conf-enabled")
    	bckp=("${varDir[@]}" "${varArc[@]}")
   	nomeArc="Apache-"$data".tgz"
	echo " "
	echo "Realizando backup."
	echo " "
    	sudo tar -czvf ${localBackup}/${nomeArc} ${bckp[@]}
	echo " "
	echo "Backup realizado com sucesso para a pasta $localBackup."
	echo " "
}
verPath(){
    	echo " "
    	echo "A pasta $localBackup foi criada na raiz do sistema."
    	echo " "
    	ls -l /
}
autoPes(){
	echo " "
	bb="/bin/bash"
    	echo "Será realizada a automação do script."
    	echo "Caso queira pular algumas informações como hora, minuto, entre outros, deve-se colocar asterisco (*)"
	echo " "
	read -p "Digite a hora - 0 a 23: " hora
    	read -p "Digite a minuto - 0 a 59: " min
    	read -p "Digite a Dia do Mês - 1 a 31: " ddm
    	read -p "Digite a Mês - 1 a 12: " mes
    	read -p "Digite a Dia da Semana - 0 a 6 (0 é Domingo): " dds
    	read -p "Digite a Caminho do Script de Backup Automatico: " p
    	echo " "
	echo "$min $h $ddm $mes $dds $bb $p" >> /var/spool/cron/crontabs/root
}
inicio
