/* Kirill Begaliev st129977@student.spbu.ru
Main tests
*/

#include <gtest/gtest.h>
#include "GameManager.hpp"

TEST(TemporaryTest, smth){
    Hand leftHand;
    EXPECT_TRUE(leftHand.fillHand(8));
}
