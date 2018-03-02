IF EXIST ci_version.h DEL /F ci_version.h
ECHO #ifndef CI_VERSION_H>ci_version.h
ECHO #define CI_VERSION_H>>ci_version.h
ECHO #define SUGOI_VERSION_MAJOR 1 >>ci_version.h
ECHO #define SUGOI_VERSION_MINOR 1 >>ci_version.h
ECHO #define SUGOI_VERSION_PATCH 1 >>ci_version.h
ECHO #define SUGOI_VERSION_BUILD %APPVEYOR_BUILD_NUMBER% >>ci_version.h
ECHO #ifndef ISPP_INVOKED>>ci_version.h
ECHO #define SUGOI_VERSION_NUM   SUGOI_VERSION_MAJOR,SUGOI_VERSION_MINOR,SUGOI_VERSION_PATCH,SUGOI_VERSION_BUILD>>ci_version.h
ECHO #define SUGOI_VERSION_STR   _T("%APPVEYOR_BUILD_VERSION%")>>ci_version.h
ECHO #define SUGOI_COMMIT_ID_STR _T("%APPVEYOR_REPO_COMMIT%")>>ci_version.h
ECHO #define SUGOI_COMMIT_AUTHOR_STR _T("%APPVEYOR_REPO_COMMIT_AUTHOR%")>>ci_version.h
ECHO #define SUGOI_COMMIT_AUTHOR_EMAIL_STR _T("%APPVEYOR_REPO_COMMIT_AUTHOR_EMAIL%")>>ci_version.h
ECHO #define SUGOI_COMMIT_TIMESTAMP_STR _T("%APPVEYOR_REPO_COMMIT_TIMESTAMP%")>>ci_version.h
ECHO #define SUGOI_COMMIT_MESSAGE_STR _T("%APPVEYOR_REPO_COMMIT_MESSAGE%")>>ci_version.h
ECHO #endif>>ci_version.h
ECHO #endif>>ci_version.h
