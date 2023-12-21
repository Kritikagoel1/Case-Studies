-- Create Artist table
CREATE TABLE Artist (
    ArtistID INT PRIMARY KEY,
    Name VARCHAR(100),
    Biography TEXT,
    BirthDate DATE,
    Nationality VARCHAR(50),
    Website VARCHAR(255),
    ContactInformation TEXT
);

-- Create User table
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(50),
    Password VARCHAR(255),
    Email VARCHAR(100),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    ProfilePicture VARCHAR(255)
);

-- Create Artwork table
CREATE TABLE Artwork (
    ArtworkID INT PRIMARY KEY,
    Title VARCHAR(255),
    Description TEXT,
    CreationDate VARCHAR(80),
    Medium VARCHAR(50),
    ImageURL VARCHAR(255),
    ArtistID INT,
    FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID),
    FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID)
);

-- Create FavoriteArtworks table
CREATE TABLE FavoriteArtworks (
    UserID INT,
    ArtworkID INT,
    PRIMARY KEY (UserID, ArtworkID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ArtworkID) REFERENCES Artwork(ArtworkID)
);

-- Create Gallery table
CREATE TABLE Gallery (
    GalleryID INT PRIMARY KEY,
    Name VARCHAR(100),
    Description TEXT,
    Location VARCHAR(255),
    Curator INT,
    OpeningHours TEXT,
    FOREIGN KEY (Curator) REFERENCES Artist(ArtistID),
    FOREIGN KEY (Curator) REFERENCES Artist(ArtistID)
);
-- Create User_Favorite_Artwork junction table
CREATE TABLE User_Favorite_Artwork (
    UserID INT,
    ArtworkID INT,
    PRIMARY KEY (UserID, ArtworkID),
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (ArtworkID) REFERENCES Artwork(ArtworkID)
);
-- Create Artwork_Gallery junction table
CREATE TABLE Artwork_Gallery (
    ArtworkID INT,
    GalleryID INT,
    PRIMARY KEY (ArtworkID, GalleryID),
    FOREIGN KEY (ArtworkID) REFERENCES Artwork(ArtworkID),
    FOREIGN KEY (GalleryID) REFERENCES Gallery(GalleryID)
);

INSERT INTO Artist (ArtistID, Name, Biography, BirthDate, Nationality, Website, ContactInformation)
VALUES
    (1, 'Vincent van Gogh', 'Dutch post-impressionist painter.', '1853-03-30', 'Dutch', 'http://www.vangoghgallery.com/', 'Contact info for Van Gogh'),
    (2, 'Leonardo da Vinci', 'Italian polymath of the Renaissance.', '1452-04-15', 'Italian', 'http://www.leonardoda-vinci.org/', 'Contact info for Leonardo da Vinci'),
    (3, 'Frida Kahlo', 'Mexican painter known for her many portraits.', '1907-07-06', 'Mexican', 'https://www.fridakahlo.org/', 'Contact info for Frida Kahlo');

-- Insert into User table
INSERT INTO Users (UserID, Username, Password, Email, FirstName, LastName, DateOfBirth, ProfilePicture)
VALUES
    (1, 'artlover123', 'password123', 'artlover@example.com', 'John', 'Doe', '1980-01-15', 'http://example.com/profile_picture1.jpg'),
    (2, 'paintingenthusiast', 'securepass', 'enthusiast@email.com', 'Jane', 'Smith', '1992-05-22', 'http://example.com/profile_picture2.jpg'),
    (3, 'creativemind', 'mypassword', 'creative@example.com', 'Alice', 'Johnson', '1985-09-10', 'http://example.com/profile_picture3.jpg');

-- Insert into Artwork table
INSERT INTO Artwork (ArtworkID, Title, Description, CreationDate, Medium, ImageURL, ArtistID)
VALUES
    (1, 'Starry Night', 'Famous painting depicting a starry night sky.', '1889-06-18', 'Oil on canvas', 'http://example.com/starry_night.jpg', 1),
    (2, 'Mona Lisa', 'Iconic portrait of Lisa Gherardini.', '1503-1507', 'Oil on poplar panel', 'http://example.com/mona_lisa.jpg', 2),
    (3, 'The Two Fridas', 'Painting representing Kahlo''s two different personalities.', '1939', 'Oil on canvas', 'http://example.com/two_fridas.jpg', 3);

-- Insert into FavoriteArtworks table
INSERT INTO FavoriteArtworks (UserID, ArtworkID)
VALUES
    (1, 1),
    (2, 2),
    (3, 3);

-- Insert into Gallery table
INSERT INTO Gallery (GalleryID, Name, Description, Location, Curator, OpeningHours)
VALUES
    (1, 'Modern Art Gallery', 'Showcasing contemporary artworks.', '123 Main St, City, Country', 1, 'Mon-Fri: 10 AM - 6 PM'),
    (2, 'Classic Art Museum', 'Home to timeless masterpieces.', '456 Oak St, City, Country', 2, 'Tue-Sun: 9 AM - 5 PM'),
    (3, 'Local Artists Exhibit', 'Highlighting local talent.', '789 Elm St, City, Country', 3, 'Wed-Sat: 11 AM - 7 PM');

--insert into User_Favorite_Artwork
INSERT INTO User_Favorite_Artwork (UserID, ArtworkID)
VALUES
    (1, 1), 
    (1, 2),
    (2, 1); 
--insert into Artwork_Gallery
INSERT INTO Artwork_Gallery (ArtworkID, GalleryID)
VALUES
    (1, 1), 
    (2, 2), 
    (3, 1); 