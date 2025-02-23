/* Kirill Begaliev st129977@student.spbu.ru
Main tests
*/

#include <gtest/gtest.h>
#include "beastFunction.cpp" 

TEST(beastFunctionTests, CITest){
    EXPECT_TRUE(beastFunction);
}

int main() {
    ::testing::InitGoogleTest();
    return RUN_ALL_TESTS();
}
