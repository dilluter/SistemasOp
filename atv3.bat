@echo off
setlocal

rem =====================================================
rem CONFIGURAÇÃO INICIAL
rem =====================================================
set "BASE=%SystemDrive%\GestorArqSO"
set "DOC=%BASE%\DocSO"
set "LOG=%BASE%\LogsSo"
set "BACK=%BASE%\BackupsSo"
set "LOGFILE=%LOG%\atividade.log"

set /a pastas=0
set /a arquivos=0

rem =====================================================
rem CRIAÇÃO DE PASTAS
rem =====================================================

if not exist "%BASE%" (
    mkdir "%BASE%"
    set /a pastas+=1
    echo %date% %time% ; Criar pasta BASE ; Sucesso>>"%LOGFILE%"
) else (
    echo %date% %time% ; Criar pasta BASE ; JaExistia>>"%LOGFILE%"
)

if not exist "%DOC%" (
    mkdir "%DOC%"
    set /a pastas+=1
    echo %date% %time% ; Criar pasta Documentos ; Sucesso>>"%LOGFILE%"
) else (
    echo %date% %time% ; Criar pasta Documentos ; JaExistia>>"%LOGFILE%"
)

if not exist "%LOG%" (
    mkdir "%LOG%"
    set /a pastas+=1
)

if not exist "%BACK%" (
    mkdir "%BACK%"
    set /a pastas+=1
)

echo %date% %time% ; Criar pasta Logs/Backups ; Sucesso>>"%LOGFILE%"

rem =====================================================
rem CRIAÇÃO DE ARQUIVOS
rem =====================================================

if not exist "%DOC%\relatorio.txt" (
    (
    echo Relatorio de execucao do sistema
    echo Linha de exemplo
    )>"%DOC%\relatorio.txt"
    set /a arquivos+=1
)
echo %date% %time% ; Criar relatorio.txt ; Sucesso>>"%LOGFILE%"

if not exist "%DOC%\dados.csv" (
    (
    echo id;nome;valor
    echo 1;teste;100
    echo 2;abc;200
    )>"%DOC%\dados.csv"
    set /a arquivos+=1
)
echo %date% %time% ; Criar dados.csv ; Sucesso>>"%LOGFILE%"

if not exist "%DOC%\config.ini" (
    (
    echo [CONFIG]
    echo modo=producao
    echo nivel=3
    )>"%DOC%\config.ini"
    set /a arquivos+=1
)
echo %date% %time% ; Criar config.ini ; Sucesso>>"%LOGFILE%"

rem =====================================================
rem BACKUP
rem =====================================================

xcopy "%DOC%\*.*" "%BACK%\" /Y >nul
echo %date% %time% ; Copiar arquivos para backup ; Sucesso>>"%LOGFILE%"

(
echo BACKUP COMPLETO
echo Data/Hora: %date% %time%
)>"%BACK%\backup_completo.bak"

echo %date% %time% ; Criar backup_completo.bak ; Sucesso>>"%LOGFILE%"

set "BACKUPTS=%date% %time%"

rem =====================================================
rem RELATÓRIO FINAL
rem =====================================================

(
echo RELATÓRIO DE EXECUÇÃO
echo ----------------------
echo Total de arquivos criados: %arquivos%
echo Total de pastas criadas: %pastas%
echo Data/Hora do backup: %BACKUPTS%
)>"%BASE%\resumo_execucao.txt"

echo %date% %time% ; Gerar resumo_execucao.txt ; Sucesso>>"%LOGFILE%"

echo.
echo Processo concluído!
echo Relatorio em: %BASE%\resumo_execucao.txt
echo Logs em: %LOGFILE%
echo.
pause
endlocal
