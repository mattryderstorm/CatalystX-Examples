CREATE TABLE inventory (                                                     
  inv_id int(11) NOT NULL AUTO_INCREMENT,                                             
  client_id int(11) NOT NULL,                                                     
  amount decimal(10,2) NOT NULL DEFAULT '0.00',                                   
  tax decimal(10,2) NOT NULL DEFAULT '0.00',                                      
  total decimal(10,2) NOT NULL DEFAULT '0.00',                                    
  note char(100) DEFAULT NULL,                                 
  PRIMARY KEY  (inv_id) 
);
INSERT INTO inventory(
  inv_id,
  client_id,
  amount,
  tax,
  total,
  note)
VALUES
  (1,2339,103.98,45.34,149.32,"This is record 1."),
  (2,1171,104.98,46.34,151.32,"This is record 2."), 
  (3,5232,105.98,47.34,153.32,"This is record 3."), 
  (4,9110,106.98,48.34,155.32,"This is record 4."), 
  (5,5232,107.98,49.34,157.32,"This is record 5."), 
  (6,8471,108.98,50.34,159.32,"This is record 6."), 
  (7,2339,109.98,51.34,161.32,"This is record 7."), 
  (8,8471,110.98,52.34,163.32,"This is record 8."), 
  (9,3632,111.98,53.34,165.32,"This is record 9."), 
  (10,6483,112.98,54.34,167.32,"This is record 10."), 
  (11,2333,113.98,55.34,169.32,"This is record 11."), 
  (12,9110,114.98,56.34,171.32,"This is record 12."), 
  (13,1005,115.98,57.34,173.32,"This is record 13."), 
  (14,9987,116.98,58.34,175.32,"This is record 14."), 
  (15,6483,117.98,59.34,177.32,"This is record 15."), 
  (16,5249,118.98,60.34,179.32,"This is record 16."), 
  (17,2333,119.98,61.34,181.32,"This is record 17."), 
  (18,1171,120.98,62.34,183.32,"This is record 18."), 
  (19,1005,121.98,63.34,185.32,"This is record 19."), 
  (20,7377,122.98,64.34,187.32,"This is record 20."), 
  (21,1171,123.98,65.34,189.32,"This is record 21."), 
  (22,5232,124.98,66.34,191.32,"This is record 22."), 
  (23,9110,125.98,67.34,193.32,"This is record 23."), 
  (24,1728,126.98,68.34,195.32,"This is record 24."), 
  (25,4732,127.98,69.34,197.32,"This is record 25."), 
  (26,8221,128.98,70.34,199.32,"This is record 26."), 
  (27,9110,129.98,71.34,201.32,"This is record 27."), 
  (28,2232,130.98,72.34,203.32,"This is record 28."), 
  (29,6483,131.98,73.34,205.32,"This is record 29."), 
  (30,5232,132.98,74.34,207.32,"This is record 30."), 
  (31,9483,133.98,75.34,209.32,"This is record 31."), 
  (32,2985,134.98,76.34,211.32,"This is record 32."), 
  (33,8221,135.98,77.34,213.32,"This is record 33."), 
  (34,7377,136.98,78.34,215.32,"This is record 34."), 
  (35,8471,137.98,79.34,217.32,"This is record 35."), 
  (36,3632,138.98,80.34,219.32,"This is record 36."), 
  (37,2112,139.98,81.34,221.32,"This is record 37.");
