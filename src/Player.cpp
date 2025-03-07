/* Kirill Begaliev st129977@student.spbu.ru
Player class controls players decisions and choices
*/

#include "Player.hpp"

Player :: Player() {
    name = "PlayerName";
    playerHand = Hand();
}

Hand* Player :: getPlayerHand() {
    return &playerHand;
}
