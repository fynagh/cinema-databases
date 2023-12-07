CREATE TABLE Language (
    LanguageID NUMBER PRIMARY KEY, 
    Name VARCHAR2(100) NOT NULL
);

CREATE TABLE Cast (
	  CastID NUMBER PRIMARY KEY, 
    FirstName VARCHAR2(100) NOT NULL, 
    LastName VARCHAR2(100) NOT NULL
);

CREATE TABLE Country (
	  CountryID NUMBER PRIMARY KEY, 
    Name VARCHAR2(100) NOT NULL
);

CREATE TABLE Customer (
    CustomerID NUMBER PRIMARY KEY,
    FirstName VARCHAR2(100) NOT NULL,
    LastName VARCHAR2(100) NOT NULL,
    Email VARCHAR2(100) NOT NULL,
    Phone VARCHAR2(20) NOT NULL
);

CREATE TABLE TheaterHall (
    TheaterHallID NUMBER PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL
);

CREATE TABLE Genre (
	GenreID NUMBER PRIMARY KEY, 
    Name VARCHAR2(100) NOT NULL
);

CREATE TABLE Showtime (
	ShowtimeID NUMBER PRIMARY KEY, 
    StartTime TIMESTAMP NOT NULL
)

CREATE TABLE Theater (
    TheaterID NUMBER PRIMARY KEY, Name VARCHAR2(100) NOT NULL,
    Location VARCHAR2(255) NOT NULL,
    Capacity NUMBER NOT NULL, TheaterHalLID NUMBER NOT NULL, FOREIGN KEY (TheaterHallID) REFERENCES TheaterHall(TheaterHallID)
);

CREATE TABLE Movie (
    MovieID NUMBER PRIMARY KEY,
    Title VARCHAR2(255) NOT NULL UNIQUE,
    ReleaseDate DATE NOT NULL,
    Duration INTERVAL DAY TO SECOND NOT NULL,
    Rating NUMBER NOT NULL check(Rating>0),
    LanguageID NUMBER NOT NULL,
    GenreID NUMBER NOT NULL,
    Description CLOB NOT NULL,
    CastID NUMBER NOT NULL,
    CountryID NUMBER NOT NULL,
    AgeLimit NUMBER NOT NULL,
    FOREIGN KEY (LanguageID) REFERENCES Language(LanguageID),
    FOREIGN KEY (GenreID) REFERENCES Genre(GenreID),
    FOREIGN KEY (CastID) REFERENCES Cast(CastID),
    FOREIGN KEY (CountryID) REFERENCES Country(CountryID)
);

CREATE TABLE Ticket (
    TicketID NUMBER PRIMARY KEY,
    MovieID NUMBER NOT NULL,
    TheaterID NUMBER NOT NULL,
    ShowtimeID NUMBER NOT NULL,
    SeatNumber VARCHAR2(10) NOT NULL,
    Price NUMBER NOT NULL check(Price>0),
    CustomerID NUMBER NOT NULL,
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID),
    FOREIGN KEY (TheaterID) REFERENCES Theater(TheaterID),
    FOREIGN KEY (ShowtimeID) REFERENCES Showtime(ShowtimeID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

INSERT INTO Language (LanguageID, Name) VALUES (1, 'English');
INSERT INTO Language (LanguageID, Name) VALUES (2, 'Spanish');
INSERT INTO Language (LanguageID, Name) VALUES (3, 'Azerbaijani');
INSERT INTO Language (LanguageID, Name) VALUES (4, 'Russian');
INSERT INTO Language (LanguageID, Name) VALUES (5, 'Turkish');


INSERT INTO Cast (CastID, FirstName, LastName) VALUES (1, 'Tom', 'Hanks');
INSERT INTO Cast (CastID, FirstName, LastName) VALUES (2, 'Morgan', 'Freeman');
INSERT INTO Cast (CastID, FirstName, LastName) VALUES (3, 'Robin', 'Williams');
INSERT INTO Cast (CastID, FirstName, LastName) VALUES (4, 'Margot', 'Robbie');
INSERT INTO Cast (CastID, FirstName, LastName) VALUES (5, 'Cillian', 'Murphy');
INSERT INTO Cast (CastID, FirstName, LastName) VALUES (6, 'Leonardo', 'DiCaprio');
INSERT INTO Cast (CastID, FirstName, LastName) VALUES (7, 'Kate', 'Winslet');

INSERT INTO Country (CountryID, Name) VALUES (1, 'United States');
INSERT INTO Country (CountryID, Name) VALUES (2, 'United Kingdom');

INSERT INTO TheaterHall (TheaterHallID, Name) VALUES (1, 'Hall A');
INSERT INTO TheaterHall (TheaterHallID, Name) VALUES (2, 'Hall B');
INSERT INTO TheaterHall (TheaterHallID, Name) VALUES (3, 'Hall C');

INSERT INTO Theater (TheaterID, Name, Location, Capacity, TheaterHallID) VALUES (1, 'CinemaCity', 'City Center', 200, 1);
INSERT INTO Theater (TheaterID, Name, Location, Capacity, TheaterHallID) VALUES (2, 'MegaPlex', 'Downtown', 150, 2);
INSERT INTO Theater (TheaterID, Name, Location, Capacity, TheaterHallID) VALUES (3, 'CinemaCity1', 'City Center', 200, 1);
INSERT INTO Theater (TheaterID, Name, Location, Capacity, TheaterHallID) VALUES (4, 'MegaPlex2', 'Downtown', 150, 2);

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Phone) VALUES (1, 'John', 'Doe', 'john@example.com', '123-456-7890');
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Phone) VALUES (2, 'Jane', 'Smith', 'jane@example.com', '987-654-3210');

INSERT INTO Genre (GenreID, Name) VALUES (1, 'Drama');
INSERT INTO Genre (GenreID, Name) VALUES (2, 'Action');
INSERT INTO Genre (GenreID, Name) VALUES (3, 'Fantasy');
INSERT INTO Genre (GenreID, Name) VALUES (4, 'Comedy');
INSERT INTO Genre (GenreID, Name) VALUES (5, 'Horror');
INSERT INTO Genre (GenreID, Name) VALUES (6, 'Romance');

INSERT INTO Showtime (ShowtimeID, StartTime) VALUES (1, TIMESTAMP '2023-05-01 18:30:00');
INSERT INTO Showtime (ShowtimeID, StartTime) VALUES (2, TIMESTAMP '2023-05-01 21:00:00');
INSERT INTO Showtime (ShowtimeID, StartTime) VALUES (3, TIMESTAMP '2023-05-01 18:30:00');
INSERT INTO Showtime (ShowtimeID, StartTime) VALUES (4, TIMESTAMP '2023-05-01 21:00:00');
INSERT INTO Showtime (ShowtimeID, StartTime) VALUES (5, TIMESTAMP '2023-05-01 18:30:00');
INSERT INTO Showtime (ShowtimeID, StartTime) VALUES (6, TIMESTAMP '2023-05-01 21:00:00');

INSERT INTO Movie (MovieID, Title, ReleaseDate, Duration, Rating, LanguageID, GenreID, Description, CastID, CountryID, AgeLimit)
VALUES (2, 'The Godfather', TO_DATE('1972-03-24', 'YYYY-MM-DD'), INTERVAL '2' HOUR + INTERVAL '55' MINUTE, 9.2, 1, 2, 'The aging patriarch of an organized crime dynasty...', 2, 1, 18);
INSERT INTO Ticket (TicketID, MovieID, TheaterID, ShowtimeID, SeatNumber, Price, CustomerID) VALUES (1, 1, 1, 1, 'A1', 10.5, 1);
INSERT INTO Ticket (TicketID, MovieID, TheaterID, ShowtimeID, SeatNumber, Price, CustomerID) VALUES (2, 2, 2, 2, 'B2', 12.5, 2);
INSERT INTO Ticket (TicketID, MovieID, TheaterID, ShowtimeID, SeatNumber, Price, CustomerID) VALUES (3, 1, 1, 1, 'A1', 10.5, 1);
INSERT INTO Ticket (TicketID, MovieID, TheaterID, ShowtimeID, SeatNumber, Price, CustomerID) VALUES (4, 2, 2, 2, 'B2', 12.5, 2);


-- Insert additional data into Ticket table
INSERT INTO Ticket (TicketID, MovieID, TheaterID, ShowtimeID, SeatNumber, Price, CustomerID)
VALUES (3, 4, 1, 1, 'C3', 9, 1);

INSERT INTO Ticket (TicketID, MovieID, TheaterID, ShowtimeID, SeatNumber, Price, CustomerID)
VALUES (7, 2, 1, 1, 'A4', 14, 2);

INSERT INTO Ticket (TicketID, MovieID, TheaterID, ShowtimeID, SeatNumber, Price, CustomerID)
VALUES (5, 2, 1, 1, 'B5', 11.0, 1);

INSERT INTO Ticket (TicketID, MovieID, TheaterID, ShowtimeID, SeatNumber, Price, CustomerID)
VALUES (8, 2, 1, 5, 'C5', 11, 2);

INSERT INTO Ticket (TicketID, MovieID, TheaterID, ShowtimeID, SeatNumber, Price, CustomerID)
VALUES (9, 4, 1, 5, 'C5', 11, 2);
