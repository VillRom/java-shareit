CREATE TABLE IF NOT EXISTS users
(
    id        BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    email     VARCHAR(255),
    user_name VARCHAR(255),
    CONSTRAINT pk_users PRIMARY KEY (id),
    CONSTRAINT UQ_USER_EMAIL UNIQUE (email)
);
CREATE TABLE IF NOT EXISTS requests
(
    id BIGINT GENERATED BY DEFAULT AS IDENTITY,
    description varchar,
    created TIMESTAMP WITHOUT TIME ZONE,
    user_id BIGINT REFERENCES users(id),
    CONSTRAINT requests_pk PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS items
(
    id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    user_id BIGINT REFERENCES users(id),
    item_name varchar(100) NOT NULL,
    description varchar,
    available BOOLEAN NOT NULL,
    request_id BIGINT REFERENCES requests(id),
    CONSTRAINT item_pk PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS bookings
(
    id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    start_date TIMESTAMP WITHOUT TIME ZONE,
    end_date TIMESTAMP WITHOUT TIME ZONE,
    item_id BIGINT REFERENCES items(id),
    booker_id BIGINT REFERENCES users(id),
    status varchar,
    CONSTRAINT booking_pk PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS comments
(
    id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    comment_text varchar NOT NULL,
    item_id BIGINT REFERENCES items(id),
    author_id BIGINT REFERENCES users(id),
    created TIMESTAMP WITHOUT TIME ZONE,
    CONSTRAINT comments_pk PRIMARY KEY (id)
);