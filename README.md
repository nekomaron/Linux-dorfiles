# パソコンシステム全般設定
## 各設定ファイルについて
|ファイル名|ソフト|対象PC|内容|
|---|---|---|---|
|bin|bash|all|bashの設定というより基本的な実用用|
|hypr|hyperland|Desktop|デスクトップ専用のDE|
|nri|niri|Laptop|ラップトップ専用のDE|
|mako|mako|All|通知センター用|
|kitty|kitty|All|ターミナル|
|nix|nix|ALL|Nixマネージャー用|
|nvim-src|neovim|All|neovimの接待ファイル本体はNixで制御|
|waybar|waybar|Desktop|waybar専用|
|wireplumber|wireplumber|Desktop|出力先の調整用|

## TUI Toolについて
使用しているTUI(Text User Interface)ツールについてまとめた
### 📶bluetuith
GUIを用いずに ターミナル上でBluetoothデバイスのペアリングや接続切り替えを完結させるツール

起動方法　``bluetuith`` 
 
 - 主な操作方法
    - 矢印キー（↑ / ↓） または k / j: デバイスリストの移動
    - Enter: 選択したデバイスに接続 / 切断
    - p: ペアリングを開始
    - t: 信頼（Trust）するデバイスとしてマーク
    - s: 新しいデバイスのスキャン（探索）を開始 / 停止
    - Esc または q: ツールを終了

### 🔊wiremix
PipeWire環境のオーディオ入力・出力を直感的にコントロールする、軽量なオーディオミキサー

起動方法　``wiremix``

 - 主な操作方法:
    - 矢印キー（← / →） または h / l: コントロール（音量スライダーやデバイス）の選択切り替え
    - 矢印キー（↑ / ↓） または k / j: 選択しているデバイスの音量調節（上下）
    - m: ミュート（消音）の切り替え
    - q または Ctrl + C: ツールを終了

### 🔌nmtui
ネットワークマネージャー
起動方法　``nmtui``

