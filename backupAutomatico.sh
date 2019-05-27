data=$(date "+%d-%m-%y_%Hh%Mm")
sisOp=$(cat /etc/*release | grep ^NAME | cut -d "=" -f2 | cut -d '"' -f2)
if [$sisOp==Ubuntu]; then
	echo "Sistema: $sisOp"
else
	echo "Sistema: $sisOp"
	exit
fi
if [-e "/Backup_Apache" ]; then
	echo "O diretório existe!"
else
	echo "O diretório não existe. O diretório será criado"
	mkdir /Backup_Apache
fi
localBackup="/Backup_Apache"
varDir=("/var/log/apache2" "/var/www")
varArc=("/etc/apache2/apache2.conf" "/etc/apache2/conf-available" "/etc/apache2/conf-enabled")
bckp=("${varDir[@]}" "${varArc[@]}")
nomeArc="Apache-$data.tgz"
sudo tar -czvf ${localBackup}/${nomeArc} ${bckp[@]}
