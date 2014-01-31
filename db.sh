rake db:drop
sudo -u postgres psql -c 'create database blog_development;'
#sudo -u postgres psql -c 'create database blog_test;'
rake db:migrate
rake db:seed
