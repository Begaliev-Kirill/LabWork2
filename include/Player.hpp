/* Kirill Begaliev st129977@student.spbu.ru
Declaration of Player class, it controls the players decisions and actions
*/

#ifndef PLAYER_HPP
#define PLAYER_HPP

#include "Hand.hpp"

class Player{
public:
    Player();
    ~Player() = default;
    
    Hand* getPlayerHand();

private:
    std::string name;
    Hand playerHand;
};

#endif //PLAYER_HPP
