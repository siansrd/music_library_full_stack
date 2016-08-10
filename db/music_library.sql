DROP TABLE albums;
DROP TABLE artists;

CREATE TABLE artists(
  id serial4 primary key,
  name VARCHAR(255)
);

CREATE TABLE albums(
  id serial4 primary key,
  name VARCHAR(255),
  artist_id int4 references artists(id)
  -- name, type, REFERECNES table(field).
  -- This checks it exists in other table.
  -- The DROP TABLE needs to be above the DROP artist because of the rerences.
);

 
