# README
Hanxiao Chai (hc3445)
Weiran Wang (ww2584)
Shanshan Gong (sg3445)
Huiyuan Li (hl3700) 


We choose to use ruby 3.2.2, rails 7.1.1 in our project.

How to run the app:
cd cc 
bundle install --without production
bin/rake db:setup # shorthand for db:create, db:migrate, db:seed
bin/rails server -b 0.0.0.0

How to run the cucumber test: