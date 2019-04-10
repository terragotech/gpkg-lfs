# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := gtest
DEFS_Debug := \
	'-DV8_DEPRECATION_WARNINGS' \
	'-DGTEST_HAS_POSIX_RE=0' \
	'-DGTEST_LANG_CXX11=0' \
	'-DGTEST_HAS_RTTI=0'

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

INCS_Debug := \
	-Itesting/gtest \
	-Itesting/gtest/include

DEFS_Debug_x64 := \
	'-DV8_DEPRECATION_WARNINGS' \
	'-DGTEST_HAS_POSIX_RE=0' \
	'-DGTEST_LANG_CXX11=0' \
	'-DGTEST_HAS_RTTI=0'

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

INCS_Debug_x64 := \
	-Itesting/gtest \
	-Itesting/gtest/include

DEFS_Release := \
	'-DV8_DEPRECATION_WARNINGS' \
	'-DGTEST_HAS_POSIX_RE=0' \
	'-DGTEST_LANG_CXX11=0' \
	'-DGTEST_HAS_RTTI=0'

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

INCS_Release := \
	-Itesting/gtest \
	-Itesting/gtest/include

DEFS_Release_x64 := \
	'-DV8_DEPRECATION_WARNINGS' \
	'-DGTEST_HAS_POSIX_RE=0' \
	'-DGTEST_LANG_CXX11=0' \
	'-DGTEST_HAS_RTTI=0'

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

INCS_Release_x64 := \
	-Itesting/gtest \
	-Itesting/gtest/include

OBJS := \
	$(obj).target/$(TARGET)/testing/gtest/src/gtest-death-test.o \
	$(obj).target/$(TARGET)/testing/gtest/src/gtest-filepath.o \
	$(obj).target/$(TARGET)/testing/gtest/src/gtest-port.o \
	$(obj).target/$(TARGET)/testing/gtest/src/gtest-printers.o \
	$(obj).target/$(TARGET)/testing/gtest/src/gtest-test-part.o \
	$(obj).target/$(TARGET)/testing/gtest/src/gtest-typed-test.o \
	$(obj).target/$(TARGET)/testing/gtest/src/gtest.o

# Add to the list of files we specially track dependencies for.
all_deps += $(OBJS)

# Make sure our dependencies are built before any of us.
$(OBJS): | $(obj).target/testing/gtest_prod.stamp

# CFLAGS et al overrides must be target-local.
# See "Target-specific Variable Values" in the GNU Make manual.
$(OBJS): TOOLSET := $(TOOLSET)
$(OBJS): GYP_CFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_C_$(BUILDTYPE))
$(OBJS): GYP_CXXFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_CC_$(BUILDTYPE))

# Suffix rules, putting all outputs into $(obj).

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(srcdir)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# Try building from generated source, too.

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj).$(TOOLSET)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# End of this set of suffix rules
### Rules for final target.
LDFLAGS_Debug := \
	-pthread

LDFLAGS_Debug_x64 := \
	-pthread

LDFLAGS_Release := \
	-pthread

LDFLAGS_Release_x64 := \
	-pthread

LIBS :=

$(obj).target/testing/libgtest.a: GYP_LDFLAGS := $(LDFLAGS_$(BUILDTYPE))
$(obj).target/testing/libgtest.a: LIBS := $(LIBS)
$(obj).target/testing/libgtest.a: TOOLSET := $(TOOLSET)
$(obj).target/testing/libgtest.a: $(OBJS) FORCE_DO_CMD
	$(call do_cmd,alink_thin)

all_deps += $(obj).target/testing/libgtest.a
# Add target alias
.PHONY: gtest
gtest: $(obj).target/testing/libgtest.a

# Add target alias to "all" target.
.PHONY: all
all: gtest

