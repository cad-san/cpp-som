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

TEST(IntVector, Add)
{
    auto a = Som::Vector<int>( 10 );
    auto b = Som::Vector<int>( 20 );

    auto c = a + b;

    LONGS_EQUAL( 30, c.get() );
}

TEST(IntVector, Sub)
{
    auto a = Som::Vector<int>( 10 );
    auto b = Som::Vector<int>( 20 );

    auto c = a - b;

    LONGS_EQUAL( -10, c.get() );
}

TEST(IntVector, MultiScalar)
{
    auto a = Som::Vector<int>( 10 );

    auto b = a * 10;

    LONGS_EQUAL( 100, b.get() );
}

TEST(IntVector, DivScalar)
{
    auto a = Som::Vector<int>( 10 );

    auto b = a / 10;

    LONGS_EQUAL( 1, b.get() );
}
