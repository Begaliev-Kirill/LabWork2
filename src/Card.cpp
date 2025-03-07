/* Kirill Begaliev st129977@student.spbu.ru
Main gaming unit for the game process
*/

#include <iostream>
#include "Card.hpp"

Card :: Card() {
    name = "nullCard";
    strength = 0;
    health = 1;
}

std::string Card :: getCardName() const{
    return name;
}
