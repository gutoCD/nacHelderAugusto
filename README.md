Script para realizar Backup do WebServer Apache no Ubuntu

- O script verificará as instruções com o usuário, permitindo que o processo continue manual ou seja automatizado.

- É preciso configurar o permissionament ao efetuar o git clone do arquivo para "chmod +x" dos arquivos ".sh". 

- A rotina que foi programada no script para que sempre que for executado, será de:

1: Será verificado qual opção o usuário escolherá através de uma função. Para identificar as informações iniciais,será necessária uma interação com o usuário.

    Ações a serem tomadas:
        - Verificar se o sistema é compativel com o script;
        - Instalar o WebServer Apache;
        - Verificar se o diretório "/Backup_webServer" já existe, e se não, criar o mesmo, e é feito o Backup inicial;
        - Fazer o Backup para o diretório que foi criado;
        - Mostrar o caminho de onde foi craido o Backup;
        - Automatizar o script para executar de hora/hora, dia/dia ou mensalmente. 

2: O script executará a função que foi solicitada. Dessa forma, segue abaixo o funcionamento de cada uma delas: 

    2.1: Função "inicio()" - Executa a verificação inicial do usuário, qual será a ação que o mesmo irá tomar;
    2.2: Função "verSistema() OSMAR: seeSystem" - Verifica se o sistema operacional é compatível com o script;
    2.3: Função "apache()" - Verifica se o Apache está instalado.
    2.4: Função "verDiretorio() OSMAR: seeDir" - Verifica se o diretório "/Backup_webServer" existe para fazer os backups necessários. Caso o diretório não exista, é criado e feito o backup inicial.
    2.5: Função "realizeBackup()   OSMAR: doBackup" - Faz o backup necessário para a restauração do Apache em caso de falhas futuras, e dos arquivos de configuração do mesmo.
    2.6: Função "verPath()" - Mostra o caminho em que está localizado o diretório do backup.
    2.7: Função "autoPes()   OSMAR: autoScr()" - Cria a automação do script para executar automanticamente, dependendo do qual o usuário escolheu. É necessário indicar todo o caminho até o arquivo, e o script para simplesmente executar a automação é o "/backup_aut.sh" ao colocar o nome dele na indicação do local, o script será executado automaticamente de acordo com o agendamento.
