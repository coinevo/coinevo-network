    
    set(ANDROID_SRC 
        coinevonet_config.cpp
        coinevonet_daemon.cpp
        coinevonet_vpn.cpp
    )
    add_library(${ANDROID_LIB} SHARED ${ANDROID_SRC})
    set_property(TARGET ${ANDROID_LIB} PROPERTY CXX_STANDARD 14)
    add_log_tag(${ANDROID_LIB})
    target_link_libraries(${ANDROID_LIB} ${STATIC_LIB} ${LIBS})