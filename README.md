Script para realizar Backup do WebServer Apache no Ubuntu

Primeiramente o script ira verificar algumas instruções com o usuario, podendo assim automatizar a ação do script, ou ainda permanecer "Manual" mesmo já sendo automatizado.

Os seguintes passos que será realizado pelo script, será para seguir uma rotina que o próprio usuario irá realizar no tempo que o mesmo achar necessário, ou simplesmente permitir que o script execute a mesma função com base na opção que o usuario escolher, executando Hora a Hora, Dia a Dia, Mês a Mês, a forma como o Usuario escolher.

É importante que ao realizaro "git clone" do arquivo, configurar o permissionamento para "chmod +x" dos arquivos ".sh", e os executar como Root.

A rotina que foi programada no script para que sempre que for executado, será de:

1: Inicialmente ira verificar quais das opções o usuario irá escolher, foi criado uma função para que, com base em um "case" seja chamado outras funções, sendo que essas informações iniciais que será necessário uma interação do usuario para seguir para o proximo passo.
