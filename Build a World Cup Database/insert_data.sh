#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Erase teams, games tables
 echo "$($PSQL "TRUNCATE teams, games;")"

# Fill teams table
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WGOAL OGOAL
do
 if [[ $YEAR != year ]]
 then
  if [[ $($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';") -eq NULL ]]
  then
  echo "$($PSQL "INSERT INTO teams(name) VALUES('$WINNER');")"
  elif [[ $($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';") -eq NULL ]]
  then
  echo "$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT');")"
  fi
 fi
done

# Fill games table
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WGOAL OGOAL
do
  if [[ $YEAR != year ]]
  then
  echo "$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';"), $($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';"), $WGOAL, $OGOAL);")"
  fi
done
