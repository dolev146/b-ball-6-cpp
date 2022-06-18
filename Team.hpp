#pragma once
#include <string>
using namespace std;
class Team
{
    double skills;
    std::string t_name;
    int points; 

public:
    Team();
    Team(std::string t_name, double skills);
};