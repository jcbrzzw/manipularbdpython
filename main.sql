-- Criando a tabela de professores
CREATE TABLE Teacher (
    TeacherID INT PRIMARY KEY,
    FirstName NVARCHAR(40) NOT NULL,
    LastName NVARCHAR(40) NOT NULL,
    Language1 NVARCHAR(3) NOT NULL,
    Language2 NVARCHAR(3),
    DOB DATE,
    TaxID INT UNIQUE,
    PhoneNo NVARCHAR(20)
);
 
-- Criando a tabela de clientes
CREATE TABLE Client (
    ClientID INT PRIMARY KEY,
    ClientName NVARCHAR(40) NOT NULL,
    Address NVARCHAR(60) NOT NULL,
    Industry NVARCHAR(20)
);
 
-- Criando a tabela de participantes
CREATE TABLE Participant (
    ParticipantID INT PRIMARY KEY,
    FirstName NVARCHAR(40) NOT NULL,
    LastName NVARCHAR(40) NOT NULL,
    PhoneNo NVARCHAR(20),
    ClientID INT
);
 
-- Criando a tabela de cursos
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName NVARCHAR(40) NOT NULL,
    Language NVARCHAR(3) NOT NULL,
    Level NVARCHAR(2),
    CourseLengthWeeks INT,
    StartDate DATE,
    InSchool BIT,
    Teacher INT,
    Client INT
);
 
-- Criando a tabela de relacionamento entre participantes e cursos
CREATE TABLE TakesCourse (
    ParticipantID INT,
    CourseID INT,
    PRIMARY KEY (ParticipantID, CourseID),
    FOREIGN KEY (ParticipantID) REFERENCES Participant(ParticipantID) ON DELETE CASCADE,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID) ON DELETE CASCADE
);
 
-- Inserindo dados na tabela de professores
INSERT INTO Teacher (TeacherID, FirstName, LastName, Language1, Language2, DOB, TaxID, PhoneNo)
VALUES
    (1, 'James', 'Smith', 'ENG', NULL, '1985-04-20', 12345, '+491774553676'),
    (2, 'Stefanie', 'Martin', 'FRA', NULL, '1970-02-17', 23456, '+491234567890'),
    (3, 'Steve', 'Wang', 'MAN', 'ENG', '1990-11-12', 34567, '+447840921333'),
    (4, 'Friederike', 'Müller-Rossi', 'DEU', 'ITA', '1987-07-07', 45678, '+492345678901'),
    (5, 'Isobel', 'Ivanova', 'RUS', 'ENG', '1963-05-30', 56789, '+491772635467'),
    (6, 'Niamh', 'Murphy', 'ENG', 'IRI', '1995-09-08', 67890, '+491231231232');

-- Inserindo dados na tabela de clientes
INSERT INTO Client (ClientID, ClientName, Address, Industry)
VALUES
    (101, 'Big Business Federation', '123 Falschungstraße, 10999 Berlin', 'NGO'),
    (102, 'eCommerce GmbH', '27 Ersatz Allee, 10317 Berlin', 'Retail'),
    (103, 'AutoMaker AG', '20 Künstlichstraße, 10023 Berlin', 'Auto'),
    (104, 'Banko Bank', '12 Betrugstraße, 12345 Berlin', 'Banking'),
    (105, 'WeMoveIt GmbH', '138 Arglistweg, 10065 Berlin', 'Logistics');

-- Inserindo dados na tabela de participantes
INSERT INTO Participant (ParticipantID, FirstName, LastName, PhoneNo, ClientID)
VALUES
    (101, 'Marina', 'Berg', '491635558182', 101),
    (102, 'Andrea', 'Duerr', '49159555740', 101),
    (103, 'Philipp', 'Probst', '49155555692', 102),
    (104, 'René', 'Brandt', '4916355546', 102),
    (105, 'Susanne', 'Shuster', '49155555779', 102),
    (106, 'Christian', 'Schreiner', '49162555375', 101),
    (107, 'Harry', 'Kim', '49177555633', 101),
    (108, 'Jan', 'Nowak', '49151555824', 101),
    (109, 'Pablo', 'Garcia', '49162555176', 101),
    (110, 'Melanie', 'Dreschler', '49151555527', 103),
    (111, 'Dieter', 'Durr', '49178555311', 103),
    (112, 'Max', 'Mustermann', '49152555195', 104),
    (113, 'Maxine', 'Mustermann', '49177555355', 104),
    (114, 'Heiko', 'Fleischer', '49155555581', 105);

-- Inserindo dados na tabela de cursos
INSERT INTO Course (CourseID, CourseName, Language, Level, CourseLengthWeeks, StartDate, InSchool, Teacher, Client)
VALUES
    (12, 'English for Logistics', 'ENG', 'A1', 10, '2020-02-01', 1, 1, 105),
    (13, 'Beginner English', 'ENG', 'A2', 40, '2019-11-12', 0, 6, 101),
    (14, 'Intermediate English', 'ENG', 'B2', 40, '2019-11-12', 0, 6, 101),
    (15, 'Advanced English', 'ENG', 'C1', 40, '2019-11-12', 0, 6, 101),
    (16, 'Mandarin für Autoindustrie', 'MAN', 'B1', 15, '2020-01-15', 1, 3, 103),
    (17, 'Français intermédiaire', 'FRA', 'B1', 18, '2020-04-03', 0, 2, 101),
    (18, 'Deutsch für Anfänger', 'DEU', 'A2', 8, '2020-02-14', 1, 4, 102),
    (19, 'Intermediate English', 'ENG', 'B2', 10, '2020-03-29', 0, 1, 104),
    (20, 'Fortgeschrittenes Russisch', 'RUS', 'C1', 4, '2020-04-08', 0, 5, 103);

-- Inserindo dados na tabela de relacionamento entre participantes e cursos
INSERT INTO TakesCourse (ParticipantID, CourseID)
VALUES
    (101, 15),
    (101, 17),
    (102, 17),
    (103, 18),
    (104, 18),
    (105, 18),
    (106, 13),
    (107, 13),
    (108, 13),
    (109, 14),
    (109, 15),
    (110, 16),
    (110, 20),
    (111, 16),
    (114, 12),
    (112, 19),
    (113, 19);
 
-- Inserindo mais 2 professores
INSERT INTO Teacher (TeacherID, FirstName, LastName, Language1, Language2, DOB, TaxID, PhoneNo)
VALUES
    (7, 'Hank', 'Dodson', 'ENG', NULL, '1991-12-23', 11111, '+491772345678'),
    (8, 'Sue', 'Perkins', 'MAN', 'ENG', '1976-02-02', 22222, '+491443456432');
