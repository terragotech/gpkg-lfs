# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := pdfium
DEFS_Debug := \
	'-DOPJ_STATIC' \
	'-DV8_DEPRECATION_WARNINGS' \
	'-D_CRT_SECURE_NO_WARNINGS' \
	'-D_FX_CPU_=_FX_X64_'

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
	-Ithird_party/freetype/include

DEFS_Debug_x64 := \
	'-DOPJ_STATIC' \
	'-DV8_DEPRECATION_WARNINGS' \
	'-D_CRT_SECURE_NO_WARNINGS' \
	'-D_FX_CPU_=_FX_X64_'

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
	-Ithird_party/freetype/include

DEFS_Release := \
	'-DOPJ_STATIC' \
	'-DV8_DEPRECATION_WARNINGS' \
	'-D_CRT_SECURE_NO_WARNINGS' \
	'-D_FX_CPU_=_FX_X64_'

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
	-Ithird_party/freetype/include

DEFS_Release_x64 := \
	'-DOPJ_STATIC' \
	'-DV8_DEPRECATION_WARNINGS' \
	'-D_CRT_SECURE_NO_WARNINGS' \
	'-D_FX_CPU_=_FX_X64_'

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
	-Ithird_party/freetype/include

OBJS := \
	$(obj).target/$(TARGET)/fpdfsdk/src/fpdfdoc.o \
	$(obj).target/$(TARGET)/fpdfsdk/src/fpdfeditimg.o \
	$(obj).target/$(TARGET)/fpdfsdk/src/fpdfeditpage.o \
	$(obj).target/$(TARGET)/fpdfsdk/src/fpdfformfill.o \
	$(obj).target/$(TARGET)/fpdfsdk/src/fpdfppo.o \
	$(obj).target/$(TARGET)/fpdfsdk/src/fpdfsave.o \
	$(obj).target/$(TARGET)/fpdfsdk/src/fpdftext.o \
	$(obj).target/$(TARGET)/fpdfsdk/src/fpdfview.o \
	$(obj).target/$(TARGET)/fpdfsdk/src/fpdf_dataavail.o \
	$(obj).target/$(TARGET)/fpdfsdk/src/fpdf_ext.o \
	$(obj).target/$(TARGET)/fpdfsdk/src/fpdf_flatten.o \
	$(obj).target/$(TARGET)/fpdfsdk/src/fpdf_progressive.o \
	$(obj).target/$(TARGET)/fpdfsdk/src/fpdf_searchex.o \
	$(obj).target/$(TARGET)/fpdfsdk/src/fpdf_sysfontinfo.o \
	$(obj).target/$(TARGET)/fpdfsdk/src/fpdf_transformpage.o \
	$(obj).target/$(TARGET)/fpdfsdk/src/fsdk_actionhandler.o \
	$(obj).target/$(TARGET)/fpdfsdk/src/fsdk_annothandler.o \
	$(obj).target/$(TARGET)/fpdfsdk/src/fsdk_baseannot.o \
	$(obj).target/$(TARGET)/fpdfsdk/src/fsdk_baseform.o \
	$(obj).target/$(TARGET)/fpdfsdk/src/fsdk_mgr.o \
	$(obj).target/$(TARGET)/fpdfsdk/src/fsdk_rendercontext.o

# Add to the list of files we specially track dependencies for.
all_deps += $(OBJS)

# Make sure our dependencies are built before any of us.
$(OBJS): | $(obj).target/third_party/pdfium_base.stamp

# CFLAGS et al overrides must be target-local.
# See "Target-specific Variable Values" in the GNU Make manual.
$(OBJS): TOOLSET := $(TOOLSET)
$(OBJS): GYP_CFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_C_$(BUILDTYPE))
$(OBJS): GYP_CXXFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_CC_$(BUILDTYPE))

# Suffix rules, putting all outputs into $(obj).

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(srcdir)/%.cpp FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# Try building from generated source, too.

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj).$(TOOLSET)/%.cpp FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj)/%.cpp FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# End of this set of suffix rules
### Rules for final target.
LDFLAGS_Debug := \
	-pthread \
	-L$(builddir)

LDFLAGS_Debug_x64 := \
	-pthread \
	-L$(builddir)

LDFLAGS_Release := \
	-pthread \
	-L$(builddir)

LDFLAGS_Release_x64 := \
	-pthread \
	-L$(builddir)

LIBS :=

$(obj).target/libpdfium.a: GYP_LDFLAGS := $(LDFLAGS_$(BUILDTYPE))
$(obj).target/libpdfium.a: LIBS := $(LIBS)
$(obj).target/libpdfium.a: TOOLSET := $(TOOLSET)
$(obj).target/libpdfium.a: $(OBJS) FORCE_DO_CMD
	$(call do_cmd,alink_thin)

all_deps += $(obj).target/libpdfium.a
# Add target alias
.PHONY: pdfium
pdfium: $(obj).target/libpdfium.a

# Add target alias to "all" target.
.PHONY: all
all: pdfium

