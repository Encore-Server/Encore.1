//uncomment FASTLOAD to change to a much faster loading debugging map
#ifndef TESTING
    #define FASTLOAD
//    #define DEPLOY_TEST
//    #define ROGUEWORLD
#endif

#ifdef FASTLOAD
    #define FORCE_MAP "_maps/roguetest.json"
// #else
//     #define FORCE_MAP "_maps/blackstone.json"
#endif

//#define WARTIME
