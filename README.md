# Noita Backup Manager

Noitaセーブデータのバックアップマネージャです。Windows環境にのみ対応しています。

基本的に簡易的なスクリプトで、　**プログラムが最低限分かる人向けです** 。需要が多ければちゃんと作るかもしれません。

## 導入

Powershellのモジュールとして導入します。
ドキュメントフォルダ内の `WindowsPowerShell\Modules` 以下に入れてモジュールとしてロードします。

前提として、**`Git`** の導入が必要です。
powershellで以下のコマンドを叩いてください。

```ps1
cd ([Environment]::GetFolderPath('MyDocuments'))
New-Item "WindowsPowerShell\Modules" -ItemType Directory -ErrorAction SilentlyContinue
cd WindowsPowerShell\Modules
git clone "url"
cd ..
Add-Content -Path $PROFILE -Value "`nImport-Module -Name NoitaBackup`n"
```

## 簡単な解説

Powershellに詳しくない人向けの解説です。

- Powershellのモジュールとして読み込ませることで、公開関数を `Backup-Noita` と `Restore-Noita` に制限しています。
- `psd1` ファイルはモジュールマニフェストファイルです。
- `psm1` がモジュールの実体です。マニフェストの `RootModule` で読み込ませています。
- モジュール格納フォルダは `$env:PSModulePath` で確認できます。
- `$PROFILE` は基本的に `Document\WindowsPowerShell\Microsoft.PowerShell_profile.ps1` を参照します。
  - これは起動時に読み込まれるスクリプトです。 `bash` で言うところの `.bashrc` に相当します。
