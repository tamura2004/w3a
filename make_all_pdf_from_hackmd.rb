
URLS = %w(
	5ZdQT416S2e0ME5cJvHanw
	z1srGCIZSJeI-vTnfb6nvA
	q0r18eDbQOi5JQfHmg9s3w
	xvXZrkslTFyMr5bzkJ9YfQ
	kxEOlFCeTDqbNE6kTVUemA
	xuOMPZCSSii1mYqpgLj1tw
	leMsGdPrRgCwKT8ECY8rIA
	jrUdPj3jQFiFnzxaH1ut6w
	oJom8YeWS-aE2G55g_G2-w
	MTiY2D5IRkGD42oUjxXysw
)

NAMES = %w(
	【基盤実践演習】_目次
	【基盤実践演習】7.1_コマンドプロンプトによるファイル操作
	【基盤実践演習】7.2_Powershellによるファイル操作
	【基盤実践演習】7.3_ファイル共有と排他制御
	【基盤実践演習】7.4_データベース
	【基盤実践演習】7.5_検索アルゴリズムと性能
	【基盤実践演習】8.1_プログラム
	【基盤実践演習】8.2_CPUとメモリ
	【基盤実践演習】9.1_ネットワーク
	【基盤実践演習】9.2_数式処理
)

URLS.each_with_index do |url,i|
	name = NAMES[i]
	next unless name =~ /8.2/
	`wkhtmltopdf http://localhost:3000/#{url} /home/tamura/share/pdf/#{name}.pdf`
end

# `wkhtmltopdf http://localhost:8000 /home/tamura/share/pdf/CPUシミュレータ.pdf`

