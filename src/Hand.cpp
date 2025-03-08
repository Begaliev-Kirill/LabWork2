/* Kirill Begaliev st129977@student.spbu.ru
Hand controls all functions with player's cards
*/

#include "Hand.hpp"

Hand :: ~Hand() {
    cards.clear(); 
}

bool Hand :: fillHand(unsigned int count) {
    for(unsigned int i = 0; i < count; i++ ) {
        cards.push_back(std::make_shared<Card>());
    }
    return true;
}

std::vector<std::shared_ptr<Card>> Hand :: getCards(){
    return cards;
}
