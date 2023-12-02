@echo off
chcp 65001 > nul

setlocal enabledelayedexpansion

:: Defina a entrada e saída do arquivo
set "inputFile=C:\Users\Nuzo\Documents\DMR\teste_script\users.json"
set "outputFile=C:\Users\Nuzo\Documents\DMR\teste_script\DMRIDs.dat"

:: Limpe o arquivo de saída, se existir
if exist "%outputFile%" del "%outputFile%"

:: Use jq para extrair dados do JSON
jq -r ".users[] | \"\(.id) \(.callsign) \(.fname)\"" "%inputFile%" > "%outputFile%"

echo "Conversão concluída. Verifique o arquivo %outputFile%."
pause
