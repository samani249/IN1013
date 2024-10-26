USE pet_database;

-- 1. Insert into events table the information ‘Fluffy’, ‘2020-10-15’, ‘vet’, ‘antibiotics’.
INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Fluffy', '2020-10-15', 'vet', 'antibiotics');

-- 2. Insert into events table the information ‘Hammy’, ‘2020-10-15’, ‘vet’, ‘antibiotics’.
-- Note: Hammy is a male ‘hamster’ of ‘Diane’ which was born on 2010-10-30 and STILL DIDN’T DIE.
INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Hammy', '2020-10-15', 'vet', 'antibiotics');

-- 3. It appeared that Fluffy had 5 kittens 2 of which are male.
INSERT INTO petPet (petname, owner, species, gender, birth)
VALUES ('Kitten1', 'Fluffy', 'cat', 'M', '2020-10-01'),
       ('Kitten2', 'Fluffy', 'cat', 'M', '2020-10-01'),
       ('Kitten3', 'Fluffy', 'cat', 'F', '2020-10-01'),
       ('Kitten4', 'Fluffy', 'cat', 'F', '2020-10-01'),
       ('Kitten5', 'Fluffy', 'cat', 'F', '2020-10-01');

-- 4. Also, on “1997-08-03” it was Claws who broke the rib.
INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Claws', '1997-08-03', 'injury', 'broke rib');

-- 5. Unfortunately, Puffball died on ‘2020-09-01’.
UPDATE petPet
SET death = '2020-09-01'
WHERE petname = 'Puffball';

-- 6. Harold asked me to remove his dog from my database due to GDPR.
DELETE FROM petPet
WHERE owner = 'Harold' AND species = 'dog';