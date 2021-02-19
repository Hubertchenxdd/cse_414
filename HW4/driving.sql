-- a.

CREATE TABLE InsuranceCo (
  name VARCHAR(50) PRIMARY KEY,
  phone INT
);

CREATE TABLE Person (
  ssn INT PRIMARY KEY,
  name VARCHAR(50)
);

CREATE TABLE Vehicle (
  licensePlate VARCHAR(50) PRIMARY KEY,
  year INT,
  maxLiability REAL,
  insure_name VARCHAR(50) REFERENCES InsuranceCo,
  own_ssn INT REFERENCES Person
);

CREATE TABLE Driver (
  ssn INT REFERENCES Person,
  driverID INT,
  PRIMARY KEY (ssn)
);

CREATE TABLE NonProfessionalDriver (
  ssn INT REFERENCES Driver,
  PRIMARY KEY (ssn)
);

CREATE TABLE ProfessionalDriver (
  ssn INT REFERENCES Driver,
  medicalHistory VARCHAR(100),
  PRIMARY KEY (ssn)
);

CREATE TABLE Car (
  licensePlate VARCHAR(50) REFERENCES Vehicle,
  make VARCHAR(50),
  PRIMARY KEY (licensePlate)
);

CREATE TABLE Truck (
  licensePlate VARCHAR(50) REFERENCES Vehicle,
  capacity INT,
  operate_ssn INT REFERENCES ProfessionalDriver,
  PRIMARY KEY (licensePlate)
);

CREATE TABLE Drives (
  licensePlate VARCHAR(50) REFERENCES Car,
  ssn INT REFERENCES NonProfessionalDriver,
  PRIMARY KEY (licensePlate, ssn)
);


/*
b.
The "insure_name" attribue in the "Vehicle" table represents the relationship "insures" in the E/R diagram. Since "insures" is a many-to-one relationship, I added the "insure_name" attribue as a reference to the name of the insurance company. In this case, each vehicle can only connect to a single insurance company while an insurance company may connect to multiple vehicles.

c.
The "drives" relationship is represented using an additional table named "Drives" while the "operates" relationship is represented using a foreign key. The reason is that "drives" is a many-to-many relationship and "operates" is a many-to-one relationship.
*/
