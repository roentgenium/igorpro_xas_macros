Author: ASAKURA, Hiroyuki (asakura AT moleng DOT kyoto-u DOT ac DOT jp)
Version: 0.9

この Igor Procedure 群は Igor Pro において、できるだけ楽に XAFS スペクトルをインポートするために作られました。
現在は REX2000, Athena の XAFS ファイル読み込みが主な機能です。現在も少しずつ機能が追加されています。
お使いの方の中で、ご自身で追加した機能、あるいは追加して欲しい機能がある場合はよろしければ朝倉までご連絡ください。

重要

このマクロ群は無保証で提供、配布されます。このマクロを利用することで受けたすべての影響について使用者が責任を負うものとします。

主な機能

REX2000 のファイル形式である .rex および .xan ファイルを読み込む
Athena の出力ファイル形式である .nor, .rsp, .chi3, .chik, .chir ファイルを読み込む
XANES 計算ソフトである FDMNES の計算結果 _conv.txt を読み込む

使い方

展開してでてきたXAFSフォルダを
C:\Program Files\WaveMetrics\Igor Pro Folder\Igor Procedures (Windows XP + Igor 5 の場合)
あるいは
%USERPROFILE%\Documents\WaveMetrics\Igor Pro 6 User Files\Igor Procedures (Windows 7 + Igor 6 の場合)
にコピーしてIgor Proを起動してください。

XAFSというメニューが現れます。
REX2000のファイル形式である.xanと.rexを読み込むことができます。
ファイル名から自動的にwave名を決定します。
読み込み方は直観的にわかると思います。

例: XANESファイルの読み込み

XAFS > Loading REX2000 files > Load .xan file
をクリックすると、
ファイル選択ウィンドウが出てきます。読み込みたい.xanファイルを選択してください。
読み込んだファイル名がexample.xanの場合

x_example: バックグラウンドが差し引かれたXANESスペクトルのx軸（X線のエネルギー）の値を含んだ一次元wave
y_example: バックグラウンドが差し引かれたXANESスペクトルのy軸（吸収強度）の値を含んだ一次元wave

の2つが読み込まれます。

例: EXAFSファイルの読み込み

注意：このマクロで.rexファイルを読み込む場合、REX2000において、カーブフィッティングまで処理し終えている必要があります。

XANESファイルの場合と同様に
XAFS > Loading REX2000 files > Load .rex file
から読み込みたい.rexファイルを選択。
読み込んだファイル名がexample.xanの場合

d_FT_example:    フーリエ変換後のEXAFSスペクトルのx軸（散乱原子からの距離）
i_FT_example:    フーリエ変換後のEXAFSスペクトルのy軸（虚数部）
p_FT_example:    フーリエ変換後のEXAFSスペクトルのy軸（パワースペクトル）
r_FT_example:    フーリエ変換後のEXAFSスペクトルのy軸（実数部）
x_BFT_example:   逆フーリエ変換後のEXAFSスペクトルのx軸
x_CF_example:    フーリエ変換後のEXAFSスペクトルに対するカーブフィッティングのx軸（散乱原子からの距離）
x_CHI_example:   chi(k)に対するk
x_ED_example:    k^3chi(k)のx軸
y_BFTCF_example: 逆フーリエ変換後のEXAFSスペクトルに対するカーブフィッティングのy軸
y_BFT_example:   逆フーリエ変換後のEXAFSスペクトルのx軸
y_CF_example:    フーリエ変換後のEXAFSスペクトルに対するカーブフィッティングのy軸（パワースペクトル）
y_CHI_example:   chi(k)
y_ED_example:    k^3chi(k)のy軸

が読み込まれます。

REX2000以外のソフトでEXAFSスペクトルを処理し、得られたスペクトルをREX2000形式にしてからIgor Proに読み込む場合、
Load .rex file (extracted)
が使えるかもしれません

その他の読み込み機能も基本的には同様に使えます。

現在の制限

ファイル名が非常に長い場合、読み込みに失敗します。
この場合はファイル名を変更してから読み込んでください。
