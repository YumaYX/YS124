このスクリプトは直接実行判定の定石 `if __FILE__ == $PROGRAM_NAME` を示します。スクリプトが `ruby xxx.rb` で起動されたときだけ本体処理を行い、他ファイルから require されたときは何もしません。Python の `if __name__ == "__main__":` に相当するイディオムです。
