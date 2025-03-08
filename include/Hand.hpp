/* Kirill Begaliev st129977@student.spbu.ru
Declaration of Hand class for control player's cards
*/

#ifndef HAND_HPP
#define HAND_HPP

#include <vector>
#include <memory>
#include "Card.hpp"

class Hand {
public:
    Hand() = default;
    ~Hand();
    
    bool fillHand(unsigned int count = 8);
    std::vector<std::shared_ptr<Card>> getCards();
    
private:
    std::vector<std::shared_ptr<Card>> cards;
};

#endif //HAND_HPP
