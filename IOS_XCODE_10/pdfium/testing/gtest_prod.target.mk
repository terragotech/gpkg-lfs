# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := gtest_prod
DEFS_Debug := \
	'-DV8_DEPRECATION_WARNINGS'

# Flags passed to all source files.
CFLAGS_Debug := \
	-Wall \
	-W \
	-Wno-missing-field-initializers \
	-Wno-sign-compare \
	-Wno-unused-parameter \
	-pthread \
	-fno-exceptions \
	-fPIC \
	-g \
	-O0 \
	-fdata-sections \
	-ffunction-sections

# Flags passed to only C files.
CFLAGS_C_Debug :=

# Flags passed to only C++ files.
CFLAGS_CC_Debug := \
	-std=c++0x \
	-Wnon-virtual-dtor \
	-fno-rtti

INCS_Debug :=

DEFS_Debug_x64 := \
	'-DV8_DEPRECATION_WARNINGS'

# Flags passed to all source files.
CFLAGS_Debug_x64 := \
	-Wall \
	-W \
	-Wno-missing-field-initializers \
	-Wno-sign-compare \
	-Wno-unused-parameter \
	-pthread \
	-fno-exceptions \
	-fPIC \
	-g \
	-O0 \
	-fdata-sections \
	-ffunction-sections

# Flags passed to only C files.
CFLAGS_C_Debug_x64 :=

# Flags passed to only C++ files.
CFLAGS_CC_Debug_x64 := \
	-std=c++0x \
	-Wnon-virtual-dtor \
	-fno-rtti

INCS_Debug_x64 :=

DEFS_Release := \
	'-DV8_DEPRECATION_WARNINGS'

# Flags passed to all source files.
CFLAGS_Release := \
	-Wall \
	-W \
	-Wno-missing-field-initializers \
	-Wno-sign-compare \
	-Wno-unused-parameter \
	-pthread \
	-fno-exceptions \
	-fPIC \
	-fno-strict-aliasing \
	-fdata-sections \
	-ffunction-sections \
	-O3 \
	-O2

# Flags passed to only C files.
CFLAGS_C_Release :=

# Flags passed to only C++ files.
CFLAGS_CC_Release := \
	-std=c++0x \
	-Wnon-virtual-dtor \
	-fno-rtti

INCS_Release :=

DEFS_Release_x64 := \
	'-DV8_DEPRECATION_WARNINGS'

# Flags passed to all source files.
CFLAGS_Release_x64 := \
	-Wall \
	-W \
	-Wno-missing-field-initializers \
	-Wno-sign-compare \
	-Wno-unused-parameter \
	-pthread \
	-fno-exceptions \
	-fPIC \
	-fno-strict-aliasing \
	-fdata-sections \
	-ffunction-sections \
	-O3 \
	-O2

# Flags passed to only C files.
CFLAGS_C_Release_x64 :=

# Flags passed to only C++ files.
CFLAGS_CC_Release_x64 := \
	-std=c++0x \
	-Wnon-virtual-dtor \
	-fno-rtti

INCS_Release_x64 :=

OBJS :=

# Add to the list of files we specially track dependencies for.
all_deps += $(OBJS)


### Rules for final target.
$(obj).target/testing/gtest_prod.stamp: TOOLSET := $(TOOLSET)
$(obj).target/testing/gtest_prod.stamp:  FORCE_DO_CMD
	$(call do_cmd,touch)

all_deps += $(obj).target/testing/gtest_prod.stamp
# Add target alias
.PHONY: gtest_prod
gtest_prod: $(obj).target/testing/gtest_prod.stamp

# Add target alias to "all" target.
.PHONY: all
all: gtest_prod
