include $(CLEAR_VARS)
LOCAL_MODULE := sqlite3
LOCAL_SRC := $(LOCAL_PATH)/sqlite-amalgamation-3100200
LOCAL_C_INCLUDES += $(LOCAL_SRC)
LOCAL_SRC_FILES := $(LOCAL_SRC)/sqlite3.c
include $(BUILD_STATIC_LIBRARY)