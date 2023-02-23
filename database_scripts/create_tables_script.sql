CREATE TABLE grad_information (
    grad_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    surname VARCHAR(100),
    home_location_latitude FLOAT NOT NULL,
    home_location_longitude FLOAT NOT NULL
);

CREATE TABLE hangouts (
    hangout_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    hangout_name varchar (150) NOT NULL,
    hangout_latitude FLOAT NOT NULL,
    hangout_longitude FLOAT NOT NULL
);

CREATE TABLE frequent_hangouts (
    hangout_id INT NOT NULL,
    hangout_time TIME NOT NULL,
    grad_id INT NOT NULL,

    CONSTRAINT FK_frequent_hangouts_grad_information FOREIGN KEY(grad_id)
    REFERENCES grad_information (grad_id),

    CONSTRAINT FK_frequent_hangouts_hangouts FOREIGN KEY(hangout_id)
    REFERENCES hangouts (hangout_id)
);

CREATE TABLE lookup_murder_method (
    murder_method_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    method_description varchar(250) NOT NULL
);

CREATE TABLE lookup_body_disposal_method (
    body_disposal_method_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    disposal_method_description varchar(250) NOT NULL
);

CREATE TABLE hitlist (
    hit_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    grad_id INT NOT NULL,
    murder_method_id INT NOT NULL,
    body_disposal_method_id INT NOT NULL,
    hit_completion_status BIT NOT NULL,

    CONSTRAINT FK_hitlist_grad_information FOREIGN KEY (grad_id)
    REFERENCES grad_information(grad_id),

    CONSTRAINT FK_hitlist_lookup_murder_method FOREIGN KEY (murder_method_id)
    REFERENCES lookup_murder_method (murder_method_id),

    CONSTRAINT FK_hitlist_lookup_body_disposal_method FOREIGN KEY (body_disposal_method_id)
    REFERENCES lookup_body_disposal_method (body_disposal_method_id)
);

CREATE TABLE lookup_grad_crimes (
    grad_crime_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    crime_description varchar(250) NOT NULL
);

CREATE TABLE commited_grad_crimes (
    commited_grad_crime_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    grad_crime_id INT NOT NULL,
    hit_id INT NOT NULL,

    CONSTRAINT FK_commited_grad_crimes_hitlist FOREIGN KEY (hit_id)
    REFERENCES hitlist(hit_id),

    CONSTRAINT FK_commited_grad_crimes_lookup_grad_crimes FOREIGN KEY (grad_crime_id)
    REFERENCES lookup_grad_crimes (grad_crime_id)
);