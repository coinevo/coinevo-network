/* DO NOT EDIT THIS FILE - it is machine generated */
#include <jni.h>
/* Header for class network_coinevo_coinevonet_CoinevonetConfig */

#ifndef _Included_network_coinevo_coinevonet_CoinevonetConfig
#define _Included_network_coinevo_coinevonet_CoinevonetConfig
#ifdef __cplusplus
extern "C"
{
#endif
  /*
   * Class:     network_coinevo_coinevonet_CoinevonetConfig
   * Method:    Obtain
   * Signature: ()Ljava/nio/Buffer;
   */
  JNIEXPORT jobject JNICALL
  Java_network_coinevo_coinevonet_CoinevonetConfig_Obtain(JNIEnv *, jclass);

  /*
   * Class:     network_coinevo_coinevonet_CoinevonetConfig
   * Method:    Free
   * Signature: (Ljava/nio/Buffer;)V
   */
  JNIEXPORT void JNICALL
  Java_network_coinevo_coinevonet_CoinevonetConfig_Free(JNIEnv *, jclass, jobject);

  /*
   * Class:     network_coinevo_coinevonet_CoinevonetConfig
   * Method:    Load
   * Signature: (Ljava/lang/String;)Z
   */
  JNIEXPORT jboolean JNICALL
  Java_network_coinevo_coinevonet_CoinevonetConfig_Load(JNIEnv *, jobject, jstring);

#ifdef __cplusplus
}
#endif
#endif
