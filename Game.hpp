#pragma once
#include "Team.hpp"

class Team;

class Game
{
    Team t_one;
    Team t_two;
    Team win;
public:
    Game(){};
    Game(Team t_one, Team t_two);
};