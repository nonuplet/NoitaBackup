$NOITA_BACKUP_VERSION = "v1.0.0"
$SavePath = Join-Path $env:USERPROFILE "AppData\LocalLow\Nolla_Games_Noita\save00"
$DefaultBackupPath = "D:\Documents\noita"

# ディレクトリの存在チェック
function _Check-Directory {
    param(
        [string]$BackupPath = $DefaultBackupPath
    )

    # noitaのセーブフォルダ
    if (-not (Test-Path -Path $SavePath -PathType Container)) {
        Write-Error "Noitaのセーブデータ保存フォルダ: '$SavePath' がありません。"
        return $false
    }

    # バックアップ先
    if (Test-Path -Path $BackupPath -PathType Container) {
        return $true
    }

    Write-Host "バックアップ先フォルダ '$BackupPath' がありません。"
    $createDir = Read-Host "'$BackupPath' を作成しますか？ [Y/n] "
    if (-not ($createDir -ieq "y" -or $createDir -eq "")) {
        Write-Host "バックアップ先を作成しません。プログラムを終了します。"
        return $false
    }
    try {
        New-Item -Path $BackupPath -ItemType Directory -Force | Out-Null
        if (Test-Path -Path $BackupPath -PathType Container) {
            Write-Host "'$BackupPath' を作成しました。"
        } else {
            Write-Error "'$BackupPath' の作成中にエラーが発生しました。"
            return $false
        }
    } catch {
        Write-Error "'$BackupPath' の作成中にエラーが発生しました。"
        return $false
    }
}

# 最終更新日時のチェック
# CopyToの方が新しかった場合、falseを返す
function _Check-LastWriteTime {
    param(
        [string]$CopyFromPath,
        [string]$CopyToPath
    )

    # from
    $CopyFromExists = Test-Path -Path $CopyFromPath -PathType Container
    if (-not $CopyFromExists) {
        throw [System.IO.DirectoryNotFoundException]::new("コピー元のディレクトリがありません。")
    }
    $CopyFrom = Get-Item -Path $CopyFromPath
    $CopyFromLastWrite = $CopyFrom.LastWriteTime.ToString("yyyy-MM-dd HH:mm:ss")

    # to
    $CopyToExists = Test-Path -Path $CopyToPath -PathType Container
    $CopyTo = $Null
    $CopyToLastWrite = "not found"
    if ($CopyToExists) {
        $CopyTo = Get-Item -Path $CopyToPath
        $CopyToLastWrite = $CopyTo.LastWriteTime.ToString("yyyy-MM-dd HH:mm:ss")
    }

    # 更新日時の比較
    $result = $true
    if ($CopyToExists) {
        $result = ($CopyFrom.LastWriteTime -gt $CopyTo.LastWriteTime)
    }

    # 比較表示
    if ($result) {
        Write-Host "[latest]" -NoNewLine -ForegroundColor "Red"
        Write-Host " $CopyFromPath ($CopyFromLastWrite)"
    } else {
        Write-Host "$CopyFromPath ($CopyFromLastWrite)"
    }
    Write-Host "   |`n   |`n   V"
    if (-not ($result)) {
        Write-Host "[latest] " -ForegroundColor "Red" -NoNewLine
        Write-Host "$CopyToPath ($CopyToLastWrite)`n" 
    } else {
        Write-Host "$CopyToPath ($CopyToLastWrite)`n"
    }

    return $result
}

function _Write-Title-Message {
    Write-Host "`n   Noita Backup Manager '$NOITA_BACKUP_VERSION'   `n" -ForegroundColor "White" -BackgroundColor "Blue"
}

function Backup-Noita {
    param(
        [string]$BackupPath = $DefaultBackupPath
    )

    _Write-Title-Message
    if (-not (_Check-Directory)) {
        return
    }

    $BackupPath = Join-Path $BackupPath "backup"
    $IsSourceNewer = _Check-LastWriteTime -CopyFrom $SavePath -CopyTo $BackupPath

    $IsBackup = $false
    if($IsSourceNewer) {
        $BackupInput = Read-Host "セーブデータのバックアップを実行しますか？ [Y/n] "
        $IsBackup = ($BackupInput -ieq "y" -or $BackupInput -eq "")
    } else {
        Write-Host "保存済みバックアップを古いデータで上書きしようとしています！" -ForegroundColor "Red"
        $BackupInput = Read-Host "上書きしますか？ [y/N] "
        $IsBackup = ($BackupInput -ieq "y")
    }

    if ($IsBackup) {
        Write-Host "コピー実行中..." -ForegroundColor "Gray"
        if (Test-Path -Path $BackupPath -PathType Any) {
            Remove-Item $BackupPath -Recurse -Force
        }
        Copy-Item $SavePath -Destination $BackupPath -Recurse -Force
        Write-Host "コピーが完了しました。`n"
    } else {
        Write-Host "バックアップを中止しました。`n"
    }
}

function Restore-Noita {
    param(
        [string]$BackupPath = $DefaultBackupPath
    )

    _Write-Title-Message
    if (-not (_Check-Directory)) {
        return
    }

    $BackupPath = Join-Path $BackupPath "backup"
    _Check-LastWriteTime -CopyFrom $BackupPath -CopyTo $SavePath | Out-Null

    $RestoreInput = Read-Host "バックアップから復元しますか？ [Y/n] "
    $IsRestore = ($RestoreInput -ieq "y" -or $RestoreInput -eq "")
    if ($IsRestore) {
        Write-Host "復元実行中..." -ForegroundColor "Gray"
        if (Test-Path -Path $SavePath -PathType Any) {
            Remove-Item $SavePath -Recurse -Force
        }
        Copy-Item $BackupPath -Destination $SavePath -Recurse -Force
        Write-Host "復元が完了しました。`n"

    } else {
        Write-Host "復元を中止しました。`n"
    }

}
