FROM ruby:2.6
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /newapp

ENV PATH=/root/.yarn/bin:$PATH

RUN curl -o- -L https://yarnpkg.com/install.sh | bash

WORKDIR /newapp
COPY Gemfile /newapp/Gemfile
COPY Gemfile.lock /newapp/Gemfile.lock
RUN bundle install
COPY . /newapp

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]