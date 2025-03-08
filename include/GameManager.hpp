/* Kirill Begaliev st129977@student.spbu.ru
Declaration of GameManager class that controls the game process and turns of events or actions
*/

#ifndef GAME_MANAGER_HPP
#define GAME_MANAGER_HPP

#include <iostream>
#include "Player.hpp"

class GameManager{
public:
    GameManager() = default;
    ~GameManager() = default;
    
    void gameLoop(Player* player1);
     
private:
    void printPlayerCards(Player* player); //will moved to other class
};

#endif //GAME_MANAGER_HPP
