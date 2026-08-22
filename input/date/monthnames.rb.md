このスクリプトは `Date::MONTHNAMES` を参照し、`[nil, "January", ..., "December"]` の配列を取得します。先頭が nil のため添字がそのまま月番号(1〜12)に対応し、`Date::MONTHNAMES[date.month]` のように使えます。
