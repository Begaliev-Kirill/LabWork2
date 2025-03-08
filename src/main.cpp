/* Kirill Begaliev st129977@student.spbu.ru
Does nothing
*/

#include "GameManager.hpp"

int main() {
    GameManager Alpha;
    Player player1;
    player1.getPlayerHand() -> fillHand(10);
    Alpha.gameLoop(&player1);
}
