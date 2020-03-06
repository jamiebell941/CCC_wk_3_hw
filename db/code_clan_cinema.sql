DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS screenings;
DROP TABLE IF EXISTS films;
DROP TABLE IF EXISTS cusomters;

CREATE TABLE films(
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  price INT
);

CREATE TABLE customers(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  funds INT
);

CREATE TABLE tickets(
  id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
  film_id INT REFERENCES films(id) ON DELETE CASCADE
);

CREATE TABLE screenings(
  id SERIAL PRIMARY KEY,
  film_id INT REFERENCES films(id) ON DELETE CASCADE,
  seats INT,
  show_time INT
);
