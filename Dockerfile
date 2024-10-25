# Use a lightweight Ruby image
FROM ruby:3.2.0-alpine

# Set the working directory
WORKDIR /app

# Copy the Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install dependencies
RUN gem install bundler
RUN bundle install

# Copy the rest of the application
COPY . .

# Expose the port for the Rails server
EXPOSE 8899

# Set environment variables (adjust as needed)
ENV RAILS_ENV=development

# Command to run the Rails server
CMD ["bin/rails", "server"]