#
# モジュール 'NoitaBackup' のモジュール マニフェスト
#
# 生成者: Kokonoe
#
# 生成日: 2025/04/04
#

@{

# このマニフェストに関連付けられているスクリプト モジュール ファイルまたはバイナリ モジュール ファイル。
RootModule = 'NoitaBackup.psm1'

# このモジュールのバージョン番号です。
ModuleVersion = '1.0.0'

# サポートされている PSEditions
# CompatiblePSEditions = @()

# このモジュールを一意に識別するために使用される ID
GUID = '2fbe6c21-453a-407f-9ca5-ed0331391e6f'

# このモジュールの作成者
Author = 'Kokonoe'

# Company or vendor of this module
#CompanyName = 'Unknown'

# このモジュールの著作権情報
Copyright = '(c) 2025 Kokonoe. All rights reserved.'

# このモジュールの機能の説明
# Description = ''

# このモジュールに必要な Windows PowerShell エンジンの最小バージョン
# PowerShellVersion = ''

# このモジュールに必要な Windows PowerShell ホストの名前
# PowerShellHostName = ''

# このモジュールに必要な Windows PowerShell ホストの最小バージョン
# PowerShellHostVersion = ''

# このモジュールに必要な Microsoft .NET Framework の最小バージョン。 この前提条件は、PowerShell Desktop エディションについてのみ有効です。
# DotNetFrameworkVersion = ''

# このモジュールに必要な共通言語ランタイム (CLR) の最小バージョン。 この前提条件は、PowerShell Desktop エディションについてのみ有効です。
# CLRVersion = ''

# このモジュールに必要なプロセッサ アーキテクチャ (なし、X86、Amd64)
# ProcessorArchitecture = ''

# このモジュールをインポートする前にグローバル環境にインポートされている必要があるモジュール
# RequiredModules = @()

# このモジュールをインポートする前に読み込まれている必要があるアセンブリ
# RequiredAssemblies = @()

# このモジュールをインポートする前に呼び出し元の環境で実行されるスクリプト ファイル (.ps1)。
# ScriptsToProcess = @()

# このモジュールをインポートするときに読み込まれる型ファイル (.ps1xml)
# TypesToProcess = @()

# このモジュールをインポートするときに読み込まれる書式ファイル (.ps1xml)
# FormatsToProcess = @()

# RootModule/ModuleToProcess に指定されているモジュールの入れ子になったモジュールとしてインポートするモジュール
# NestedModules = @()

# このモジュールからエクスポートする関数です。最適なパフォーマンスを得るには、ワイルドカードを使用せず、エクスポートする関数がない場合は、エントリを削除しないで空の配列を使用してください。
FunctionsToExport = @(
    'Backup-Noita',
    'Restore-Noita'
)

# このモジュールからエクスポートするコマンドレットです。最適なパフォーマンスを得るには、ワイルドカードを使用せず、エクスポートするコマンドレットがない場合は、エントリを削除しないで空の配列を使用してください。
#CmdletsToExport = @()

# このモジュールからエクスポートする変数
#VariablesToExport = '*'

# このモジュールからエクスポートするエイリアスです。最適なパフォーマンスを得るには、ワイルドカードを使用せず、エクスポートするエイリアスがない場合は、エントリを削除しないで空の配列を使用してください。
#AliasesToExport = @()

# このモジュールからエクスポートする DSC リソース
# DscResourcesToExport = @()

# このモジュールに同梱されているすべてのモジュールのリスト
# ModuleList = @()

# このモジュールに同梱されているすべてのファイルのリスト
# FileList = @()

# RootModule/ModuleToProcess に指定されているモジュールに渡すプライベート データ。これには、PowerShell で使用される追加のモジュール メタデータを含む PSData ハッシュテーブルが含まれる場合もあります。
PrivateData = @{

    PSData = @{

        # このモジュールに適用されているタグ。オンライン ギャラリーでモジュールを検出する際に役立ちます。
        # Tags = @()

        # このモジュールのライセンスの URL。
        # LicenseUri = ''

        # このプロジェクトのメイン Web サイトの URL。
        # ProjectUri = ''

        # このモジュールを表すアイコンの URL。
        # IconUri = ''

        # このモジュールの ReleaseNotes
        # ReleaseNotes = ''

    } # PSData ハッシュテーブル終了

} # PrivateData ハッシュテーブル終了

# このモジュールの HelpInfo URI
# HelpInfoURI = ''

# このモジュールからエクスポートされたコマンドの既定のプレフィックス。既定のプレフィックスをオーバーライドする場合は、Import-Module -Prefix を使用します。
# DefaultCommandPrefix = ''

}

