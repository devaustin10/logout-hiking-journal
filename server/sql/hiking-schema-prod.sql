

use hiking;

create table hiker (
hiker_id varchar(250) primary key,
first_name varchar(250) not null,
last_name varchar(250) not null,
age int not null,

constraint fk_hiker_id_username
foreign key (hiker_id)
references app_user(username)
); 

 create table trail_difficulty (
trail_difficulty_id int primary key auto_increment,
`description` varchar (255) not null
);   

create table trail (
trail_id int primary key auto_increment,
trail_name varchar (250) not null,
trail_distance decimal (10,1) not null, 
trail_difficulty_id int not null,
city varchar (250) not null,
state varchar (250) not null,

constraint fk_trail_trail_difficulty_id
	foreign key (trail_difficulty_id)
	references trail_difficulty(trail_difficulty_id)
);

create table hike (
hike_id int primary key auto_increment,
hike_date date not null,
hike_difficulty varchar (255) not null,
`description` varchar (255) not null,
hiker_id varchar (250) not null,
trail_id int not null,
constraint fk_hike_hiker_id
	foreign key (hiker_id)
	references hiker(hiker_id),
constraint fk_hike_trail_id
	foreign key (trail_id)
	references trail(trail_id)
	);
    

INSERT into trail_difficulty (trail_difficulty_id, `description`)
	values
    (1,'Easy'),
    (2,'Easy/Intermediate'),
    (3,'Intermediate'),
    (4,'Intermediate/Difficult'),
    (5,'Difficult'),
    (6,'Very Difficult');
    
INSERT into hiker (first_name, last_name, age, hiker_id)
	values
	('John','Smith',27,'therealjohnsmith'),
	('Alice','Liddell',18,'wonderlander1865'),
	('Holden','Caulfield',25,'neverinfilm'),
	('Violet','Baudelaire',23,'veryunf0rtunatevi'),
	('Atticus','Finch',40,'atticusfinchlaw'),
	('Philip','Marlowe',35,'bigsleeper893'),
    ('Forrest','Gump',37,'keeponrunning');
    
    
INSERT into trail (trail_name, trail_distance, trail_difficulty_id, city, state)
	values
    ('Red Lizard','0.4',6,'Huntsville','AL'),
	('Richard Martin Trail NRT','11.3',1,'Athens','AL'),
	('Indian Creek Greenway','2.9',1,'Madison','AL'),
	('Aldridge Creek Greenway','5.6',1,'Owens Cross Roads','AL'),
	('Tennessee River Greenway','0.9',1,'Owens Cross Roads','AL'),
	('Atwood Linear Park Greenway','0.9',1,'Huntsville','AL'),
	('Swan Creek Greenway Trail','2.4',1,'Athens','AL'),
	('Athens Recreation Loop','1.6',1,'Athens','AL'),
	('Jones Farm Park Greenway','0.5',1,'Huntsville','AL'),
	('Marbut Bend Trail','1.1',1,'Athens','AL'),
	('Eielson Alpine Trail','0.8',5,'Healy','AK'),
	('Bike Path','1.8',1,'Healy','AK'),
	('Blueberry Hill','0.6',2,'Healy','AK'),
	('McKinley Bar Trail','2.5',2,'Healy','AK'),
	('McKinley Station Trail','1.3',2,'Healy','AK'),
	('Meadow View Trail','0.3',3,'Healy','AK'),
	('Mountain Vista Trail','0.7',1,'Healy','AK'),
	('Mt. Healy Trail','2.0',5,'Healy','AK'),
	('Angel Rocks Trail','3.0',5,'Eielson Air Force Base','AK'),
	('Tolovana Hot Springs Trail','10.8',1,'Ester','AK'),
	('Anasazi Loop','1.3',2,'Flagstaff','AZ'),
	('AZT - Passage 36 - Coconino Rim','18.6',1,'Grand Canyon','AZ'),
	('AZT - Passage 43 - Buckskin Mountain','10.9',3,'Fredonia','AZ'),
	('Great Western Trail #150 Central Segment','40.5',1,'Grand Canyon','AZ'),
	('TEN-X Nature Trail #42','0.5',1,'Grand Canyon','AZ'),
	('Red Butte Trail #37','1.6',5,'Grand Canyon','AZ'),
	('Almosta Trail #0622','6.6',2,'Williamson','AZ'),
	('Cedar Pocket Wash','4.3',3,'Beaver Dam','AZ'),
	('Cedar Pocket Wash Narrows','0.4',4,'Beaver Dam','AZ'),
	('Maze Rock Art Site Trail','0.7',2,'Fredonia','AZ'),
	('South Loop','1.6',3,'Little Rock','AR'),
	('North Loop','1.6',3,'Little Rock','AR'),
	('Jackfork Mountain Bike Trail','5.7',5,'Maumelle','AR'),
	('West Summit Trail','0.6',5,'Maumelle','AR'),
	('East Summit Trail','0.6',5,'Maumelle','AR'),
	('Base Trail','2.2',3,'Maumelle','AR'),
	('Rocky Valley Trail','1.2',4,'Maumelle','AR'),
	('East Quarry Trail','0.5',3,'Maumelle','AR'),
	('Arkansas River Trail','15.7',1,'Little Rock','AR'),
	('Arkansas River Trail Extension','1.9',1,'North Little Rock','AR'),
	('PCT: Belden to Burney Falls State Park','135.2',3,'Quincy','CA'),
	('PCT: Highway 5 to Etna Summit','100.6',2,'Dunsmuir','CA'),
	('Heart Lake Trail','8.6',3,'Shingletown','CA'),
	('Osgood Ditch Trail #1276','1.6',2,'Cave Junction','OR'),
	('Bay Area Ridge Trail: Hiddenbrooke Trail','2.4',3,'American Canyon','CA'),
	('Crags Trail','2.4',4,'Dunsmuir','CA'),
	('Root Creek Trail','1.6',3,'Dunsmuir','CA'),
	('Rocky Pool Trail','2.4',1,'Forest Ranch','CA'),
	('Big Leaf Pool Trail','1.2',1,'Magalia','CA'),
	('Subway Cave Interpretive Loop','0.6',2,'Burney','CA'),
	('CT - Segment 7: Goldhill to Copper Mountain','13.1',5,'Breckenridge','CO'),
	('CDT: Gold Hill to Georgia Pass (CO Sec. 28)','20.4',4,'Breckenridge','CO'),
	('CDT: Georgia Pass to Argentine Pass (CO Sec. 29)','22.1',5,'Breckenridge','CO'),
	('MF Ranch Creek Road #142','4.6',1,'Dillon','CO'),
	('Lone Pine Creek Trail #951','9.3',3,'Red Feather Lakes','CO'),
	('East Blue River Trail #9104','1.2',1,'Silverthorne','CO'),
	('Bushee Creek Trail #9104.1','0.7',5,'Silverthorne','CO'),
	('Elk Horn Trail #925','3.5',5,'Saguache','CO'),
	('Piney Creek Trail','9.5',1,'Parker','CO'),
	('OT Loop','1.9',3,'Bellvue','CO'),
	('Bluff Point Fire Road','3.6',2,'Poquonock Bridge','CT'),
	('Salt Meadow Trail','1.3',2,'Westbrook Center','CT'),
	('Faulkner Island Trail','0.1',1,'Guilford Center','CT'),
	('Nipmuck Trail: East Branch','6.3',3,'Windham','CT'),
	('Lantern Hill Trail','0.6',5,'Ledyard Center','CT'),
	('Flood Control Levee North','1.5',2,'Mansfield City','CT'),
	('Flood Control Levee South','1.3',1,'Windham','CT'),
	('Bear Hill Outer Loop','1.8',1,'Bozrah','CT'),
	('Red Trail','1.3',2,'Mansfield City','CT'),
	('Summerwood Ridge Connector Trail','0.1',2,'Tolland','CT'),
	('Whitely Farms Trail','3.7',3,'Pike Creek','DE'),
	('Cross Country Trail','3.3',3,'Greenville','DE'),
	('Rocky Run Trail','1.8',3,'Greenville','DE'),
	('Brandywine Trail','2.7',1,'Greenville','DE'),
	('Longwall Trail','1.1',3,'Greenville','DE'),
	('C&D Canal Recreation Trail: Central','5.2',1,'Glasgow','DE'),
	('C&D Canal Recreation Trail: East','4.4',1,'Delaware City','DE'),
	('Fairfield Connector','0.3',1,'Newark','DE'),
	('Rocky Run to Woodlawn Road','0.8',1,'Greenville','DE'),
	('Rocky Run Cut-Off','0.4',3,'Greenville','DE'),
	('Garden of Eden Trail','2.5',4,'Bristol','FL'),
	('Florida Trail: St. Marks National Wildlife Refuge Section','22.3',1,'Crawfordville','FL'),
	('Florida Trail - Apalachicola East','32.8',5,'Crawfordville','FL'),
	('FNST: Econfina Section','10.9',4,'Youngstown','FL'),
	('FNST: Side Trail','0.6',1,'Youngstown','FL'),
	('Bill\'s Connector','0.5',1,'Tallahassee','FL'),
	('Creek Forest Trail','0.8',4,'Tallahassee','FL'),
	('Coon Bottom Loop','1.6',3,'Tallahassee','FL'),
	('Swamp Forest Loop','1.9',4,'Tallahassee','FL'),
	('Multi-Use Trail','2.7',1,'Woodville','FL'),
	('Earls Ford Portage #523','0.3',1,'Clayton','GA'),
	('Miller Trek Trail #46','5.5',5,'Hiawassee','GA'),
	('Lake Chatuge Trail #26','0.9',1,'Hiawassee','GA'),
	('Dick\'s Creek Falls Trail #60','0.2',1,'Clayton','GA'),
	('Willis Knob River Access #146B','1.2',1,'Clayton','GA'),
	('Jack\'s River Trail #13','16.5',4,'Benton','TN'),
	('Chief Ladiga Trail','34.0',1,'Cave Spring','GA'),
	('Eastern Trail','0.4',2,'Varnell','GA'),
	('The Western Trail','0.7',2,'Varnell','GA'),
	('Hemp Top Trail #145','5.0',5,'McCaysville','GA'),
	('Crater Rim Trail','2.9',3,'Volcano','HI'),
	('Halema\'uma\'u Trail','2.9',4,'Volcano','HI'),
	('Ka\'aha Trail','7.8',5,'Volcano','HI'),
	('Ka\'u Desert Trail','18.2',3,'Volcano','HI'),
	('Mauna Iki Trail','5.4',3,'Volcano','HI'),
	('\'Iliahi Trail','0.5',3,'Volcano','HI'),
	('Sulphur Banks Trail','0.7',1,'Volcano','HI'),
	('Escape Road','3.7',3,'Volcano','HI'),
	('The Puna Trail (Ha\'ena Beach)','2.6',2,'Hawaiian Paradise Park','HI'),
	('Kahauale\'a trail to 2018 Pu\'u O\'o flow','3.5',4,'Fern Acres','HI'),
	('NE Brickel Ridge Loop','6.6',1,'Spirit Lake','ID'),
	('Ruby Ridge Trail (#35)','10.2',5,'Bonners Ferry','ID'),
	('Fault Lake Trail #59','6.0',3,'Bonners Ferry','ID'),
	('Big Creek Divide Trail #306','1.8',5,'Stevensville','MT'),
	('Hulliman Ridge Trail','2.5',5,'Wallace','ID'),
	('Heart Lake #7','0.2',3,'Clarkia','ID'),
	('Heart Pass #65','4.9',3,'Clarkia','ID'),
	('Contest Mountain Road #2642','4.8',2,'Sandpoint','ID'),
	('Upper Elk Falls','0.2',3,'Orofino','ID'),
	('Lower Elk Falls','0.3',5,'Orofino','ID'),
	('Burnham Greenway: Black','2.6',3,'Burnham','IL'),
	('Oz Park Loop Trail','0.5',1,'Chicago','IL'),
	('Oz Park Garden Path','0.2',1,'Chicago','IL'),
	('North Pond Loop','0.8',1,'Chicago','IL'),
	('Diversey Harbor Loop Path','1.3',1,'Chicago','IL'),
	('Ball Field - Boathouse Connector Path','0.6',1,'Chicago','IL'),
	('Robert McClory Path','22.2',1,'Highwood','IL'),
	('Chain O\' Lakes Path','8.9',1,'Fox Lake','IL'),
	('Great Western Trail (Eastern portion)','12.0',1,'Villa Park','IL'),
	('Pond View Trail','0.5',1,'Crystal Lake','IL'),
	('Dunes Kankakee Trail','1.8',2,'Chesterton','IN'),
	('Trail 7','0.6',4,'Chesterton','IN'),
	('Darkside Access Loop','3.2',3,'Burns Harbor','IN'),
	('Beginner Loop','1.4',2,'Portage','IN'),
	('Iron Horse Heritage Trail','2.8',1,'Burns Harbor','IN'),
	('Nickel Plate Trail: Peru to Rochester','22.1',3,'Peru','IN'),
	('Blue Trail','5.1',1,'Bourbon','IN'),
	('Outer Loop Trail','0.6',2,'Osceola','IN'),
	('Pond Loop Trail','0.6',1,'Osceola','IN'),
	('Trail 4','5.2',3,'Albion','IN'),
	('Ledges Canyon Trail','0.2',2,'Boone','IA'),
	('Ledges Canyon Trail: Alternate Route','0.1',2,'Boone','IA'),
	('Coal Miner\'s Daughter Trail','1.7',3,'Indianola','IA'),
	('Comer Pocket Trail','0.7',4,'Indianola','IA'),
	('Riverside Trail','0.9',3,'Indianola','IA'),
	('Extra Credit Trail','0.5',4,'Indianola','IA'),
	('Omaha Riverfront Trail - North','15.3',1,'Carter Lake','IA'),
	('Lake Manawa State Park Trail','6.9',1,'Council Bluffs','IA'),
	('White-tail Trail','5.8',1,'Villisca','IA'),
	('High Trestle Bridge Access','0.4',2,'Madrid','IA'),
	('Scott Lake Loop Trail','7.2',3,'Scott City','KS'),
	('Golden Belt Loop','5.9',5,'Russell','KS'),
	('Hell Creek Loop','6.0',3,'Russell','KS'),
	('EZ Loop','5.6',1,'Russell','KS'),
	('Marina Loop','6.7',3,'Russell','KS'),
	('Landon Nature Trail','12.5',1,'Topeka','KS'),
	('Shunga Trail','9.1',1,'Topeka','KS'),
	('Cedar Trail','0.6',1,'Russell','KS'),
	('PrairyArt Path','0.8',3,'Cottonwood Falls','KS'),
	('JC River Walk Trail','5.0',1,'Junction City','KS'),
	('Blue Hole Loop','0.4',1,'Bowling Green','KY'),
	('Lost River Cave Greenway Trail','1.1',2,'Bowling Green','KY'),
	('Clyde F. Boyles Greenway Trail','4.4',1,'Paducah','KY'),
	('King Benson Trail','0.2',3,'Henderson','KY'),
	('Scenic View Trail','0.2',5,'Henderson','KY'),
	('Back Country Trail','2.4',5,'Henderson','KY'),
	('Wilderness Lake Trail','0.6',4,'Henderson','KY'),
	('Warbler Road Trail','0.6',2,'Henderson','KY'),
	('Eagle Glen Pet Trail','0.9',5,'Henderson','KY'),
	('Nature Trail and Peck Education Trail','0.6',1,'Paducah','KY'),
	('Bistineau Trail','10.0',3,'Sibley','LA'),
	('Mississippi River Trail: New Orleans to Norco','24.9',1,'Jefferson','LA'),
	('Mississippi River Trail','8.6',3,'Chalmette','LA'),
	('Lakefront Trail','7.4',1,'Metairie','LA'),
	('Dawson Creek Greenway','1.0',1,'Inniswold','LA'),
	('Ward Creek Greenway','2.5',1,'Inniswold','LA'),
	('Sandy Creek Primitive Trail','0.8',3,'Watson','LA'),
	('Old Timber Trail','0.4',2,'Watson','LA'),
	('Horseshoe Trail','1.7',2,'Watson','LA'),
	('Piney Knob Trail','0.7',2,'Watson','LA'),
	('Katahdin Loop Road','18.0',3,'Millinocket','ME'),
	('Lunksoos Road','7.8',1,'Patten','ME'),
	('Abol Pond Trail','1.9',3,'Millinocket','ME'),
	('Abol Stream Trail','1.2',3,'Millinocket','ME'),
	('Kettle Pond Trail','1.9',1,'Millinocket','ME'),
	('Caverly Pond Trail','0.1',1,'Millinocket','ME'),
	('Rum Pond Trail','2.0',3,'Millinocket','ME'),
	('Cranberry Pond Trail','1.4',1,'Millinocket','ME'),
	('Dwelley Pond Trail','5.5',1,'Patten','ME'),
	('Burnt Mountain Trail','1.3',5,'Patten','ME'),
	('Catoctin National Scenic Trail','26.3',4,'Braddock Heights','MD'),
	('Old Misery Trail','1.0',3,'Thurmont','MD'),
	('Lower Falls Trail','0.6',2,'Thurmont','MD'),
	('Cliff Trail','0.6',3,'Thurmont','MD'),
	('Catoctin Furnace Trail','0.4',2,'Thurmont','MD'),
	('Hog Rock Vista Trail','0.9',4,'Thurmont','MD'),
	('Boardwalk Trail','0.1',3,'Thurmont','MD'),
	('Canyon Overlook','0.3',2,'Cumberland','MD'),
	('Evitt\'s Mountain Trail','3.1',5,'Cumberland','MD'),
	('Lostland Run Trail','4.1',3,'Mountain Lake Park','MD'),
	('Woodland Loop 2','0.4',5,'Conway','MA'),
	('Woodland Loop 3','0.6',5,'Conway','MA'),
	('NET Alternate','1.5',3,'Shutesbury','MA'),
	('New England Trail/Metacomet-Monadnock Trail: MA Section 16','7.3',3,'Erving','MA'),
	('Dinosaur Footprints Trail','0.1',2,'Holyoke','MA'),
	('Lolapalooza Loop Trail','0.7',2,'Holyoke','MA'),
	('Trolley Trail','2.0',2,'North Chicopee','MA'),
	('Ogre Hollow Trail','0.3',1,'North Chicopee','MA'),
	('Westfield Road Connector','0.2',1,'North Chicopee','MA'),
	('Manhan Rail Trail','5.2',1,'Easthampton','MA'),
	('Hungarian Falls Trail','0.8',2,'Lake Linden','MI'),
	('Daisy Farm Trail','1.7',3,'Isle Royale','MI'),
	('NCT: MI Segment 2 - Central UP','182.3',3,'L\'Anse','MI'),
	('Harlow Farms Connector Trail','2.3',3,'Trowbridge Park','MI'),
	('Harlow Lake Trails','1.8',1,'Trowbridge Park','MI'),
	('Harlow Lake Trails','1.0',3,'Trowbridge Park','MI'),
	('NCT: Spur','9.0',1,'Negaunee','MI'),
	('Tyoga Historical Pathway','1.3',3,'Harvey','MI'),
	('Iron Ore Heritage Trail: Eagle Mills - Marquette Section','8.2',1,'Negaunee','MI'),
	('Canyon Gorge Trail','0.4',2,'L\'Anse','MI'),
	('NCT: MN Segment 1 - Northwest Minnesota','85.4',3,'Fergus Falls','MN'),
	('Chippewa "C" Gia Snomobile Tra Trail','20.8',1,'Walker','MN'),
	('Star Island Hiking Trail','1.7',1,'Bemidji','MN'),
	('Star Island Hiking Trail B','1.8',1,'Bemidji','MN'),
	('Star Island Hiking Trail F','0.4',1,'Bemidji','MN'),
	('Migizi Bike Trail','4.7',1,'Walker','MN'),
	('Meadow Lake Hwt K Trail','0.6',1,'Bemidji','MN'),
	('Meadow Lake Hwt J Trail','0.5',1,'Bemidji','MN'),
	('Meadow Lake Hwt D Trail','0.4',1,'Bemidji','MN'),
	('Elmwood Island Hiking Trail','0.5',1,'Redby','MN'),
	('Tuxachanie Trail','13.5',2,'Saucier','MS'),
	('Nester Trail','4.8',1,'Pontotoc','MS'),
	('Family Loop','0.3',3,'Meridian','MS'),
	('Gateway','0.9',3,'Meridian','MS'),
	('Zipper','0.8',5,'Meridian','MS'),
	('Hamburger Hill','0.2',5,'Meridian','MS'),
	('The Bowl','0.9',3,'Meridian','MS'),
	('Badlands Trail','5.1',3,'Latimer','MS'),
	('Boat Ramp','4.1',3,'Pontotoc','MS'),
	('Black Creek National Hiking Trail #205','38.9',3,'Purvis','MS'),
	('Krug Loop','6.9',3,'Saint Joseph','MO'),
	('Girl Scout Trail','3.9',3,'Saint Joseph','MO'),
	('Battlefield Trail','0.3',1,'Lexington','MO'),
	('Prairie Creek Greenway Loop','4.1',3,'Platte City','MO'),
	('Shin-Ga-Wa-Sa Nature Trail','1.2',3,'Grandview','MO'),
	('Deer Run Trail','0.9',1,'Maryville','MO'),
	('Hidden Bridges','0.4',1,'Maryville','MO'),
	('Finch Meadow','0.9',1,'Maryville','MO'),
	('Old Kate Trail','0.8',2,'Parkville','MO'),
	('White Tail Trail','1.4',4,'Parkville','MO'),
	('Bonnet Top Trail #583','3.4',5,'Eureka','MT'),
	('Douglas Hill Off-Highway Vehicle South Spur B Trail #254B','0.3',1,'Eureka','MT'),
	('Gateway Trail #551','6.6',1,'Eureka','MT'),
	('Barnum Creek Trail #24','5.7',5,'Kalispell','MT'),
	('Ant Flat Trail #348','0.6',1,'Eureka','MT'),
	('Slimmer Creek Trail #442','3.0',5,'Somers','MT'),
	('Murphy Lake Trail #120','0.7',5,'Eureka','MT'),
	('Swisher Lake Trail #470','1.4',3,'Eureka','MT'),
	('McGregor Shoreline Trail #60','2.8',3,'Lakeside','MT'),
	('Blossom Lakes','3.9',2,'Wallace','ID'),
	('Riverfront Paved Trail','0.8',1,'Omaha','NE'),
	('Hardwood Trail','7.1',5,'Falls City','NE'),
	('Branched Oak area 7','4.2',3,'Seward','NE'),
	('Jim MacAllister Nature Trail','1.5',3,'Valentine','NE'),
	('South Overlook Trail','0.1',1,'Terrytown','NE'),
	('North Overlook Trail','0.2',3,'Terrytown','NE'),
	('Saddle Rock Trail','1.7',5,'Gering','NE'),
	('Campground Loop','0.6',1,'Seward','NE'),
	('Bisect Path','0.7',1,'Seward','NE'),
	('Shore Trail','0.9',1,'Seward','NE'),
	('Rim to Reno Trail - North Loop','4.9',3,'Mogul','NV'),
	('Quail Valley Trail','1.3',3,'Reno','NV'),
	('Cold Valley Trail','0.8',3,'Reno','NV'),
	('Aspen Grove Trail','1.2',5,'Reno','NV'),
	('Cold Canyon Spur','1.7',4,'Reno','NV'),
	('Old Lookout Trail','0.6',6,'Reno','NV'),
	('Mt. Houghton Peak Spur','0.6',3,'Incline Village','NV'),
	('Granite Hills','5.0',5,'Cold Springs','NV'),
	('Pinyon Trail','4.1',1,'Gardnerville Ranchos','NV'),
	('Magic Trek Road NV001','1.6',3,'Gardnerville Ranchos','NV'),
	('Goose Eye Trail','3.1',6,'Berlin','NH'),
	('Carlo Col Trail','2.4',5,'Berlin','NH'),
	('Bald Mountain Notch Trail','2.9',4,'Groveton','NH'),
	('Pike Pond Trail','0.5',2,'Groveton','NH'),
	('Bald Mountain Trail','0.5',5,'Stratford','NH'),
	('Rowell Link','1.3',3,'Groveton','NH'),
	('Old Summer Club Trail','2.0',3,'Groveton','NH'),
	('Fourth Connecticut Lake Trail','0.7',5,'Cookshire-Eaton','QC'),
	('Cross New Hampshire Adventure Trail','84.2',2,'Woodsville','NH'),
	('Cross VT Trail: Village of Wells River (CT River) - Boltonvill…','4.0',1,'Woodsville','NH'),
	('Red Trail','0.5',1,'Berkeley Heights','NJ'),
	('Timberdoodle Trail','2.1',1,'Vernon Valley','NJ'),
	('Blue Trail','2.0',1,'Berkeley Heights','NJ'),
	('Green Trail','0.7',1,'Berkeley Heights','NJ'),
	('Laurel Trail','0.7',1,'New Providence','NJ'),
	('Orange Trail','1.6',1,'Berkeley Heights','NJ'),
	('Ivory Trail','0.8',1,'Bernardsville','NJ'),
	('Yellow Trail','0.4',1,'Tenafly','NJ'),
	('Peninsula Trail','6.3',2,'Highlands','NJ'),
	('Historic Post Trail','1.3',1,'Highlands','NJ'),
	('La Luz Trail','7.7',5,'Sandia Heights','NM'),
	('La Luz - Tramway Connector','2.6',3,'Sandia Heights','NM'),
	('CDT: New Mexico Border to Blue Lake (CO Sec. 1)','30.6',3,'Chama','NM'),
	('CDT: NM Hwy 36 & 117 Jnct AP (NM Sec. 18)','23.6',1,'Black Rock','NM'),
	('CDT: NM Hwy 117 AP (NM Sec. 19)','56.8',1,'Milan','NM'),
	('CDT: FR 239A TH (NM Sec. 23)','30.6',1,'Laguna','NM'),
	('UNM North Course Trail','2.0',2,'Albuquerque','NM'),
	('Paseo del Bosque Trail','19.4',1,'South Valley','NM'),
	('Corrales Bosque Part 1','6.4',2,'Los Ranchos de Albuquerque','NM'),
	('Ojito Wilderness Trail','2.9',3,'Jemez Pueblo','NM'),
	('Old Thunder Run','3.4',3,'Salamanca','NY'),
	('Ridge Run','4.8',1,'Salamanca','NY'),
	('Leonard Run','2.9',1,'Salamanca','NY'),
	('Christian Hollow','1.7',1,'Salamanca','NY'),
	('Sweetwater','2.4',1,'Salamanca','NY'),
	('Sweetwater','2.4',1,'Salamanca','NY'),
	('Groveland Secondary Trailway','22.3',1,'Attica','NY'),
	('Wildlife Access Road','0.6',1,'Gowanda','NY'),
	('Chautauqua Lake Snowmobile Club Trail','0.6',1,'Mayville','NY'),
	('Chautauqua Lake Snowmobile Club Trail','0.5',1,'Mayville','NY'),
	('Ferguson Cabin Horse Trail','0.6',1,'Cove Creek','NC'),
	('The Palmetto Trail: Blue Wall Passage','14.5',4,'Tryon','NC'),
	('Betty Place Trail','0.9',5,'Marshall','NC'),
	('Shutin Creek','2.1',3,'Marshall','NC'),
	('Vaughn Creek Greenway','0.9',1,'Tryon','NC'),
	('Happy Valley Greenway (South segment)','0.9',1,'Lenoir','NC'),
	('Happy Valley Greenway (North Segment)','0.4',1,'Lenoir','NC'),
	('Tuckasegee High Falls North Trail','2.1',3,'Cullowhee','NC'),
	('Yellow Trail','0.5',2,'Burnsville','NC'),
	('Red Trail','0.8',3,'Burnsville','NC'),
	('Fisher Loop','0.7',1,'Grand Forks Air Force Base','ND'),
	('Timber Loop','1.1',3,'Grand Forks Air Force Base','ND'),
	('River View Trail','0.8',3,'Grand Forks Air Force Base','ND'),
	('Eco Loop','1.0',1,'Grand Forks Air Force Base','ND'),
	('Cattail Trail','0.6',2,'Grand Forks Air Force Base','ND'),
	('Prairie Pass Trail','0.7',1,'Grand Forks Air Force Base','ND'),
	('Coneflower Loop','0.6',1,'Grand Forks Air Force Base','ND'),
	('Gooseberry Park Trail','3.5',2,'Fargo','ND'),
	('Split Rock Trail','1.6',3,'Jamestown','ND'),
	('North Country Trail: Valley City','4.9',3,'Valley City','ND'),
	('Outer Loop','2.0',3,'Lyndhurst','OH'),
	('West Loop','0.9',1,'Lyndhurst','OH'),
	('North Fork Trail','1.4',3,'Montrose-Ghent','OH'),
	('Sycamore Trail','1.1',1,'Miami Heights','OH'),
	('Quarry Loop','1.6',2,'North Olmsted','OH'),
	('Cahoon Creek Loop','0.7',2,'North Olmsted','OH'),
	('Bunn\'s Lake Loop','0.5',2,'North Olmsted','OH'),
	('Pin Oak Loop','0.6',2,'North Olmsted','OH'),
	('Seven Ponds Trail','1.2',1,'Reminderville','OH'),
	('Eagle Point Oberservation Deck','0.2',1,'Reminderville','OH'),
	('Lake Hefner Loop','9.9',1,'The Village','OK'),
	('Oklahoma River Trail - South','7.2',1,'Oklahoma City','OK'),
	('Katy Trail','6.6',1,'Oklahoma City','OK'),
	('Tinker/Draper Trail','4.8',1,'Del City','OK'),
	('Will Rogers Trail','8.5',1,'Oklahoma City','OK'),
	('Lake Overholser Trail','2.2',1,'Bethany','OK'),
	('West River Trail','8.0',1,'Bethany','OK'),
	('Oklahoma River Trail - North','1.9',1,'Oklahoma City','OK'),
	('Oklahoma City Community Foundation Trail','4.5',1,'Oklahoma City','OK'),
	('South Grand Boulevard Trail','10.6',1,'Oklahoma City','OK'),
	('Pilot Butte Trail','0.9',3,'Bend','OR'),
	('Broken Top Trail to No Name Lake','2.2',3,'Bend','OR'),
	('Tam McArthur Rim Trail #4078','2.6',3,'Sisters','OR'),
	('Park Meadow Trail #4075','5.1',3,'Sisters','OR'),
	('Park Meadow Tie Trail #4102','2.5',2,'Sisters','OR'),
	('Little Three Creek Trail #4076','1.4',2,'Sisters','OR'),
	('Loppet Trail','3.5',1,'La Grande','OR'),
	('Oregon Trail Nat\'l Historic #1842','8.5',3,'La Grande','OR'),
	('Evans OHV','2.3',5,'La Grande','OR'),
	('Deep Creek stairway #218','0.3',2,'Joseph','OR'),
	('Braddock Trail','1.5',1,'Edgewood','PA'),
	('MST - Section 4','12.8',4,'Defiance','PA'),
	('Three Rivers Heritage Trail','10.0',1,'McKees Rocks','PA'),
	('Dimeling to Madera Trail','18.3',3,'Osceola Mills','PA'),
	('Paul Trail','2.3',3,'Clymer','PA'),
	('Loysburg Flag Lookout Trail','0.3',5,'Defiance','PA'),
	('Gobbler\'s Knob','0.4',1,'Punxsutawney','PA'),
	('Tom\'s Run Loop','3.0',4,'Emsworth','PA'),
	('Building Mill Trail','0.5',2,'Ben Avon','PA'),
	('Ann Boocock Coburn Trail','1.5',3,'Bell Acres','PA'),
	('Perimeter Loop','1.1',1,'West Warwick','RI'),
	('Jerimoth Hill Trail','0.1',1,'Foster','RI'),
	('North South Trail: Segment 4 - Northern Coventry, Foster','11.1',3,'Coventry','RI'),
	('North South Trail: Segment 5 - Northern Foster, Killingly, Glo…','13.9',3,'Foster','RI'),
	('North South Trail: Segment 6 - Glocester, Burrillville','12.6',3,'Chepachet','RI'),
	('Red Trail','1.6',1,'Hope Valley','RI'),
	('Green Link','0.3',1,'Hope Valley','RI'),
	('Ben Utter Trail','0.3',1,'West Greenwich','RI'),
	('Tanner Cutoff','1.1',2,'West Greenwich','RI'),
	('Laurel Loop/Yawgoog Trail (Blue Yellow)','0.6',1,'Hope Valley','RI'),
	('The Palmetto Trail: Hub City Passage','11.1',1,'Spartanburg','SC'),
	('Watergauge Trail #210','0.4',1,'Walhalla','SC'),
	('Big Island Ford Trail #146C','0.4',1,'Mountain City','GA'),
	('Hood Center Trail','0.8',1,'Rock Hill','SC'),
	('Wetland Trail - River Park','0.4',3,'Fort Mill','SC'),
	('Tech Park Lakeshore Trail','0.6',2,'Rock Hill','SC'),
	('Manchester Meadows Park Trail','0.6',2,'Rock Hill','SC'),
	('Cowpens Trail - Overmountain Victory National Historic Trail','1.6',3,'Mayo','SC'),
	('River Trail - River Park','0.8',2,'Fort Mill','SC'),
	('Waterford Trail - River Park','1.5',2,'Fort Mill','SC'),
	('Rankin Ridge Trail','1.0',2,'Hot Springs','SD'),
	('Sanctuary Trail','3.6',1,'Hot Springs','SD'),
	('Centennial Trail','6.0',3,'Hot Springs','SD'),
	('Highland Creek Trail','8.7',3,'Hot Springs','SD'),
	('Lookout Point Trail','2.2',3,'Hot Springs','SD'),
	('Wind Cave Canyon Trail','1.9',2,'Hot Springs','SD'),
	('Victoria\'s Secret C-Cup','6.9',5,'Colonial Pine Hills','SD'),
	('Victoria Lake Loop 15','15.0',5,'Colonial Pine Hills','SD'),
	('Centennial Trail - Brush Creek TH to Dakota Point TH Access','6.8',3,'Colonial Pine Hills','SD'),
	('Centennial Trail - Spring Creek TH to Dakota Point TH Access','1.9',3,'Colonial Pine Hills','SD'),
	('Shelby Farms Greenline','11.3',1,'Memphis','TN'),
	('Shelby Farms Greenline','7.5',2,'Memphis','TN'),
	('V&E Greenline','1.7',1,'Memphis','TN'),
	('Dry Ridge Trail','3.3',1,'Selmer','TN'),
	('Dry Ridge Connector','0.5',1,'Selmer','TN'),
	('Cypress Dismal Swamp Boardwalk','0.5',1,'Selmer','TN'),
	('Turkey Call Trail','2.4',3,'Selmer','TN'),
	('Big Hill Pond Trail','5.0',1,'Selmer','TN'),
	('Dogwood Point Trail','3.3',3,'Selmer','TN'),
	('Azaela Spring Day Loop','3.0',2,'Selmer','TN'),
	('Three Hills Loop Trail','2.6',3,'Canutillo','TX'),
	('Middle Hill East Segment','0.2',3,'Canutillo','TX'),
	('South Hill Summit Segment','0.1',3,'Canutillo','TX'),
	('Three Hills Southeast Detour','0.4',3,'Canutillo','TX'),
	('Three Hills Loop 1','0.4',2,'Canutillo','TX'),
	('Three Hills Loop 3','0.6',1,'Canutillo','TX'),
	('Three Hills Interstate Spur','0.8',3,'Canutillo','TX'),
	('Sitting Bull','0.9',3,'Westway','TX'),
	('Fat Tire','0.9',3,'Westway','TX'),
	('South Ridge','1.1',3,'Westway','TX'),
	('BST: WSU to Beus Canyon Trail','1.7',4,'South Ogden','UT'),
	('Waterfall Canyon Trail','1.2',4,'Ogden','UT'),
	('Birdsong Trail','0.8',2,'Ogden','UT'),
	('Gib\'s Loop','2.1',1,'Ogden','UT'),
	('Pot Hollow Trail #2037','2.1',3,'Midway','UT'),
	('BST: 12th Street to Jumpoff Canyon','3.8',3,'Ogden','UT'),
	('Taylor Canyon Trail','1.5',2,'Ogden','UT'),
	('Hidden Valley Trail','2.4',3,'Ogden','UT'),
	('First Hamongog Trail #200','3.3',5,'Alpine','UT'),
	('Geographical Center of Utah','0.2',4,'Ephraim','UT'),
	('Sucker Brook Hollow Trail','1.1',3,'Williston','VT'),
	('Cross VT Trail: Moretown (Lovers Lane) - Duxbury (River Rd)','6.0',1,'Waterbury','VT'),
	('Cross VT Trail: Williston (Central School) - Williston (Rt 2A)','3.6',1,'Williston','VT'),
	('Duck Brook Trail','5.2',4,'Williston','VT'),
	('The Long Trail (Division 11)','25.9',5,'Johnson','VT'),
	('Summit Tower Spur','0.1',3,'Hyde Park','VT'),
	('The Long Trail (Division 12)','21.9',5,'Hyde Park','VT'),
	('Spruce Ledge Shelter Spur','0.1',3,'Hyde Park','VT'),
	('Haystack Summit Spur','0.1',2,'Richford','VT'),
	('McCuin Recreational Trail','0.8',1,'Swanton','VT'),
	('Trillium Trail','1.1',5,'Prices Fork','VA'),
	('Skullcap Trail','1.4',3,'Blacksburg','VA'),
	('Snake Root Trail','2.3',3,'Blacksburg','VA'),
	('Jacobs Ladder Trail','1.3',5,'Prices Fork','VA'),
	('Gateway Trail','1.7',4,'Blacksburg','VA'),
	('Huckleberry Trail','8.4',1,'Blacksburg','VA'),
	('Wong Park Outer Perimeter Walking Path','0.4',1,'Blacksburg','VA'),
	('High Meadow Trail','1.4',2,'Galax','VA'),
	('Fisher Peak Loop Trail','1.6',3,'Galax','VA'),
	('Lake Keokee to High Butte and Roaring Branch','8.5',4,'Appalachia','VA'),
	('Talapus Lake Spur Trail','0.3',2,'Riverbend','WA'),
	('Cedar Lake','0.7',5,'Greenwater','WA'),
	('Grouse Spring','1.9',5,'South Wenatchee','WA'),
	('Money Creek Road','7.3',3,'Skykomish','WA'),
	('Norse Peak View','0.8',4,'Greenwater','WA'),
	('Old Ellensburg Trail','3.5',3,'South Wenatchee','WA'),
	('Sawmill Creek Trail','3.1',5,'Greenwater','WA'),
	('Sawmill Ridge','2.5',5,'Greenwater','WA'),
	('Sultan River Canyon Trail','1.8',5,'Gold Bar','WA'),
	('Tamanous Trail #27','0.6',3,'North Bonneville','WA'),
	('Western Ridge Trail','3.7',4,'Silver Spring','MD'),
	('Valley Trail - South','2.1',4,'Washington','DC'),
	('Mount Vernon Trail','18.9',2,'Washington','DC'),
	('Bike Trail #1 - Wise Rd. along Oregon Ave','1.4',1,'Washington','DC'),
	('Bike Trail #2 - Beach Drive to Bingham Drive','1.2',3,'Washington','DC'),
	('Bike Trail #4 - Glover Rd South to Beach Dr','0.8',1,'Washington','DC'),
	('Capitol Columns Loop','0.7',1,'Washington','DC'),
	('Hamilton Loop','0.4',3,'Washington','DC'),
	('Hamilton Trail','0.4',3,'Washington','DC'),
	('Azalea Path','0.5',1,'Washington','DC'),
	('Snowshoe Walking/Biking Path','1.7',1,'Marlinton','WV'),
	('Shavers Lake Trail','1.2',1,'Marlinton','WV'),
	('Shavers Lake Road','3.2',1,'Marlinton','WV'),
	('Fire Tower Trail','2.1',3,'Marlinton','WV'),
	('Silver Creek Parkway','1.2',1,'Marlinton','WV'),
	('Upper Spruce Road','3.9',1,'Marlinton','WV'),
	('Lower Spruce Road','1.5',1,'Marlinton','WV'),
	('Airport Runway','1.7',1,'Marlinton','WV'),
	('Airport Road','0.9',1,'Marlinton','WV'),
	('North Fork Mountain Trail #501','23.9',4,'Franklin','WV'),
	('North Country Trail - Chequamegon and Brule Forests','91.7',3,'Lake Nebagamon','WI'),
	('Circle Trail','4.8',3,'Bloomer','WI'),
	('Mountain Bay State Trail: Wausau to Shawano','48.0',1,'Weston','WI'),
	('Ice Age Trail','2.8',3,'Sturgeon Bay','WI'),
	('Tower Trail','3.8',3,'Sturgeon Bay','WI'),
	('Hemlock Trail','2.7',1,'Sturgeon Bay','WI'),
	('Eagle Trail','2.1',4,'Marinette','WI'),
	('Minnehaha Trail','0.7',1,'Marinette','WI'),
	('Sentinel Trail','1.7',1,'Marinette','WI'),
	('Lone Pine Trail','0.8',3,'Marinette','WI'),
	('Little Goose Falls Trail #12','0.3',3,'Sheridan','WY'),
	('South Piney Creek Trail','1.3',3,'Sheridan','WY'),
	('Spearhead Peak Summit Spur','0.5',5,'Moose Wilson Road','WY'),
	('Beaver Ponds #4025B','0.9',1,'South Park','WY'),
	('State Line #3026','14.5',3,'Afton','WY'),
	('Spring Creek (West Side) #3027','12.1',1,'Afton','WY'),
	('Glacier Lake Trail #3','2.1',4,'Tower Junction','WY'),
	('South Fork Indian Creek','8.7',5,'Hoback','WY'),
	('Sheridan Pathways','7.2',1,'Sheridan','WY'),
	('Heart Mountain Trail','3.8',3,'Cody','WY');

INSERT into hike (hike_id, hike_date, hike_difficulty, `description`, hiker_id, trail_id)
	values
	(1,'2022-08-12','Easy',"Was a beautiful hike. Nothing stood out, though.","therealjohnsmith",27),
	(2,'2022-08-20','Intermediate',"Bees. So many bees. Nice view, but just...bees.","therealjohnsmith",159),
	(3,'2022-08-24','Intermediate',"Gorgeous mountain views!","therealjohnsmith",8),
	(4,'2022-09-21','Difficult',"Very steep!","therealjohnsmith",34),
	(5,'2022-09-24','Intermediate',"Gorgeous foilage.","therealjohnsmith",47),
	(6,'2022-09-27','Easy',"Super flat, clean trail.","therealjohnsmith",58);
