ALTER TABLE IPL.TEAM ADD PRIMARY KEY(NAME);

ALTER TABLE IPL.MATCH ADD PRIMARY KEY(MATCHNO);

ALTER TABLE IPL.PLAYER ADD PRIMARY KEY(P_ID);

ALTER TABLE IPL.USER ADD PRIMARY KEY(USER_ID);

ALTER TABLE IPL.RESULT ADD PRIMARY KEY(MATCHNO);

ALTER TABLE IPL.VOTES ADD PRIMARY KEY(USER_ID,P_ID);

ALTER TABLE IPL.RECORD ADD PRIMARY KEY(R_ID);

ALTER TABLE IPL.VENUE ADD PRIMARY KEY(GROUND);

ALTER TABLE IPL.SELECTPLAYER ADD PRIMARY KEY(USER_ID,P_ID);

ALTER TABLE IPL.TICKETBOOK ADD PRIMARY KEY(USER_ID,MATCHNO,GROUND);

ALTER TABLE IPL.BATSC ADD PRIMARY KEY(MATCHNO,P_ID);

ALTER TABLE IPL.BALLSC ADD PRIMARY KEY(MATCHNO,P_ID);

ALTER TABLE IPL.MATCH ADD FOREIGN KEY(TEAM1) REFERENCES IPL.TEAM(NAME);

ALTER TABLE IPL.MATCH ADD FOREIGN KEY(TEAM2) REFERENCES IPL.TEAM(NAME);

ALTER TABLE IPL.RESULT ADD FOREIGN KEY(TEAM_NAME) REFERENCES IPL.TEAM(NAME);

ALTER TABLE IPL.RESULT ADD FOREIGN KEY(MATCHNO) REFERENCES IPL.MATCH(MATCHNO);

ALTER TABLE IPL.RECORD ADD FOREIGN KEY(MATCHNO) REFERENCES IPL.MATCH(MATCHNO);

ALTER TABLE IPL.VOTES ADD FOREIGN KEY(USER_ID) REFERENCES IPL.USER(USER_ID);

ALTER TABLE IPL.VOTES ADD FOREIGN KEY(P_ID) REFERENCES IPL.PLAYER(P_ID);

ALTER TABLE IPL.PLAYER ADD FOREIGN KEY(TEAM_NAME) REFERENCES IPL.TEAM(NAME);

ALTER TABLE IPL.BATSC ADD FOREIGN KEY(MATCHNO) REFERENCES IPL.MATCH(MATCHNO);

ALTER TABLE IPL.BALLSC ADD FOREIGN KEY(MATCHNO) REFERENCES IPL.MATCH(MATCHNO);

ALTER TABLE IPL.BATSC ADD FOREIGN KEY(P_ID) REFERENCES IPL.PLAYER(P_ID);

ALTER TABLE IPL.BALLSC ADD FOREIGN KEY(P_ID) REFERENCES IPL.PLAYER(P_ID);

ALTER TABLE IPL.SELECTPLAYER ADD FOREIGN KEY(P_ID) REFERENCES IPL.PLAYER(P_ID);

ALTER TABLE IPL.SELECTPLAYER ADD FOREIGN KEY(USER_ID) REFERENCES IPL.USER(USER_ID);

ALTER TABLE IPL.TICKETBOOK ADD FOREIGN KEY(MATCHNO) REFERENCES IPL.MATCH(MATCHNO);

ALTER TABLE IPL.TICKETBOOK ADD FOREIGN KEY(USER_ID) REFERENCES IPL.USER(USER_ID);
