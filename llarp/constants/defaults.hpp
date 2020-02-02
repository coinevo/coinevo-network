#ifndef LLARP_DEFAULTS_HPP
#define LLARP_DEFAULTS_HPP

#ifndef DEFAULT_RESOLVER_US
#define DEFAULT_RESOLVER_US "1.1.1.1"
#endif
#ifndef DEFAULT_RESOLVER_EU
#define DEFAULT_RESOLVER_EU "1.1.1.1"
#endif
#ifndef DEFAULT_RESOLVER_AU
#define DEFAULT_RESOLVER_AU "1.1.1.1"
#endif

#ifdef DEBIAN
#ifndef DEFAULT_COINEVONET_USER
#define DEFAULT_COINEVONET_USER "debian-coinevonet"
#endif
#ifndef DEFAULT_COINEVONET_GROUP
#define DEFAULT_COINEVONET_GROUP "debian-coinevonet"
#endif
#else
#ifndef DEFAULT_COINEVONET_USER
#define DEFAULT_COINEVONET_USER "coinevonet"
#endif
#ifndef DEFAULT_COINEVONET_GROUP
#define DEFAULT_COINEVONET_GROUP "coinevonet"
#endif
#endif

#endif
