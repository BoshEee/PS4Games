BEGIN;

DROP TABLE IF EXISTS users, games, blog, comments, blog_posts CASCADE; 

CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  user_name VARCHAR(255) NOT NULL,
  user_pass VARCHAR(255) NOT NULL,
  role VARCHAR(255)
);

CREATE TABLE games (
    game_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    genres TEXT [] NOT NULL,
    price INTEGER,
    release_date DATE,
    rate DECIMAL,
    game_summa TEXT,
    poster VARCHAR,
    screenshots TEXT []
);

CREATE TABLE blog (
    blog_id SERIAL PRIMARY KEY,
    /* CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES users(user_id), */
    user_id integer REFERENCES users(user_id),
    blog_title VARCHAR(255),
    blog_dec VARCHAR(255),
    comments TEXT,
    tags TEXT
);

CREATE TABLE comments (
    comment_id SERIAL PRIMARY KEY,
    user_id integer REFERENCES users(user_id),
    game_id integer REFERENCES games(game_id),
    comment_text TEXT
);

INSERT INTO users (user_name, user_pass, role) VALUES
  ('Khaled', 123421, 'user'),
  ('Bushra', 9876789, 'user'),
  ('May', 41114, 'user'),
  ('Jihad', 727272, 'user')
  
;

INSERT INTO games (title, genres, price, release_date, rate,game_summa, poster, screenshots) VALUES
     ('The Last Of Us 2', '["Action", "Adventure"]', '$59.99', '06-19-2020', '9.5', 'Five years after their dangerous journey across the post-pandemic United States, Ellie and Joel have settled down in Jackson, Wyoming. Living amongst a thriving community of survivors has allowed them peace and stability, despite the constant threat of the infected and other, more desperate survivors. When a violent event disrupts that peace, Ellie embarks on a relentless journey to carry out justice and find closure. As she hunts those responsible one by one, she is confronted with the devastating physical and emotional repercussions of her actions' ,'https://cdn.europosters.eu/image/1300/posters/the-last-of-us-2-ellie-i76718.jpg','["https://images.hive.blog/DQma2kAk1M1hQar7RrPafrgzvRDk8gdL4rBgm22vk5fcCBg/maxresdefault.jpg",
        "https://www.playstationlifestyle.net/assets/uploads/2020/04/The-last-of-us-part-2-new-screenshots-indefinite-delay-4.jpg",
        "https://i.imgur.com/IEs2DzP.jpg"]'),
     ('The Last Of Us 1', '["Action", "Adventure"]', '$19.99', '7/22/2014', '8.5', 'Abandoned cities reclaimed by nature. A population decimated by a modern plague. Survivors are killing each other for food, weapons whatever they can get their hands on. Joel, a brutal survivor, and Ellie, a brave young teenage girl who is wise beyond her years, must work together if they hope to survive their journey across the US.', 'https://images-na.ssl-images-amazon.com/images/I/819Y2JhjAFL.jpg' , '["https://images.hive.blog/DQma2kAk1M1hQar7RrPafrgzvRDk8gdL4rBgm22vk5fcCBg/maxresdefault.jpg",
        "https://www.playstationlifestyle.net/assets/uploads/2020/04/The-last-of-us-part-2-new-screenshots-indefinite-delay-4.jpg",
        "https://i.imgur.com/IEs2DzP.jpg"]'),
     ('Ratchet & Clank', '["Action", "Adventure", "Shooter"]', '$9.99', '7/22/2014', '7.5', 'Ratchet & Clank blasts onto PlayStation®4 for the first time, with a new game based on elements from the original Ratchet & Clank (PS2™). Ratchet & Clank (PS4™) takes a deeper look at the characters’ origin stories and modernizes the original gameplay. Featuring several new planets, all-new bosses, new Clank gameplay, new flight sequences, and much more – with completely new visuals constructed to use the power of the PS4.', 'https://images-na.ssl-images-amazon.com/images/I/51FDA7Ha3pL._AC_.jpg' , '[
        "https://i.pinimg.com/originals/21/6f/4b/216f4b6d4434c7b9a54d0fd7e8df307e.jpg",
        "http://gameranx.com/wp-content/uploads/2016/04/ratchet-and-clank-screenshot-02-psv-us-10jun15.jpg",
        "https://pbs.twimg.com/media/EaRTvQyXgAcW1-q.jpg"]'),
     ('Uncharted 4: A Thief’s End', '["Action"]', '$19.99', '5/12/2016' , '7.0', 'Several years after his last adventure, retired fortune hunter, Nathan Drake, is forced back into the world of thieves. With the stakes much more personal, Drake embarks on a globe-trotting journey in pursuit of a historical conspiracy behind a fabled pirate treasure. His greatest adventure will test his physical limits, his resolve, and ultimately what he’s willing to sacrifice to save the ones he loves.' , 'https://m.media-amazon.com/images/I/91Exkdm5XhL._AC_SL1500_.jpg' , '[
        "https://i.pinimg.com/originals/f4/8d/0b/f48d0bc680ed941334174a4044f64581.png",
        "https://gamefaqs1.cbsistatic.com/screen/full/9/8/2/1305982.jpg",
        "https://i.ytimg.com/vi/abb9f8X3XZc/maxresdefault.jpg"
      ]'),
     ('Uncharted 3: Drakes Deception', '["Action"]', '$19.99', '7/22/2014' , '8.0', 'The single-player story follows Nathan Drake, who partners with his mentor Victor Sullivan as they search for the legendary lost city of Iram of the Pillars' , 'https://i.pinimg.com/originals/c3/22/ff/c322ff944c3de6e89edf6d7e20f0d381.jpg', '[
        "https://www.mobygames.com/images/shots/l/531804-uncharted-3-drake-s-deception-playstation-3-screenshot-exploring.jpg",
        "http://nerdreactor.com/wp-content/uploads/2011/10/Uncharted-3-drakes-Deception-Oct-2011-02.jpg",
        "https://secure.i.telegraph.co.uk/multimedia/archive/02035/10124U3_Horse_key__2035605i.jpg"
      ]'), 
     ('Uncharted 2: Among Thieves', '["Action"]', '$19.99', '13/10/2009', '8.2', 'Set two years after the events of Drakes Fortune, the single-player story follows Nathan Drake, who partners with Chloe Frazer and Elena Fisher, as they search for the Cintamani Stone and city of Shambhala, whilst battling a mercenary group led by war criminal Zoran Lazarevic', 'https://m.media-amazon.com/images/M/MV5BZDk4ZGQ1NTUtZTYwYS00YTMwLWI1OTYtNTNkZWRmNzljMjU3XkEyXkFqcGdeQXVyMjM5NzU3OTM@._V1_.jpg', '[
        "https://www.newgamenetwork.com/images/uploads/gallery/uncharted%202/Uncharted2%2025-Oct09-01.jpg",
        "https://www.mobygames.com/images/shots/l/505112-uncharted-2-among-thieves-playstation-3-screenshot-in-the.jpg",
        "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/f3e3b0c3-145c-4884-a869-ffa85b9c985e/d9zhqr6-b218632e-ced2-4274-adc8-ceab8c603796.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvZjNlM2IwYzMtMTQ1Yy00ODg0LWE4NjktZmZhODViOWM5ODVlXC9kOXpocXI2LWIyMTg2MzJlLWNlZDItNDI3NC1hZGM4LWNlYWI4YzYwMzc5Ni5qcGcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.j3V0vvmhkY8dddavBH99gvM5FSnjd6sHFkUfJOUN71g"
      ]'),
     ('Uncharted 1: Drakes Fortune', '["Action"]', '$19.99','10/9/2015', '7.4', 'Combining platforming and third-person shooter elements, the game covers the journey of fortune hunter Nathan Drake, supposed descendant of the English explorer Francis Drake, as he seeks the lost treasure of El Dorado with the help of journalist Elena Fisher and friend and mentor Victor Sullivan.', 'https://m.media-amazon.com/images/I/71sJkOTte1L.jpg', '[
        "https://lh3.googleusercontent.com/proxy/PyE-5YwLkQApWyYMiwuR6kCKlOJCSASg7D3nD0zxi4mhtyDrK-mcFVBR5xgkRjlcb_mdq05zSpvms2O51-hwanB6zVTqSz9XyM_OUIp_swFe-8pT0iI8bMlii0vtGT4HumdQyAy4oOpwVV_L3aNPhxpXWRsScMPY6RFWcDvJFuHKeLdAigZyiIGDQJzJtg5-qBv45B0rM9nBcw",
        "https://i.imgur.com/BhgRzHJ.jpg",
        "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/f3e3b0c3-145c-4884-a869-ffa85b9c985e/d9z79ov-c2a6f95b-8300-4e29-9912-466513e7f6a8.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvZjNlM2IwYzMtMTQ1Yy00ODg0LWE4NjktZmZhODViOWM5ODVlXC9kOXo3OW92LWMyYTZmOTViLTgzMDAtNGUyOS05OTEyLTQ2NjUxM2U3ZjZhOC5qcGcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.1efJQgPZb6PeDXHQxwAtwOGvVK0EVezMwKIoJelW244"
      ]'), 
      ('Uncharted 5: The Lost Lagecy', '["Action ", "Adventure"]', '$19.99', '8/22/2017', '8.1', 'In order to recover an ancient artifact and keep it out of the hands of a ruthless warmonger, Chloe must enlist the aid of renowned mercenary Nadine Ross and venture to India’s Western Ghats to locate the Golden Tusk of Ganesh. In Chloe’s greatest journey yet, she must confront her past and decide what she’s willing to sacrifice to forge her own legacy.', 'https://images-na.ssl-images-amazon.com/images/I/71MBTCVlFKL._AC_SL1500_.jpg', '[
        "https://www.mobygames.com/images/shots/l/901629-uncharted-the-lost-legacy-playstation-4-screenshot-taking.jpg",
        "https://gamingcentral.in/wp-content/uploads/2017/08/uncharted-the-lost-legacy-screenshot-59-2100x1200.png",
        "https://gamingcentral.in/wp-content/uploads/2017/08/uncharted-the-lost-legacy-screenshot-53.png"
      ]'),
      ('Final Fantasy VII Remake' , '["Role Playing Game"]', '$59.99', '4/10/2020', '6.8', 'The world is under the control of Shinra, a corporation controlling the planets life force as mako energy. In the city of Midgar, Cloud Strife, former member of Shinras elite SOLDIER unit now turned mercenary lends his aid to the Avalanche resistance group, unaware of the epic consequences that await him.', 'https://images-na.ssl-images-amazon.com/images/I/71Yh8CNTzsL._AC_SX522_.jpg', '[
        "https://assets2.rappler.com/6799EB9AC7A14F72B011F8067A67FB88/img/401E28658AE34C6190FBCED1DC8D6214/Final-Fantasy-VII-Remake-April-20-2020-20200413103321.jpg",
        "https://www.gamereactor.eu/media/35/finalfantasy7_2973533_1200x675.jpg",
        "http://www.playstationlifestyle.net/assets/uploads/2020/02/Final-Fantasy-VII-Remake-Screenshots-Tifa-4.jpg"
      ]'),
      ('Shadow of the Colossus', '["Action ", "Adventure"]', '$19.99', '2/6/2018', '5.9', 'Tales speak of an ancient realm where Colossi roam the majestic landscape. Bound to the land, these creatures hold a key to a mystical power of revival – a power you must obtain to bring a loved one back to life.' , 'https://i.ebayimg.com/images/g/YggAAOSwlxNegum~/s-l400.jpg', '[
        "https://i0.wp.com/twinfinite.net/wp-content/uploads/2018/01/shadow-of-the-colossus-ps4.jpg?fit=700%2C400&ssl=1",
        "https://i.redd.it/lz53oz1oaol41.jpg",
        "https://i.redd.it/1s0di7a0uje01.jpg"
      ]'),
      ('The Last Guardian', '["Action ", " Adventure"]', '$13.99', '12/6/2016' ,'7.4', 'In a strange and mystical land, a young boy discovers a mysterious creature with which he forms a deep, unbreakable bond. The unlikely pair must rely on each other to escape towering, treacherous ruins filled with unknown dangers. Experience the journey of a lifetime in this touching, emotional story of friendship and trust.', 'https://images-na.ssl-images-amazon.com/images/I/51FDA7Ha3pL._AC_.jpg' , '[
        "https://www.geekgirlauthority.com/wp-content/uploads/2016/08/Last-Guardian-PS4.jpg",
        "https://miro.medium.com/max/3840/1*KcbVEjOoQVsgZgyv26qwWQ.jpeg",
        "http://thisgengaming.com/wp-content/uploads/2016/01/e3-2015-the-last-guardian-is-coming-to-playstation_8nh9.1920.jpg"
      ]'),
      ('Tomb Raider : A Survivor Is Born', '["Action ", " Adventure"]', '$19.99', '18/1/2014', '8.9', 'featuring an obsessively detailed Lara and a stunningly lifelike world. Endure high-octane combat, customize weapons and gear, and overcome grueling environments to survive Lara’s first adventure.', 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/223e7bf8-b07e-4d2c-a494-d2cace90c220/d7arnj5-d9a15b96-1611-40b5-ae48-0a19aa775f93.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvMjIzZTdiZjgtYjA3ZS00ZDJjLWE0OTQtZDJjYWNlOTBjMjIwXC9kN2Fybmo1LWQ5YTE1Yjk2LTE2MTEtNDBiNS1hZTQ4LTBhMTlhYTc3NWY5My5wbmcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.k7Vj-ptZ_-cNhTohlF0v9GYWQClzOmY1vusOK6fRioA', '[
        "https://d2skuhm0vrry40.cloudfront.net/2013/articles//a/1/6/5/0/7/1/7/PS3_003.bmp.jpg",
        "http://raidingtheglobe.com/images/com_osgallery/gal-71/original/trde-screenshot1203C7704C-2F0F-1006-FEC5-BEE2F9495F6E.jpg",
        "https://cdn-prod.scalefast.com/public/assets/user/123622/sample/479bf069ce9cb17d6c8ba03e0172c01b.jpg"
      ]'),
      ('Rise Of The Tomb Raider', '["Action ", " Role Playing Game"]', '$29.99', '10/11/2016' ,'7.0', 'In Rise of the Tomb Raider, Lara Croft becomes more than a survivor as she embarks on her first Tomb Raiding expedition to the most treacherous and remote regions of Siberia.', 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/4c32547c-bd56-4907-ba40-6b377e1616fa/daasgvd-0359bb78-01d7-45ab-9b2e-4c879a68d047.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvNGMzMjU0N2MtYmQ1Ni00OTA3LWJhNDAtNmIzNzdlMTYxNmZhXC9kYWFzZ3ZkLTAzNTliYjc4LTAxZDctNDVhYi05YjJlLTRjODc5YTY4ZDA0Ny5qcGcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.AQ1v06x91bDe01DELhL_EfOE1L8094dHRbkG09bd_Is', '[
        "https://i.redd.it/6lzlf6twejqy.jpg",
        "https://www.newgamenetwork.com/images/uploads/gallery/RiseoftheTombRaider/rotr_pc_03.jpg",
        "https://www.pcgamesn.com/wp-content/uploads/legacy/Rise_of_the_Tomb_Raider_screenshots-590x334.jpg"
      ]'),
      ('Shadow of The Tomb Raider', '["Action ", " Adventure", " Unique"]', '$59.99', '12/6/2018', '6.9', 'Experience Lara Croft’s defining moment as she becomes the Tomb Raider. In Shadow of the Tomb Raider, Lara must master a deadly jungle, overcome terrifying tombs, and persevere through her darkest hour. As she races to save the world from a Maya apocalypse, Lara must become the Tomb Raider she is destined to be.', 'https://cdn.shopify.com/s/files/1/0747/3829/products/mL2605_1024x1024.jpg?v=1571445549', '[
        "https://www.windowscentral.com/sites/wpcentral.com/files/styles/large/public/field/image/2018/04/shadow%20tomb%20raider%202.jpg",
        "http://feed4gamers.com/imgs/0/2018/4-27-16-58-50//shadow-of-the-tomb-raider-149606-2050744.jpg",
        "http://static1.squarespace.com/static/55ef0e29e4b099e22cdc9eea/55ef1423e4b030b646dd5fc2/5b6c4cba032be44a49dc4ed2/1533828629017/GT_ShadowOfTheTombRaider_01+%281%29.jpg?format=1500w"
      ]'),
      ('Uncharted: The Nathan Drake Collection', '["Action", "Adventure"]', '$24.99','16/11/2007','8.6', 'Discover the man. Uncover a legend. Relive the epic Nathan Drake Trilogy, beautifully re-mastered for the PS4. UNCHARTED The Nathan Drake Collection includes the single-player campaigns for UNCHARTED: Drake’s Fortune, UNCHARTED 2: Among Thieves, and UNCHARTED 3: Drake’s Deception.', 'https://static-cdn.jtvnw.net/ttv-boxart/Uncharted%3A%20The%20Nathan%20Drake%20Collection.jpg', '[
        "https://pbs.twimg.com/media/DC_Cj55XkAAJcCy.jpg:large",
        "https://i.redd.it/aq44m0skop811.png",
        "https://i.redd.it/cpgy24e42sl11.jpg"
      ]'),
      ('Until Dawn', '["Horror"]', '$29.99', ,'26/8/2015', '8.9', 'Only Your Choices Determine Who Will Survive<br> When eight friends return to the isolated mountain lodge where two of their group disappeared exactly one year ago, things quickly turn sinister.Gripped by fear and with tensions running high, you’ll have to make the difficult decisions that will mean life, or death, for each member of the group.', 'https://m.media-amazon.com/images/M/MV5BOTVlYWVmOTYtNGI3OS00YWUyLTlkZDItMDA4ZWZiNjVmZmZmXkEyXkFqcGdeQXVyMjM5NzU3OTM@._V1_.jpg', '[
        "https://www.newgamenetwork.com/images/uploads/gallery/UntilDawn/untildawn_06.jpg",
        "https://img.playstationtrophies.org/images/screenshots/1672/med_10_1436948695.jpg",
        "https://www.mobygames.com/images/shots/l/798032-until-dawn-playstation-4-screenshot-sam-and-chris-at-the-firing.jpg"
      ]'),
      ('Horizon Zero Dawn', '["Role Playing Game", "Adventure"]', '$29.99', '6/12/2017', '9.1', 'Experience Aloy of the Nora’s entire legendary quest to unravel the mysteries of a world ruled by deadly Machines.An outcast from her tribe, the young hunter fights to uncover her past, discover her destiny… and stop a catastrophic threat to the future.Unleash devastating, tactical attacks against unique Machines and rival tribes as you explore an open wold teeming with wildlife and danger', 'https://static.displate.com/857x1200/displate/2020-07-05/c9b17d50dc5e5e509e692b55b30cefa5_4fc0de222e3786ac5aa12aeb69aac69b.jpg', '[
        "https://cdn.wccftech.com/wp-content/uploads/2016/09/01-1-2060x1159.jpg",
        "https://gamingbolt.com/wp-content/uploads/2017/10/horizon-zero-dawn-the-frozen-wilds-4k-1-2.jpg",
        "https://i.imgur.com/5iYPssX.jpg"
      ]'),
      ('Marvel : Spider Man', '["Action", "Adventure"]', '$49.99','7/9/2018', '9.3', 'Explore a new chapter in Marvel’s Spider-Man universe as a more experienced Peter Parker.Starring one of the world’s most iconic Super Heroes, Marvels Spider-Man features the acrobatic abilities, improvisation and web-slinging that the wall-crawler is famous for,while also introducing elements never-before-seen in a Spider-Man game.From traversing by parkour and unique environmental interactions, to new combat and blockbuster action, its Spider-Man unlike any you’ve played before', 'https://images-na.ssl-images-amazon.com/images/I/81f4z3CtwlL._AC_SL1500_.jpg', '[
        "https://i.imgur.com/aeF4cjz.jpg",
        "https://i.pinimg.com/originals/7f/9c/17/7f9c17c56b15a7dd7f69d38c28f2b5e7.jpg",
        "https://i.ytimg.com/vi/pbjVR0ERqr4/maxresdefault.jpg"
      ]'),
      ('God Of War 4', '["Action", "Adventure"]', '$43.99', '4/10/2019', '8.5', 'Living as a man outside the shadow of the gods, Kratos must adapt to unfamiliar lands, unexpected threats and a second chance at being a father. Together with his son Atreus, the pair will venture into the brutal realm of Midgard and fight to fulfil a deeply personal quest.', 'https://images-na.ssl-images-amazon.com/images/I/81gXqxyFrxL.jpg', [
        "https://i.pinimg.com/originals/91/9b/2f/919b2f61e01602220d2b1ea60934843d.jpg",
        "https://i.redd.it/jmcwrgske0x31.jpg",
        "https://www.mobygames.com/images/shots/l/946026-god-of-war-playstation-4-screenshot-kratos-is-about-to-test.jpg"
      ]),
      ('Days Gone', '["Action", "Adventure", "Horror"]', '$99.99', '26/4/2019', '8.0', 'Ride into a desperate dog-eat-dog world ravaged by a deadly pandemic as drifter and bounty hunter, Deacon St. John.', 'https://wallpapercave.com/wp/wp2393006.jpg', '[
        "https://i.redd.it/oxliq2xlv0v21.jpg",
        "https://images.pushsquare.com/560cc1e9a2a2a/days-gone-ps4.original.jpg",
        "https://gamingbolt.com/wp-content/uploads/2016/06/DaysGone004.jpg"
      ]'),
      ('Bloodborne', '["Action", "Role Playing Games"]', '$20.99', '25/3/2015', '8.5', 'A lone traveller. A cursed town. A deadly mystery that swallows everything it touches. Face your fears as you enter the decaying city of Yharnam, a forsaken place ravaged by a terrible, all-consuming illness. Scour its darkest shadows, fight for your life with blades and guns and discover secrets that will make your blood run cold – but just might save your skin...', 'https://i.pinimg.com/originals/4d/1a/7d/4d1a7d832d2787a23ab14cb24f1c38a6.jpg', '[
        "https://i.redd.it/mtnm6wlidx601.jpg",
        "https://www.mobygames.com/images/shots/l/856034-bloodborne-playstation-4-screenshot-a-crowd-gathers-around.png",
        "https://images.pushsquare.com/screenshots/67104/large.jpg"
      ]'),
      ('Hidden Agenda', '["Adventure"]', '$19.99', '22/11/2017', '4.3', 'Make difficult choices to decide the fates of the people you meet along the way. But can you trust the people sitting beside you on your sofa?', 'https://i.pinimg.com/736x/7e/de/35/7ede350b40aa6710ba05fece48251458.jpg', '[
        "https://www.mobygames.com/images/shots/l/916699-hidden-agenda-playstation-4-screenshot-tv-screen-ps4-my-partner.jpg",
        "https://www.mobygames.com/images/shots/l/916685-hidden-agenda-playstation-4-screenshot-tv-screen-ps4-talking.jpg",
        "https://3.bp.blogspot.com/-JOFjHw9nYuw/W4qBggtZq_I/AAAAAAAA5eM/N6j2jUt5hUUQDB7_q93oNV-9hLJqmstUQCLcBGAs/s1600/hidden%2Bagenda%2B3.jpg"
      ]'),
      ('Dark Eclipse', '["Action", "Arcade", "Driving"]', '$17.99', '12/5/2017', '5.5', 'Super Toy Cars - Super fun tabletop arcade combat racing game featuring miniature cars and tracks made of everyday objects.', 'https://format-com-cld-res.cloudinary.com/image/private/s--dtYZbd-I--/c_limit,g_center,h_65535,w_1600/fl_keep_iptc.progressive,q_95/v1/6ecd3b7250706f069fe53ea96b6a8161/eclipse_vrlaposter02_17x22.jpg' , '[
        "https://www.mobygames.com/images/promo/original/1537871604-1865142550.jpg",
        "https://www.mobygames.com/images/promo/original/1537871603-1883848932.jpg",
        "https://gaminglyfe.com/wp-content/uploads/2018/09/Dark-Eclipse-780x483.jpg"
      ]')

;

COMMIT;