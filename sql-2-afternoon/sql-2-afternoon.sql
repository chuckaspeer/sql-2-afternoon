--Practice Join

SELECT *
FROM Invoice i JOIN InvoiceLine il ON il.InvoiceId = i.InvoiceId
WHERE UnitPrice > 0.99;

SELECT i.InvoiceDate, c.FirstName, c.LastName, i.Total
FROM Invoice i JOIN Customer c ON i.CustomerId = c.CustomerId;

SELECT c.FirstName, c.LastName, e.FirstName, e.LastName
FROM Customer c Join Employee e ON c.SupportRepId = e.EmployeeId;

SELECT t.Title, a.name
FROM Album t JOIN Artist a ON T.AlbumId = a.ArtistId;

SELECT pt.TrackId
FROM PlaylistTrack pt JOIN Playlist p ON p.PlaylistId = pt.PlaylistId
WHERE p.Name ="Music";

SELECT t.Name
FROM Track t JOIN PlaylistTrack p ON p.TrackId = t.TrackId
WHERE p.PlaylistId = 5;

SELECT t.Name, p.Name
FROM Track t JOIN PlaylistTrack pt On t.TrackId = pt.TrackId JOIN Playlist p ON pt.PlaylistId = p.PlaylistId;

SELECT t.Name, a.Title
FROM Track t JOIN Album a ON t.AlbumId = a.AlbumId JOIN Genre g ON g.GenreId = t.GenreId;


--Practice nested queries

SELECT *
FROM Invoice
Where InvoiceId IN (SELECT InvoiceId
FROM InvoiceLine
Where UnitPRICE > 0.99 );

SELECT *
FROM PlaylistTrack
Where PlaylistId IN (SELECT PlaylistId
FROM Playlist
WHERE Name = "Music");

Select Name
from Track
Where TrackId in (Select TrackId
From PlaylistTrack
Where PlaylistId = 5);

Select *
FROM Track
Where GenreId in (Select GenreId
From Genre
where name = "Comedy");

SELECT *
FROM Track
WHERE AlbumId IN (Select AlbumId
from Album
where name ="Fireball");

SELECT *
FROM Track
WHERE AlbumId in (Select AlbumId
from Album
Where ArtistId in (Select ArtistId
from Artist
Where name ="Queen"));

--Practice updating Rows

UPDATE customer SET fax = null where fax is not null;

UPDATE customer SET Company = "self" where Company is null;

UPDATE customer SET LastName = 'Thompson' where Firstname = "Julia" AND LastName = "Barnett";

UPDATE customer SET SupportRepId = 4 WHERE Email = "luisrojas@yahoo.cl";

UPDATE track SET Composer = "The darkness around us" WHERE GenreId = (SELECT GenreId
    FROM Genre
    WHERE Name ="Metal") AND Composer is null;


--Group by

SELECT Count(*), g.Name
FROM Track t Join Genre g on t.GenreId = g.GenreId
GROUP BY g.Name;

SELECT COUNT(*), g.Name
FROM Track t JOIN Genre g ON g.GenreId = t.GenreId
WHERE g.Name = 'Pop' OR g.Name = "Rock"
Group by g.Name;

SELECT ar.Name, Count (*)
FROM Artist ar JOIN Album al ON ar.ArtistId = al.ArtistId
GROUP BY al.ArtistId;


--Use Distinct

select distinct composer
from track;

select distinct BillingPostalCode
from invoice;

select distinct company
from customer;

--Delete Rows

DELETE FROM practic_delete where Type ="bronze";

DELETE FROM practic_delete where Type ="silver";

DELETE FROM practic_delete where Value =150;


--e Commerce Simulation - No Hints

CREATE TABLE Products(
product_id INTEGER PRIMARY KEY AUTOINCREMENT,
product_name text,
product_price integer
);

CREATE TABLE Users (
user_id INTEGER PRIMARY KEY AUTOINCREMENT,
name VARCHAR
(100),
email TEXT
);
CREATE TABLE Orders(
   order_id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id REFERENCES Users
(user_id),
  product_id REFERENCES Products
(product_id)
)


insert into Products
    (product_name)
VALUES(‘ball’)

insert into Users
    (name, email)
VALUES(‘Brian’, ‘chuckaspeer@gmail.com’)

INSERT INTO Orders
    (user_id, product_id)
VALUES
    (1, 1)

insert into Products
    (product_name)
VALUES(‘horn’)

insert into Users
    (name, email)
VALUES(‘Christi’, ‘christiw@gmail.com’)

INSERT INTO Orders
    (user_id, product_id)
VALUES
    (2, 3)

insert into Products
    (product_name)
VALUES(‘book’)

insert into Users
    (name, email)
VALUES(‘Skyla’, ‘skylaS@gmail.com’)

INSERT INTO Orders
    (user_id, product_id)
VALUES
    (3, 6)




SELECT *
FROM Users




