Este projeto contém um script Batch chamado **gestor_arquivos.bat**, criado para automatizar operações básicas de um sistema de arquivos no Windows. O script executa, em ordem, a criação de diretórios, criação e escrita de arquivos, registro de atividades em log, simulação de backup e geração de um relatório final.

O script cria a estrutura:
C:\GestorArquivos
C:\GestorArquivos\Documentos
C:\GestorArquivos\Logs
C:\GestorArquivos\Backups
(ou em outro disco, dependendo da configuração). Antes de criar cada pasta, ele verifica se ela já existe.

Dentro da pasta Documentos, o script cria três arquivos:
relatorio.txt
dados.csv
config.ini
Cada arquivo recebe algumas linhas de texto usando o comando echo.

Todas as operações realizadas são registradas no arquivo:
C:\GestorArquivos\Logs\atividade.log
Cada linha contém data e hora, nome da operação e resultado (Sucesso ou Falha).

Para a simulação de backup, o script copia os arquivos de Documentos para a pasta Backups e cria o arquivo backup_completo.bak, contendo a data e hora do backup.

Ao final da execução, o script gera o arquivo resumo_execucao.txt dentro de C:\GestorArquivos. O relatório contém:
RELATÓRIO DE EXECUÇÃO
Total de arquivos criados
Total de pastas criadas
Data/Hora do backup

Este repositório deve conter o script gestor_arquivos.bat e este README para fins de verificação da atividade solicitada.
