#include "Team.hpp"
using namespace std;
Team::Team(std::string t_name, double skills) : t_name(t_name), skills(skills)
{
    if (skills < 0 || skills > 1)
    {
        throw "bad skills";
    }
    points = 0;
}

Team::Team()
{
    static int counter = 0;
    static std::string uniq_name = "Team";
    uniq_name = uniq_name + std::to_string(counter);
    counter++;
    t_name = uniq_name;
    points = 0;
}
// g++ Team.cpp -Wall