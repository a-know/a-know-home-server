FROM 384252233704.dkr.ecr.ap-northeast-1.amazonaws.com/a-know-server-container-app:0.0.1
MAINTAINER a-know

WORKDIR /var/www/a-know-home/current

RUN bundle install -j4 --without development test

EXPOSE 3000
CMD ["bundle", "exec", "unicorn", "-c", "config/unicorn/production.rb"]
