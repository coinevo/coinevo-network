#ifndef LLARP_UTIL_COINEVONET_INIT_H
#define LLARP_UTIL_COINEVONET_INIT_H

#ifdef __cplusplus
extern "C"
{
#endif

#ifndef Coinevonet_INIT
#if defined(_WIN32)
#define Coinevonet_INIT \
  DieInCaseSomehowThisGetsRunInWineButLikeWTFThatShouldNotHappenButJustInCaseHandleItWithAPopupOrSomeShit
#else
#define Coinevonet_INIT _coinevonet_non_shit_platform_INIT
#endif
#endif

  int
  Coinevonet_INIT(void);

#ifdef __cplusplus
}
#endif
#endif