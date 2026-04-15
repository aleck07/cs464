-- CS464 Seed Data
-- Run this in the Supabase SQL editor AFTER running schema.sql
-- This inserts all the JSON data we have currently

-- bh_legends
WITH ins AS (
    INSERT INTO datasets (name, title, description)
    VALUES ('bh_legends', 'Brawlhalla Legends', 'Put the legends in order by chronological order they were added to the Game')
    RETURNING id
)
INSERT INTO dataset_items (dataset_id, name, order_index)
SELECT ins.id, v.name, v.order_index
FROM ins, (VALUES
    ('Bodvar', 1),
    ('Cassidy', 2),
    ('Orion', 3),
    ('Lord Vraxx', 4),
    ('Gnash', 5),
    ('Queen Nai', 6),
    ('Hattori', 7),
    ('Sir Roland', 8),
    ('Scarlet', 9),
    ('Thatch', 10),
    ('Ada', 11),
    ('Sentinel', 12),
    ('Lucien', 13),
    ('Teros', 14),
    ('Brynn', 15),
    ('Asuri', 16),
    ('Barraza', 17),
    ('Ember', 18),
    ('Azoth', 19),
    ('Koji', 20),
    ('Ulgrim', 21),
    ('Diana', 22),
    ('Jhala', 23),
    ('Kor', 24),
    ('Wu Shang', 25),
    ('Val', 26),
    ('Ragnir', 27),
    ('Cross', 28),
    ('Mirage', 29),
    ('Nix', 30),
    ('Mordex', 31),
    ('Yumiko', 32),
    ('Artemis', 33),
    ('Caspian', 34),
    ('Sidra', 35),
    ('Xull', 36),
    ('Kaya', 37),
    ('Isaiah', 38),
    ('Jiro', 39),
    ('Lin Fei', 40),
    ('Zariel', 41),
    ('Rayman', 42),
    ('Dusk', 43),
    ('Fait', 44),
    ('Thor', 45),
    ('Petra', 46),
    ('Vector', 47),
    ('Volkov', 48),
    ('Onyx', 49),
    ('Jaeyun', 50),
    ('Mako', 51),
    ('Magyar', 52),
    ('Reno', 53),
    ('Munin', 54),
    ('Arcadia', 55),
    ('Ezio', 56),
    ('Tezca', 57),
    ('Thea', 58),
    ('Red Raptor', 59),
    ('Loki', 60),
    ('Seven', 61),
    ('Vivi', 62),
    ('Imugi', 63),
    ('King Zuva', 64),
    ('Priya', 65),
    ('Ransom', 66),
    ('Lady Vera', 67),
    ('Rupture', 68)
) AS v(name, order_index);

-- bird_population
WITH ins AS (
    INSERT INTO datasets (name, title, description)
    VALUES ('bird_population', 'Bird Populations', 'Put the birds in order by population (most common first).')
    RETURNING id
)
INSERT INTO dataset_items (dataset_id, name, order_index)
SELECT ins.id, v.name, v.order_index
FROM ins, (VALUES
    ('House Sparrow', 1),
    ('European Starling', 2),
    ('Rock Pigeon', 3),
    ('Barn Swallow', 4),
    ('Red-billed Quelea', 5),
    ('Common Grackle', 6),
    ('American Robin', 7),
    ('Red-winged Blackbird', 8),
    ('Yellow-rumped Warbler', 9),
    ('Common Blackbird', 10),
    ('White Wagtail', 11),
    ('Song Sparrow', 12),
    ('Brown-headed Cowbird', 13),
    ('Canada Goose', 14),
    ('Mallard', 15),
    ('Great-tailed Grackle', 16),
    ('House Finch', 17),
    ('Northern Cardinal', 18),
    ('American Crow', 19),
    ('Black-capped Chickadee', 20),
    ('European Goldfinch', 21),
    ('Cliff Swallow', 22),
    ('Tree Sparrow', 23),
    ('Zebra Finch', 24),
    ('Common Waxbill', 25)
) AS v(name, order_index);

-- console_release
WITH ins AS (
    INSERT INTO datasets (name, title, description)
    VALUES ('console_release', 'Game Consoles', 'Put the game consoles in order by release year (earliest first).')
    RETURNING id
)
INSERT INTO dataset_items (dataset_id, name, order_index)
SELECT ins.id, v.name, v.order_index
FROM ins, (VALUES
    ('Magnavox Odyssey', 1),
    ('Magnavox Odyssey 100', 2),
    ('Magnavox Odyssey 200', 3),
    ('Magnavox Odyssey 300', 4),
    ('Magnavox Odyssey 400', 5),
    ('Magnavox Odyssey 500', 6),
    ('Magnavox Odyssey 2000', 7),
    ('Magnavox Odyssey 3000', 8),
    ('Magnavox Odyssey 4000', 9),
    ('Atari Pong (Home Pong)', 10),
    ('Coleco Telstar', 11),
    ('Fairchild Channel F', 12),
    ('Atari 2600', 13),
    ('Magnavox Odyssey²', 14),
    ('Intellivision', 15),
    ('ColecoVision', 16),
    ('Atari 5200', 17),
    ('Nintendo Entertainment System (NES)', 18),
    ('Sega Master System', 19),
    ('Atari 7800', 20),
    ('TurboGrafx-16 (PC Engine)', 21),
    ('Sega Genesis (Mega Drive)', 22),
    ('Sega CD', 23),
    ('Philips CD-i', 24),
    ('Neo Geo AES', 25),
    ('Super Nintendo Entertainment System (SNES)', 26),
    ('3DO Interactive Multiplayer', 27),
    ('Atari Jaguar', 28),
    ('Amiga CD32', 29),
    ('Sega 32X', 30),
    ('Sega Saturn', 31),
    ('PlayStation', 32),
    ('Nintendo 64', 33),
    ('Nuon', 34),
    ('Dreamcast', 35),
    ('PlayStation 2', 36),
    ('GameCube', 37),
    ('Xbox', 38),
    ('Gizmondo', 39),
    ('Xbox 360', 40),
    ('PlayStation 3', 41),
    ('Wii', 42),
    ('Wii U', 43),
    ('OUYA', 44),
    ('PlayStation 4', 45),
    ('Xbox One', 46),
    ('Xbox One S', 47),
    ('PlayStation 4 Pro', 48),
    ('Xbox One X', 49),
    ('Valve Steam Machine (Platform)', 50),
    ('NES Classic Edition (NES Mini)', 51),
    ('SNES Classic Edition', 52),
    ('PlayStation Classic', 53),
    ('Sega Genesis Mini', 54),
    ('TurboGrafx-16 Mini', 55),
    ('Sega Genesis Mini 2', 56),
    ('Atari VCS (2021)', 57),
    ('Nintendo Switch', 58),
    ('PlayStation 5', 59),
    ('PlayStation 5 Pro', 60),
    ('Xbox Series X/S', 61),
    ('(NEW) Steam Machine', 62)
) AS v(name, order_index);

-- countries_area
WITH ins AS (
    INSERT INTO datasets (name, title, description)
    VALUES ('countries_area', '20 Largest Countries by Land Area', 'Put these countries in order by total land area (largest first).')
    RETURNING id
)
INSERT INTO dataset_items (dataset_id, name, order_index)
SELECT ins.id, v.name, v.order_index
FROM ins, (VALUES
    ('Russia', 1),
    ('Canada', 2),
    ('United States', 3),
    ('China', 4),
    ('Brazil', 5),
    ('Australia', 6),
    ('India', 7),
    ('Argentina', 8),
    ('Kazakhstan', 9),
    ('Algeria', 10),
    ('DR Congo', 11),
    ('Saudi Arabia', 12),
    ('Mexico', 13),
    ('Indonesia', 14),
    ('Sudan', 15),
    ('Libya', 16),
    ('Iran', 17),
    ('Mongolia', 18),
    ('Peru', 19),
    ('Chad', 20)
) AS v(name, order_index);

-- dragon_quest
WITH ins AS (
    INSERT INTO datasets (name, title, description)
    VALUES ('dragon_quest', 'Dragon Quest Series', 'Put the games in order by in-world chronology, not release date.')
    RETURNING id
)
INSERT INTO dataset_items (dataset_id, name, order_index)
SELECT ins.id, v.name, v.order_index
FROM ins, (VALUES
    ('Dragon Quest 11', 1),
    ('Dragon Quest 3', 2),
    ('Dragon Quest', 3),
    ('Dragon Quest 2', 4),
    ('Dragon Quest 6', 5),
    ('Dragon Quest 4', 6),
    ('Dragon Quest 5', 7),
    ('Dragon Quest 7', 8),
    ('Dragon Quest 8', 9),
    ('Dragon Quest 9', 10),
    ('Dragon Quest 10', 11)
) AS v(name, order_index);

-- fish
WITH ins AS (
    INSERT INTO datasets (name, title, description)
    VALUES ('fish', 'Fish', 'Fish in Central Oregon ordered by average length.')
    RETURNING id
)
INSERT INTO dataset_items (dataset_id, name, order_index)
SELECT ins.id, v.name, v.order_index
FROM ins, (VALUES
    ('Brook Stickleback', 1),
    ('Speckled Dace', 2),
    ('Fathead Minnow', 3),
    ('Longnose Dace', 4),
    ('Pumpkinseed Sunfish', 5),
    ('Bluegill', 6),
    ('Yellow Perch', 7),
    ('Chiselmouth', 8),
    ('Tui Chub', 9),
    ('Peamouth', 10),
    ('Brown Bullhead', 11),
    ('Black Crappie', 12),
    ('White Crappie', 13),
    ('Brook Trout', 14),
    ('Mountain Whitefish', 15),
    ('Kokanee Salmon', 16),
    ('Redband Trout', 17),
    ('Smallmouth Bass', 18),
    ('Rainbow Trout', 19),
    ('Largemouth Bass', 20),
    ('Walleye', 21),
    ('Brown Trout', 22),
    ('Common Carp', 23),
    ('Lake Whitefish', 24),
    ('Channel Catfish', 25),
    ('Bull Trout', 26),
    ('Coho Salmon', 27),
    ('Lake Trout', 28),
    ('Steelhead', 29),
    ('Chinook Salmon', 30)
) AS v(name, order_index);

-- moon_missions
WITH ins AS (
    INSERT INTO datasets (name, title, description)
    VALUES ('moon_missions', 'Moon Missions', 'Put the moon missions in order by oldest to the newest.')
    RETURNING id
)
INSERT INTO dataset_items (dataset_id, name, order_index)
SELECT ins.id, v.name, v.order_index
FROM ins, (VALUES
    ('Pioneer 0', 1),
    ('Luna E-1 No.1', 2),
    ('Pioneer 1', 3),
    ('Luna E-1 No.2', 4),
    ('Pioneer 2', 5),
    ('Luna E-1 No.3', 6),
    ('Pioneer 3', 7),
    ('Luna 1', 8),
    ('Pioneer 4', 9),
    ('E-1A No.1', 10),
    ('Luna 2', 11),
    ('Luna 3', 12),
    ('Pioneer P-3', 13),
    ('Luna E-3 No.1', 14),
    ('Luna E-3 No.2', 15),
    ('Pioneer P-30', 16),
    ('Pioneer P-31', 17),
    ('Ranger 3', 18),
    ('Ranger 4', 19),
    ('Ranger 5', 20),
    ('Luna E-6 No.2', 21),
    ('Luna E-6 No.3', 22),
    ('Luna 4', 23),
    ('Ranger 6', 24),
    ('Luna E-6 No.6', 25),
    ('Luna E-6 No.5', 26),
    ('Ranger 7', 27),
    ('Ranger 8', 28),
    ('Kosmos 60', 29),
    ('Ranger 9', 30),
    ('Luna E-6 No.8', 31),
    ('Luna 5', 32),
    ('Luna 6', 33),
    ('Zond 3', 34),
    ('Luna 7', 35),
    ('Luna 8', 36),
    ('Luna 9', 37),
    ('Kosmos 111', 38),
    ('Luna 10', 39),
    ('Surveyor 1', 40),
    ('Explorer 33', 41),
    ('Lunar Orbiter 1', 42),
    ('Luna 11', 43),
    ('Surveyor 2', 44),
    ('Luna 12', 45),
    ('Lunar Orbiter 2', 46),
    ('Luna 13', 47),
    ('Lunar Orbiter 3', 48),
    ('Surveyor 3', 49),
    ('Lunar Orbiter 4', 50),
    ('Surveyor 4', 51),
    ('Explorer 35', 52),
    ('Lunar Orbiter 5', 53),
    ('Surveyor 5', 54),
    ('Soyuz 7K-L1 No.4L', 55),
    ('Surveyor 6', 56),
    ('Soyuz 7K-L1 No.5L', 57),
    ('Surveyor 7', 58),
    ('Luna E-6LS No.112', 59),
    ('Luna 14', 60),
    ('Soyuz 7K-L1 No.7L', 61),
    ('Zond 5', 62),
    ('Zond 6', 63),
    ('Apollo 8', 64),
    ('Soyuz 7K-L1 No.13L', 65),
    ('Luna E-8 No.201', 66),
    ('Soyuz 7K-L1S No.3', 67),
    ('Apollo 10', 68),
    ('Luna E-8-5 No.402', 69),
    ('Soyuz 7K-L1S No.5', 70),
    ('Luna 15', 71),
    ('Apollo 11', 72),
    ('Zond 7', 73),
    ('Kosmos 300', 74),
    ('Kosmos 305', 75),
    ('Apollo 12', 76),
    ('Luna E-8-5 No.405', 77),
    ('Apollo 13', 78),
    ('Luna 16', 79),
    ('Zond 8', 80),
    ('Luna 17', 81),
    ('Apollo 14', 82),
    ('Apollo 15', 83),
    ('PFS-1', 84),
    ('Luna 18', 85),
    ('Luna 19', 86),
    ('Luna 20', 87),
    ('Apollo 16', 88),
    ('PFS-2', 89),
    ('Soyuz 7K-LOK No.1', 90),
    ('Apollo 17', 91),
    ('Luna 21', 92),
    ('Explorer 49', 93),
    ('Mariner 10', 94),
    ('Luna 22', 95),
    ('Luna 23', 96),
    ('Luna E-8-5M No.412', 97),
    ('Luna 24', 98),
    ('ISEE-3', 99),
    ('Hiten', 100),
    ('Geotail', 101),
    ('WIND', 102),
    ('Clementine', 103),
    ('HGS-1', 104),
    ('Lunar Prospector', 105),
    ('Nozomi', 106),
    ('WMAP', 107),
    ('SMART-1', 108),
    ('STEREO', 109),
    ('ARTEMIS', 110),
    ('SELENE', 111),
    ('Chang''e 1', 112),
    ('Chandrayaan-1', 113),
    ('LRO & LCROSS', 114),
    ('Chang''e 2', 115),
    ('GRAIL', 116),
    ('LADEE', 117),
    ('Chang''e 3', 118),
    ('Chang''e 5-T1', 119),
    ('TESS', 120),
    ('Queqiao', 121),
    ('Chang''e 4', 122),
    ('Beresheet', 123),
    ('Chandrayaan-2', 124),
    ('Chang''e 5', 125),
    ('CAPSTONE', 126),
    ('Danuri', 127),
    ('Artemis I', 128),
    ('Hakuto-R Mission 1', 129),
    ('Jupiter Icy Moons Explorer', 130),
    ('Chandrayaan-3', 131),
    ('Luna 25', 132),
    ('SLIM', 133),
    ('Peregrine Mission One', 134),
    ('IM-1', 135),
    ('DRO A/B', 136),
    ('Queqiao-2', 137),
    ('Chang''e 6', 138),
    ('Blue Ghost M1', 139),
    ('Hakuto-R Mission 2', 140),
    ('Lunar Trailblazer', 141),
    ('Brokkr-2', 142),
    ('Chimera-1', 143),
    ('IM-2', 144),
    ('Artemis II', 145)
) AS v(name, order_index);

-- mtg
WITH ins AS (
    INSERT INTO datasets (name, title, description)
    VALUES ('mtg', 'Magic: The Gathering Sets', 'Magic: The Gathering first 50 sets in order of release date (oldest first).')
    RETURNING id
)
INSERT INTO dataset_items (dataset_id, name, order_index)
SELECT ins.id, v.name, v.order_index
FROM ins, (VALUES
    ('Limited Edition Alpha', 1),
    ('Limited Edition Beta', 2),
    ('Arabian Nights', 3),
    ('Antiquities', 4),
    ('Legends', 5),
    ('The Dark', 6),
    ('Fallen Empires', 7),
    ('Ice Age', 8),
    ('Homelands', 9),
    ('Alliances', 10),
    ('Mirage', 11),
    ('Visions', 12),
    ('Weatherlight', 13),
    ('Tempest', 14),
    ('Stronghold', 15),
    ('Exodus', 16),
    ('Urza''s Saga', 17),
    ('Urza''s Legacy', 18),
    ('Urza''s Destiny', 19),
    ('Mercadian Masques', 20),
    ('Nemesis', 21),
    ('Prophecy', 22),
    ('Invasion', 23),
    ('Planeshift', 24),
    ('Apocalypse', 25),
    ('Odyssey', 26),
    ('Torment', 27),
    ('Judgment', 28),
    ('Onslaught', 29),
    ('Legions', 30),
    ('Scourge', 31),
    ('Mirrodin', 32),
    ('Darksteel', 33),
    ('Fifth Dawn', 34),
    ('Champions of Kamigawa', 35),
    ('Betrayers of Kamigawa', 36),
    ('Saviors of Kamigawa', 37),
    ('Ravnica: City of Guilds', 38),
    ('Guildpact', 39),
    ('Dissension', 40),
    ('Coldsnap', 41),
    ('Time Spiral', 42),
    ('Planar Chaos', 43),
    ('Future Sight', 44),
    ('Lorwyn', 45),
    ('Morningtide', 46),
    ('Shadowmoor', 47),
    ('Eventide', 48),
    ('Shards of Alara', 49),
    ('Conflux', 50)
) AS v(name, order_index);

-- oregon_pop
WITH ins AS (
    INSERT INTO datasets (name, title, description)
    VALUES ('oregon_pop', 'Oregon Cities by Population', 'The 20 most populated cities in oregon sorted from highest to lowest by population in 2026')
    RETURNING id
)
INSERT INTO dataset_items (dataset_id, name, order_index)
SELECT ins.id, v.name, v.order_index
FROM ins, (VALUES
    ('Portland', 1),
    ('Salem', 2),
    ('Eugene', 3),
    ('Hillsboro', 4),
    ('Bend', 5),
    ('Gresham', 6),
    ('Beaverton', 7),
    ('Medford', 8),
    ('Corvallis', 9),
    ('Springfield', 10),
    ('Tigard', 11),
    ('Albany', 12),
    ('Aloha', 13),
    ('Lake Oswego', 14),
    ('Grants Pass', 15),
    ('Redmond', 16),
    ('Keizer', 17),
    ('Oregon City', 18),
    ('McMinnville', 19),
    ('Bethany', 20)
) AS v(name, order_index);

-- planets
WITH ins AS (
    INSERT INTO datasets (name, title, description)
    VALUES ('planets', 'Planets', 'Put the planets in order by distance from the sun (closest first).')
    RETURNING id
)
INSERT INTO dataset_items (dataset_id, name, order_index)
SELECT ins.id, v.name, v.order_index
FROM ins, (VALUES
    ('Mercury', 1),
    ('Venus', 2),
    ('Earth', 3),
    ('Mars', 4),
    ('Jupiter', 5),
    ('Saturn', 6),
    ('Uranus', 7),
    ('Neptune', 8),
    ('Pluto', 9)
) AS v(name, order_index);

-- presidents
WITH ins AS (
    INSERT INTO datasets (name, title, description)
    VALUES ('presidents', 'US Presidents', 'Put the presidents of the United States in order of their presidencies (first to most recent).')
    RETURNING id
)
INSERT INTO dataset_items (dataset_id, name, order_index)
SELECT ins.id, v.name, v.order_index
FROM ins, (VALUES
    ('George Washington', 1),
    ('John Adams', 2),
    ('Thomas Jefferson', 3),
    ('James Madison', 4),
    ('James Monroe', 5),
    ('John Quincy Adams', 6),
    ('Andrew Jackson', 7),
    ('Martin Van Buren', 8),
    ('William Henry Harrison', 9),
    ('John Tyler', 10),
    ('James K. Polk', 11),
    ('Zachary Taylor', 12),
    ('Millard Fillmore', 13),
    ('Franklin Pierce', 14),
    ('James Buchanan', 15),
    ('Abraham Lincoln', 16),
    ('Andrew Johnson', 17),
    ('Ulysses S. Grant', 18),
    ('Rutherford B. Hayes', 19),
    ('James A. Garfield', 20),
    ('Chester A. Arthur', 21),
    ('Grover Cleveland', 22),
    ('Benjamin Harrison', 23),
    ('Grover Cleveland', 24),
    ('William McKinley', 25),
    ('Theodore Roosevelt', 26),
    ('William Howard Taft', 27),
    ('Woodrow Wilson', 28),
    ('Warren G. Harding', 29),
    ('Calvin Coolidge', 30),
    ('Herbert Hoover', 31),
    ('Franklin D. Roosevelt', 32),
    ('Harry S. Truman', 33),
    ('Dwight D. Eisenhower', 34),
    ('John F. Kennedy', 35),
    ('Lyndon B. Johnson', 36),
    ('Richard Nixon', 37),
    ('Gerald Ford', 38),
    ('Jimmy Carter', 39),
    ('Ronald Reagan', 40),
    ('George H. W. Bush', 41),
    ('Bill Clinton', 42),
    ('George W. Bush', 43),
    ('Barack Obama', 44),
    ('Donald Trump', 45),
    ('Joe Biden', 46),
    ('Donald Trump', 47)
) AS v(name, order_index);

-- retro_games
WITH ins AS (
    INSERT INTO datasets (name, title, description)
    VALUES ('retro_games', 'Retro video game releases', 'Put retro video games in order from oldest to newest')
    RETURNING id
)
INSERT INTO dataset_items (dataset_id, name, order_index)
SELECT ins.id, v.name, v.order_index
FROM ins, (VALUES
    ('Space Invaders', 1),
    ('Pac-Man', 2),
    ('Tetris', 3),
    ('Super Mario Bros.', 4),
    ('Street Fighter II', 5),
    ('Sonic the Hedgehog', 6),
    ('Doom', 7),
    ('Mega Man X', 8),
    ('Super Metroid', 9),
    ('Donkey Kong Country', 10),
    ('Chrono Trigger', 11),
    ('Pokémon Red', 12),
    ('Final Fantasy VII', 13),
    ('Castlevania: Symphony of the Night', 14),
    ('GoldenEye 007', 15),
    ('Star Fox 64', 16),
    ('The Legend of Zelda: Ocarina of Time', 17),
    ('Metal Gear Solid', 18),
    ('Resident Evil 2', 19),
    ('Metroid Prime', 20)
) AS v(name, order_index);

-- roundabout_cities
WITH ins AS (
    INSERT INTO datasets (name, title, description)
    VALUES ('roundabout_cities', 'Roundabout Cities', 'Top 10 cities sorted by the most roundabouts.')
    RETURNING id
)
INSERT INTO dataset_items (dataset_id, name, order_index)
SELECT ins.id, v.name, v.order_index
FROM ins, (VALUES
    ('Carmel IN', 1),
    ('Colorado Springs CO', 2),
    ('Columia MO', 3),
    ('Loveland CO', 4),
    ('Austin TX', 5),
    ('Frisco TX', 6),
    ('Charlotte NC', 7),
    ('Lincoln NE', 8),
    ('Bend OR', 9),
    ('Durham NC', 10)
) AS v(name, order_index);

-- selling_games
WITH ins AS (
    INSERT INTO datasets (name, title, description)
    VALUES ('selling_games', 'Highest Selling Games', 'Put the games in order by number of copies sold')
    RETURNING id
)
INSERT INTO dataset_items (dataset_id, name, order_index)
SELECT ins.id, v.name, v.order_index
FROM ins, (VALUES
    ('Minecraft', 1),
    ('Grand Theft Auto V', 2),
    ('Wii Sports', 3),
    ('Red Dead Redemption 2', 4),
    ('Mario Kart 8 / Deluxe', 5),
    ('PUBG: Battlegrounds', 6),
    ('Terraria', 7),
    ('The Witcher 3: Wild Hunt', 8),
    ('Super Mario Bros', 9),
    ('Human Fall Flat', 10)
) AS v(name, order_index);

-- stars
WITH ins AS (
    INSERT INTO datasets (name, title, description)
    VALUES ('stars', 'Stars', 'Put the stars in order of distance from the Sun')
    RETURNING id
)
INSERT INTO dataset_items (dataset_id, name, order_index)
SELECT ins.id, v.name, v.order_index
FROM ins, (VALUES
    ('Sol', 0),
    ('Proxima Centauri', 1),
    ('Rigil Kentaurus & Toliman', 2),
    ('Barnard''s Star', 3),
    ('Wolf 359', 4),
    ('Sirius', 5),
    ('Luyten 726-8', 6),
    ('Epsilon Eridani', 7),
    ('61 Cygni A, B, & C', 8),
    ('Procyon A & B', 9),
    ('Epsilon Indi', 10),
    ('Tau Ceti', 11),
    ('GJ 1061', 12),
    ('YZ Ceti', 13),
    ('Luyten''s Star', 14),
    ('Teegarden''s Star', 15),
    ('82 G Eridani', 16)
) AS v(name, order_index);
