CREATE TABLE books (
    id SMALLSERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    publication_year INTEGER NOT NULL,
    isbn VARCHAR(20) UNIQUE
);

CREATE TABLE authors (
    id SMALLSERIAL PRIMARY KEY,
    given_name VARCHAR(100) NOT NULL,
    family_name VARCHAR(100) NOT NULL
);

CREATE TABLE aliases (
    id SMALLSERIAL PRIMARY KEY,
    author_id SMALLINT NOT NULL REFERENCES authors(id) ON DELETE CASCADE,
    given_name_equivalent VARCHAR(100) NOT NULL,
    family_name_equivalent VARCHAR(100) NOT NULL,
    UNIQUE(author_id, given_name_equivalent, family_name_equivalent)
);

CREATE TABLE book_aliases (
    book_id SMALLINT NOT NULL REFERENCES books(id) ON DELETE CASCADE,
    alias_id SMALLINT NOT NULL REFERENCES aliases(id) ON DELETE CASCADE,
    PRIMARY KEY (book_id, alias_id)
);

CREATE TABLE tags (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE books_tags (
    book_id SMALLINT NOT NULL REFERENCES books(id) ON DELETE CASCADE,
    tag_id INTEGER NOT NULL REFERENCES tags(id) ON DELETE CASCADE,
    PRIMARY KEY (book_id, tag_id)
);

CREATE TABLE readings (
    id SMALLSERIAL PRIMARY KEY,
    book_id SMALLINT NOT NULL REFERENCES books(id) ON DELETE CASCADE,
    end_date DATE NOT NULL,
    rating SMALLINT CHECK (rating >= -1 AND rating <= 2)
);