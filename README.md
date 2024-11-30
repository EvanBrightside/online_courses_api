# Online Courses API

This is a prototype API-only application for managing online courses, authors, and competencies. It provides CRUD operations for these entities and is built with Ruby on Rails.

## Features

- Manage Courses, Authors, and Competencies
- API documentation with Swagger UI
- Dockerized setup for easy deployment
- PostgreSQL as the database

## Technology Stack

- **Ruby**: 3.2.2
- **Rails**: 7.0
- **PostgreSQL**: 16
- **Swagger**: API documentation
- **Docker**: Deployment

## Setup Instructions

### Prerequisites

- Docker and Docker Compose installed
- Ruby (if running locally without Docker)

### Running the Application

1. Clone the repository:

   ```bash
   git clone https://github.com/EvanBrightside/online_courses_api.git
   cd online_courses_api
   ```

2. Build and run the application using Docker:

   ```bash
   docker-compose up -d --build
   ```

3. To populate the database with initial data:

   ```bash
   docker-compose run --rm app rails db:seed
   ```

4. Run the RSpec tests

   ```bash
   docker-compose run --rm -e RAILS_ENV=test app bundle exec rspec
   ```

5. The application will be available at:
   - **Swagger UI**: [http://localhost:3000/api-docs/index.html](http://localhost:3000/api-docs/index.html)
   - **API Base URL**: [http://localhost:3000](http://localhost:3000)

### Running Locally Without Docker

1. Install dependencies:

   ```bash
   bundle install
   ```

2. Setup the database:

   ```bash
   rails db:create db:migrate db:seed
   ```

3. Start the Rails server:

   ```bash
   rails s
   ```

4. Access the application:
   - **Swagger UI**: [http://localhost:3000/api-docs/index.html](http://localhost:3000/api-docs/index.html)
   - **API Base URL**: [http://localhost:3000](http://localhost:3000)

## API Documentation

Swagger UI provides an interactive API documentation. Access it at:
[http://localhost:3000/api-docs/index.html](http://localhost:3000/api-docs/index.html)

### Generating Swagger Documentation

To regenerate the Swagger documentation after updating your API specs:

```bash
rake rswag:specs:swaggerize
```

## Running Tests

Run the RSpec tests to ensure the API works as expected:

```bash
rspec
```

## Seed Data

To populate the database with initial data:

```bash
rails db:seed
```

## Project Structure

- `app/controllers`: API controllers
- `app/models`: Data models
- `spec/`: Tests and Swagger specifications
- `swagger/`: Swagger YAML files
