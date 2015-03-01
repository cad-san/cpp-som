#include "CppUTest/TestHarness.h"

#include "Vector.h"
#include <string>

TEST_GROUP(IntVector)
{
    void setup()
    {
    }

    void teardown()
    {
    }
};

TEST(IntVector, Init)
{
    auto vector = Som::Vector<int>( 10 );
    LONGS_EQUAL( 10, vector.get() );
}