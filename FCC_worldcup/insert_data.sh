#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE TABLE teams, games")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
####### FOR THE TEAMS TABLE
if [[ $WINNER != winner ]]
then
# get team_id
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

# if not found
if [[ -z $WINNER_ID ]]
then
  # insert team
  INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
  if [[ $INSERT_WINNER_RESULT == 'INSERT 0 1' ]]
  then
    echo "Inserted into teams, $WINNER"
  fi
  # get new team_id
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
fi
fi
#####
if [[ $OPPONENT != opponent ]]
then
# get team_id
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

# if not found
if [[ -z $OPPONENT_ID ]]
then
  # insert team
  INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
  if [[ $INSERT_TEAM_RESULT == 'INSERT 0 1' ]]
  then
    echo "Inserted into teams, $OPPONENT"
  fi
  # get new team_id
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
fi
fi

####### FOR THE GAMES TABLE
# insert game

INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
if [[ $INSERT_GAME_RESULT == 'INSERT 0 1' ]]
then
  echo "Inserted into games, $YEAR,$ROUND,$WINNER_ID,$OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS"
fi

done




