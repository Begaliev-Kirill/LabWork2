/* Kirill Begaliev st129977@student.spbu.ru
GameManager class controls the game process and turns of events or actions
*/

#include "GameManager.hpp"

void GameManager :: printPlayerCards(Player* player){
    std::vector<std::shared_ptr<Card>> playerCards = player->getPlayerHand() -> getCards();
    unsigned int playerCardsSize = playerCards.size();
    
    for(unsigned int i = 0; i < playerCardsSize; i++) {
        std::cout << i+1 << ") " << playerCards[i]-> getCardName() << std::endl;
    }
}

void GameManager :: gameLoop(Player* player1){
    while(true) {
        printPlayerCards(player1);
        break;
    }
}
