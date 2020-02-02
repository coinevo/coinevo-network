#include <service/address.hpp>

#include <gtest/gtest.h>

struct ServiceAddressTest : public ::testing::Test
{
  const std::string snode =
      "8zfiwpgonsu5zpddpxwdurxyb19x6r96xy4qbikff99jwsziws9y.snode";
  const std::string coinevo =
      "7okic5x5do3uh3usttnqz9ek3uuoemdrwzto1hciwim9f947or6y.coinevo";
  const std::string sub = "coinevonet.test";
  const std::string invalid =
      "7okic5x5do3uh3usttnqz9ek3uuoemdrwzto1hciwim9f947or6y.net";
};

TEST_F(ServiceAddressTest, TestParseBadTLD)
{
  llarp::service::Address addr;
  ASSERT_FALSE(addr.FromString(snode, ".net"));
  ASSERT_FALSE(addr.FromString(invalid, ".net"));
}

TEST_F(ServiceAddressTest, TestParseBadTLDAppenedOnEnd)
{
  llarp::service::Address addr;
  const std::string bad = coinevo + ".net";
  ASSERT_FALSE(addr.FromString(bad, ".net"));
}

TEST_F(ServiceAddressTest, TestParseBadTLDAppenedOnEndWithSubdomain)
{
  llarp::service::Address addr;
  const std::string bad = sub + "." + coinevo + ".net";
  ASSERT_FALSE(addr.FromString(bad, ".net"));
}

TEST_F(ServiceAddressTest, TestParseSNodeNotCoinevo)
{
  llarp::service::Address addr;
  ASSERT_TRUE(addr.FromString(snode, ".snode"));
  ASSERT_FALSE(addr.FromString(snode, ".coinevo"));
}

TEST_F(ServiceAddressTest, TestParseCoinevoNotSNode)
{
  llarp::service::Address addr;
  ASSERT_FALSE(addr.FromString(coinevo, ".snode"));
  ASSERT_TRUE(addr.FromString(coinevo, ".coinevo"));
}

TEST_F(ServiceAddressTest, TestParseCoinevoWithSubdomain)
{
  llarp::service::Address addr;
  const std::string addr_str = sub + "." + coinevo;
  ASSERT_TRUE(addr.FromString(addr_str, ".coinevo"));
  ASSERT_EQ(addr.subdomain, sub);
  ASSERT_EQ(addr.ToString(), addr_str);
};

TEST_F(ServiceAddressTest, TestParseSnodeWithSubdomain)
{
  llarp::service::Address addr;
  const std::string addr_str = sub + "." + snode;
  ASSERT_TRUE(addr.FromString(addr_str, ".snode"));
  ASSERT_EQ(addr.subdomain, sub);
  ASSERT_EQ(addr.ToString(".snode"), addr_str);
};
