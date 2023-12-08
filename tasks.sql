--Hər bir janrda ən az reytinq sahibi film hansıdır?
SELECT
    m.Title AS MovieTitle,
    g.Name AS GenreName,
    m.Rating
FROM
    Movie m
JOIN
    Genre g ON m.GenreID = g.GenreID
JOIN (
    SELECT
        GenreID,
        MIN(Rating) AS MinRating
    FROM
        Movie
    GROUP BY
        GenreID
) MinRatings ON m.GenreID = MinRatings.GenreID AND m.Rating = MinRatings.MinRating;


--İngilis dilində nümayiş olunan ən reytinqli film hansıdır?
SELECT m.Title, m.Rating FROM Movie m
JOIN Language l ON m.LanguageID = l.LanguageID WHERE l.Name = 'English'
ORDER BY m.Rating DESC FETCH FIRST 1 ROWS ONLY;


--"T" hərfi ilə başlayan filmlər və nümayiş olunduqları dilləri göstərin
SELECT
    m.Title AS MovieTitle,
    l.Name AS Language
FROM
    Movie m
JOIN
    Language l ON m.LanguageID = l.LanguageID
WHERE
     m.Title like 'T%'


--John Doe adlı müştəri ən çox hansı janrda filmə getmişdir?
SELECT
    g.Name AS GenreName,
    COUNT(*) AS NumberOfVisits
FROM
    Ticket t
JOIN
    Movie m ON t.MovieID = m.MovieID
JOIN
    Genre g ON m.GenreID = g.GenreID
JOIN
    Customer c ON t.CustomerID = c.CustomerID
WHERE
    c.FirstName = 'John' AND c.LastName = 'Doe'
GROUP BY
    g.Name
ORDER BY
    NumberOfVisits DESC
FETCH FIRST 1 ROW ONLY;


--John Doe adlı müştəri biletlərə ortalama nə qədər pul vermişdir?
SELECT
    AVG(t.Price) AS AveragePayment
FROM
    Ticket t
JOIN
    Customer c ON t.CustomerID = c.CustomerID
WHERE
    c.FirstName = 'John' AND c.LastName = 'Doe';


--Hər janr üçün biletlərin ortalama qiyməti nə qədərdi?
SELECT
    g.Name AS GenreName,
    AVG(t.Price) AS AverageTicketPrice
FROM
    Ticket t
JOIN
    Movie m ON t.MovieID = m.MovieID
JOIN
    Genre g ON m.GenreID = g.GenreID
GROUP BY
    g.Name;


--Yaş limiti 17-dən çox olan filmlər hansı dildə nümayiş olunur?
SELECT DISTINCT
    l.Name AS LanguageName
FROM
    Movie m
JOIN
    Language l ON m.LanguageID = l.LanguageID
WHERE
    m.AgeLimit > 17;


--Leonardo DiCaprio'nun oynadığı filmlər hansılardır?
SELECT
    m.Title AS MovieTitle,
    m.ReleaseDate,
    m.Duration,
    m.Rating,
    g.Name AS Genre,
    l.Name AS Language
FROM
    Movie m
JOIN
    Cast c ON m.CastID = c.CastID
JOIN
    Genre g ON m.GenreID = g.GenreID
JOIN
    Language l ON m.LanguageID = l.LanguageID
WHERE
    c.FirstName = 'Leonardo' AND c.LastName = 'DiCaprio';


--Reytinqi ən yüksək olan 5 filmdə oynayan aktyorlar kimlərdir?
SELECT
    c.FirstName,
    c.LastName,
    m.Title AS MovieTitle,
    m.Rating
FROM
    Movie m
JOIN
    Cast ca ON m.CastID = ca.CastID
JOIN
    Cast c ON ca.CastID = c.CastID
ORDER BY
    m.Rating DESC
FETCH FIRST 5 ROWS ONLY;


--Bütün filmlərin sayını hesablayın
SELECT  COUNT(*) AS TotalMovies
FROM  Movie;



--Hər janrda neçə film var?
SELECT
    g.Name AS Genre,
    COUNT(*) AS NumberOfMovies
FROM
    Movie m
JOIN
    Genre g ON m.GenreID = g.GenreID
GROUP BY
    g.Name;


--Margot Robbie`nin oynadığı və Amerika Birləşmiş Ştatları filmlərini göstərin.
SELECT
    m.MovieID,
    m.Title AS MovieTitle,
    c.FirstName AS CastFirstName,
    c.LastName AS CastLastName,
    co.Name AS Country
FROM
    Movie m
JOIN
    Cast c ON m.CastID = c.CastID
JOIN
    Country co ON m.CountryID = co.CountryID
WHERE
    c.FirstName = 'Margot'
    AND c.LastName = 'Robbie'
    AND co.Name = 'United States';

