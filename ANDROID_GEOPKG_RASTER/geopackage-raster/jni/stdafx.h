// stdafx.h : include file for standard system include files,
// or project specific include files that are used frequently, but
// are changed infrequently
//

#ifndef _STDAFX_H_
#define _STDAFX_H_
#include "config.h"
#include <stdio.h>
#include "string.h"

#include "logger2.h"
#include "utils.h"
#define ANDROID_BUILD

#ifdef OS_WINDOWS_BUILD

//#define MEMORY_LEAK_CHECK

#ifdef MEMORY_LEAK_CHECK
#define _CRTDBG_MAP_ALLOC
#include <stdlib.h>
#include <crtdbg.h>
#endif

#endif
#endif

