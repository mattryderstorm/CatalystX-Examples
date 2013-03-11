CREATE TABLE `user` (
  id            INT UNSIGNED NOT NULL AUTO_INCREMENT,
  username      VARCHAR(30) NOT NULL,
  firstname     VARCHAR(30),
  lastname      VARCHAR(30),
  PRIMARY KEY (id)
) ENGINE=InnoDB;
--
CREATE TABLE blog (
  id      INT UNSIGNED NOT NULL AUTO_INCREMENT,
  userid  INT UNSIGNED NOT NULL,
  title   TEXT NOT NULL,
  content TEXT NOT NULL,
  FOREIGN KEY (userid) REFERENCES `user`(id) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (id)
) ENGINE=InnoDB;
--
INSERT INTO `user` (id, username) VALUES (1, 'webmaster');
INSERT INTO `user` (id, username, firstname) VALUES (2, 'sally1', 'Mustang');
INSERT INTO `user` (id, username, lastname) VALUES (3, 'sally2', 'Sally');
INSERT INTO `user` (id, username, firstname, lastname) VALUES (4, 'sally3', 'Mustang', 'Sally');
INSERT INTO `user` (id, username, firstname, lastname) VALUES (5, 'billyt', 'Billy T.', 'Barfoe');
--
INSERT INTO blog (id, userid, title, content) VALUES (1, 1, 'Welcome webmaster',
  'Congratulations, you are now a member of yardbirdfanclub.org.'); 
--
INSERT INTO blog (id, userid, title, content) VALUES (2, 2, 'Welcome sally1',
  'Congratulations, you are now a member of yardbirdfanclub.org.'); 
--
INSERT INTO blog (id, userid, title, content) VALUES (3, 3, 'Welcome sally2',
  'Congratulations, you are now a member of yardbirdfanclub.org.'); 
--
INSERT INTO blog (id, userid, title, content) VALUES (4, 4, 'Welcome sally3',
  'Congratulations, you are now a member of yardbirdfanclub.org.'); 
--
INSERT INTO blog (id, userid, title, content) VALUES (5, 5, 'Welcome billyt',
  'Congratulations, you are now a member of yardbirdfanclub.org.');
