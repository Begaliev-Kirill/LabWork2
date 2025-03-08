/* Kirill Begaliev st129977@student.spbu.ru
Declaration of Card class - main gaming unit
*/
#ifndef CARD_HPP
#define CARD_HPP

#include <string>

class Card {
public:
    Card();
    ~Card() = default;

    std::string getCardName() const;
    
private:
    std::string name;
    unsigned int strength;
    unsigned int health;
};

#endif //CARD_HPP
