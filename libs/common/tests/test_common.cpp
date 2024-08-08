#include <gtest/gtest.h>
#include "common.hpp"

TEST(common_test, say_hello)
{
  auto result = cm::say_hello();
  EXPECT_EQ(result, 0);
}