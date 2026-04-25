s:	install
	bundle exec jekyll server -H 0.0.0.0 -P 4124

install:
	bundle install
	bundle exec ruby app.rb

pub:
	-rm *index.markdown
	git status
	sleep 5
	git add .
	git commit -am 'update'
	git push
