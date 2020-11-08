FROM jekyll/jekyll
ADD . /srv/jekyll
RUN bundle install
EXPOSE 4000