s:	install
	bundle exec jekyll server -H 0.0.0.0 -P 4124

genmd:
	ruby rb2md.rb

install:
	bundle install
	bundle exec ruby app.rb

pub:
	git status
	sleep 5
	git add .
	git commit -am 'update'
	git push
