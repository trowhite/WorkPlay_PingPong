BEGIN TRANSACTION;
CREATE TABLE [Tournaments] (
  [Id] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE, 
  [Timestamp] TIMESTAMP NOT NULL, 
  [Name] TEXT, 
  [Tournament_Tag] INTEGER NOT NULL, 
  [Match_Format] INTEGER NOT NULL CONSTRAINT [FK_Match_Format] REFERENCES [MatchFormats]([Id]), 
  [Match_Type] INTEGER NOT NULL CONSTRAINT [FK_Match_Type] REFERENCES [MatchTypes]([Id]), 
  [Match_Setup] INTEGER NOT NULL CONSTRAINT [FK_Match_Setup] REFERENCES [MatchSetups]([Id]), 
  [Next_Level_Tournament_Id] INTEGER, 
  [Num_Participants] INTEGER NOT NULL, 
  [Num_Rounds] INTEGER NOT NULL, 
  [Description] TEXT);
INSERT INTO `Tournaments` VALUES (0,'2015-01-09 11:30:00.000','None',0,0,0,0,NULL,0,0,'No tournament');
INSERT INTO `Tournaments` VALUES (1,'2015-01-09 11:30:00.000','Super Cup Singles Tournament 2015',1,0,1,0,NULL,13,4,'Round robin group stages then single elimination tournament');
INSERT INTO `Tournaments` VALUES (2,'2015-01-09 11:30:00.000','Super Cup Singles Tournament 2015 - Group A',1,321,1,300,7,4,1,'Round robin group stages');
INSERT INTO `Tournaments` VALUES (3,'2015-01-09 11:30:00.000','Super Cup Singles Tournament 2015 - Group B',1,321,1,300,7,3,1,'Round robin group stages');
INSERT INTO `Tournaments` VALUES (4,'2015-01-09 11:30:00.000','Super Cup Singles Tournament 2015 - Group C',1,321,1,300,7,3,1,'Round robin group stages');
INSERT INTO `Tournaments` VALUES (5,'2015-01-09 11:30:00.000','Super Cup Singles Tournament 2015 - Group D',1,321,1,300,7,3,1,'Round robin group stages');
INSERT INTO `Tournaments` VALUES (6,'2015-01-09 11:30:00.000','Super Cup Singles Tournament 2015 - Elimination Braket, First Round',1,521,1,100,8,8,1,'Single elimination stage - First Round');
INSERT INTO `Tournaments` VALUES (7,'2015-01-09 11:30:00.000','Super Cup Singles Tournament 2015 - Elimination Braket, Semi Finals',1,521,1,100,9,4,1,'Single elimination stage - Semi Finals');
INSERT INTO `Tournaments` VALUES (8,'2015-01-09 11:30:00.000','Super Cup Singles Tournament 2015 - Elimination Braket, Finals',1,521,1,100,2,2,1,'Single elimination stage - Finals');
INSERT INTO `Tournaments` VALUES (9,'2015-02-02 13:40:00.000','Super Cup Doubles Tournament 2015',2,321,2,200,NULL,16,3,'Double elimination doubles tournament');
CREATE TABLE [Teams] (
  [Id] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE, 
  [Group] INTEGER NOT NULL, 
  [Name] TEXT, 
  [Player_Id] INTEGER NOT NULL CONSTRAINT [FK_Player] REFERENCES [Players]([Id]));
INSERT INTO `Teams` VALUES (1,1,'Noel Chua',1);
INSERT INTO `Teams` VALUES (2,2,'Nathan Kammerzell',2);
INSERT INTO `Teams` VALUES (3,3,'Navdeep Singh',3);
INSERT INTO `Teams` VALUES (4,4,'Vijay Yadav',4);
INSERT INTO `Teams` VALUES (5,5,'Patrick Daly',5);
INSERT INTO `Teams` VALUES (6,6,'Johannes Albani',6);
INSERT INTO `Teams` VALUES (7,7,'Palani Prakash',7);
INSERT INTO `Teams` VALUES (8,8,'Sean Yoon',8);
INSERT INTO `Teams` VALUES (9,9,'Christian Kim',9);
INSERT INTO `Teams` VALUES (10,10,'Kyle Williams',10);
INSERT INTO `Teams` VALUES (11,11,'Emily Zheng',11);
INSERT INTO `Teams` VALUES (12,12,'Joann Jiang',12);
INSERT INTO `Teams` VALUES (13,13,'Kevin Ting',13);
INSERT INTO `Teams` VALUES (14,14,'Matthew White',14);
INSERT INTO `Teams` VALUES (15,15,'Sangeeta Venkatachalam',15);
INSERT INTO `Teams` VALUES (16,16,'Allen Berendzen',16);
INSERT INTO `Teams` VALUES (17,17,'Clint Bland',17);
INSERT INTO `Teams` VALUES (18,1000,'Team Awesome',9);
INSERT INTO `Teams` VALUES (19,1000,'Team Awesome',10);
INSERT INTO `Teams` VALUES (20,1001,'EB Ninjas',3);
INSERT INTO `Teams` VALUES (21,1001,'EB Ninjas',14);
INSERT INTO `Teams` VALUES (22,1002,'Shut Up',4);
INSERT INTO `Teams` VALUES (23,1002,'Shut Up',15);
INSERT INTO `Teams` VALUES (24,1003,'I Am So In Rage',6);
INSERT INTO `Teams` VALUES (25,1003,'I Am So In Rage',16);
INSERT INTO `Teams` VALUES (26,1004,'Size Matters',5);
INSERT INTO `Teams` VALUES (27,1004,'Size Matters',8);
INSERT INTO `Teams` VALUES (28,1005,'Atomic Supermen',2);
INSERT INTO `Teams` VALUES (29,1005,'Atomic Supermen',17);
INSERT INTO `Teams` VALUES (30,1006,'Y Not',11);
INSERT INTO `Teams` VALUES (31,1006,'Y Not',12);
INSERT INTO `Teams` VALUES (32,1007,'Sucker Punch',7);
INSERT INTO `Teams` VALUES (33,1007,'Sucker Punch',13);
CREATE TABLE "Players" (
	`Id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`Name`	TEXT
);
INSERT INTO `Players` VALUES (1,'Noel Chua');
INSERT INTO `Players` VALUES (2,'Nathan Kammerzell');
INSERT INTO `Players` VALUES (3,'Navdeep Singh');
INSERT INTO `Players` VALUES (4,'Vijay Yadav');
INSERT INTO `Players` VALUES (5,'Patrick Daly');
INSERT INTO `Players` VALUES (6,'Johannes Albani');
INSERT INTO `Players` VALUES (7,'Palani Prakash');
INSERT INTO `Players` VALUES (8,'Sean Yoon');
INSERT INTO `Players` VALUES (9,'Christian Kim');
INSERT INTO `Players` VALUES (10,'Kyle Williams');
INSERT INTO `Players` VALUES (11,'Emily Zheng');
INSERT INTO `Players` VALUES (12,'Joann Jiang');
INSERT INTO `Players` VALUES (13,'Kevin Ting');
INSERT INTO `Players` VALUES (14,'Matthew White');
INSERT INTO `Players` VALUES (15,'Sangeeta Venkatachalam');
INSERT INTO `Players` VALUES (16,'Allen Berendzen');
INSERT INTO `Players` VALUES (17,'Clint Bland');
CREATE TABLE [MatchTypes] (
  [Id] INTEGER NOT NULL PRIMARY KEY UNIQUE, 
  [Description] TEXT);
INSERT INTO `MatchTypes` VALUES (0,'Undefined');
INSERT INTO `MatchTypes` VALUES (1,'Singles');
INSERT INTO `MatchTypes` VALUES (2,'Doubles');
CREATE TABLE [MatchSetups] (
  [Id] INTEGER NOT NULL PRIMARY KEY UNIQUE, 
  [Description] TEXT);
INSERT INTO `MatchSetups` VALUES (0,'Undefined');
INSERT INTO `MatchSetups` VALUES (100,'Single Elimination');
INSERT INTO `MatchSetups` VALUES (200,'Double Elimination');
INSERT INTO `MatchSetups` VALUES (300,'Round Robin');
CREATE TABLE "MatchOutcomes" (
  [Id] INTEGER NOT NULL PRIMARY KEY, 
  [Description] TEXT);
INSERT INTO `MatchOutcomes` VALUES (0,'Loss');
INSERT INTO `MatchOutcomes` VALUES (1,'Win');
INSERT INTO `MatchOutcomes` VALUES (2,'Tie');
CREATE TABLE "MatchFormats" (
	`Id`	INTEGER NOT NULL UNIQUE,
	`Points_per_Game`	INTEGER NOT NULL,
	`Max_Games_per_Match`	INTEGER NOT NULL,
	`Description`	TEXT,
	PRIMARY KEY(Id)
);
INSERT INTO `MatchFormats` VALUES (0,0,0,'Undefined');
INSERT INTO `MatchFormats` VALUES (321,21,3,'Best of 3 games to 21');
INSERT INTO `MatchFormats` VALUES (521,21,5,'Best of 5 games to 21');
CREATE TABLE [Games] (
  [Id] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE, 
  [Timestamp] TIMESTAMP NOT NULL, 
  [Match_Id] INTEGER NOT NULL, 
  [Is_Ranked] BOOLEAN NOT NULL, 
  [Tournament_Tag] INTEGER NOT NULL CONSTRAINT [FK_Tournament_Tag] REFERENCES [Tournaments]([Tournament_Tag]), 
  [ParticipantA_Id] INTEGER NOT NULL CONSTRAINT [FK_ParticipantA_Id] REFERENCES [Teams]([Group]), 
  [ParticipantB_Id] INTEGER NOT NULL CONSTRAINT [FK_ParticipantB_Id] REFERENCES [Teams]([Group]), 
  [ParticipantA_Score] INTEGER, 
  [ParticipantB_Score] INTEGER, 
  [Winner] INTEGER CONSTRAINT [FK_Winner] REFERENCES [Teams]([Group]));
INSERT INTO `Games` VALUES (1,'2015-01-09 11:30:00.000',1,1,2,3,12,21,4,3);
INSERT INTO `Games` VALUES (2,'2015-01-09 11:30:00.000',1,1,2,3,12,21,11,3);
INSERT INTO `Games` VALUES (3,'2015-01-09 11:30:00.000',2,1,2,3,7,21,4,3);
INSERT INTO `Games` VALUES (4,'2015-01-09 11:30:00.000',2,1,2,3,7,21,3,3);
COMMIT;
