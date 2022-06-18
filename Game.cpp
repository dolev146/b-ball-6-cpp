#include "Game.hpp"
#include <iostream>
#include <random>

Game::Game(Team t_one, Team t_two) : t_one(t_one), t_two(t_two)
{
    if (rand() % 2 == 0)
        win = t_one;
    else
    {
        win = t_two;
    }
}