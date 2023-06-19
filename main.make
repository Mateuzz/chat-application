# Alternative GNU Make project makefile autogenerated by Premake

ifndef config
  config=debug_linux64
endif

ifndef verbose
  SILENT = @
endif

.PHONY: clean prebuild

SHELLTYPE := posix
ifeq (.exe,$(findstring .exe,$(ComSpec)))
	SHELLTYPE := msdos
endif

# Configurations
# #############################################

RESCOMP = windres
INCLUDES += -Isrc -Ivendor
FORCE_INCLUDE +=
ALL_CPPFLAGS += $(CPPFLAGS) -MD -MP $(DEFINES) $(INCLUDES)
ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
LIBS += -lSDL2 -lOpenGL -lGL -lGLEW -lm -lGLU
LDDEPS +=
LINKCMD = $(CC) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
define PREBUILDCMDS
endef
define PRELINKCMDS
endef
define POSTBUILDCMDS
endef

ifeq ($(config),debug_linux64)
TARGETDIR = bin
TARGET = $(TARGETDIR)/main
OBJDIR = obj/Linux64/Debug
DEFINES += -DDEBUG
ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m64 -g -Wall -W -Wextra
ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -m64 -g -Wall -W -Wextra
ALL_LDFLAGS += $(LDFLAGS) -Llib -L/usr/lib64 -m64

else ifeq ($(config),debug_linux32)
TARGETDIR = bin
TARGET = $(TARGETDIR)/main
OBJDIR = obj/Linux32/Debug
DEFINES += -DDEBUG
ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m32 -g -Wall -W -Wextra
ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -m32 -g -Wall -W -Wextra
ALL_LDFLAGS += $(LDFLAGS) -Llib -L/usr/lib32 -m32

else ifeq ($(config),debug_win64)
TARGETDIR = bin
TARGET = $(TARGETDIR)/main.exe
OBJDIR = obj/Win64/Debug
DEFINES += -DDEBUG
ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m64 -g -Wall -W -Wextra
ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -m64 -g -Wall -W -Wextra
ALL_LDFLAGS += $(LDFLAGS) -Llib -L/usr/lib64 -m64

else ifeq ($(config),debug_win32)
TARGETDIR = bin
TARGET = $(TARGETDIR)/main.exe
OBJDIR = obj/Win32/Debug
DEFINES += -DDEBUG
ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m32 -g -Wall -W -Wextra
ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -m32 -g -Wall -W -Wextra
ALL_LDFLAGS += $(LDFLAGS) -Llib -L/usr/lib32 -m32

else ifeq ($(config),release_linux64)
TARGETDIR = bin
TARGET = $(TARGETDIR)/main
OBJDIR = obj/Linux64/Release
DEFINES += -DRELEASE
ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m64 -O2 -Wall -W -Wextra
ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -m64 -O2 -Wall -W -Wextra
ALL_LDFLAGS += $(LDFLAGS) -Llib -L/usr/lib64 -m64 -s

else ifeq ($(config),release_linux32)
TARGETDIR = bin
TARGET = $(TARGETDIR)/main
OBJDIR = obj/Linux32/Release
DEFINES += -DRELEASE
ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m32 -O2 -Wall -W -Wextra
ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -m32 -O2 -Wall -W -Wextra
ALL_LDFLAGS += $(LDFLAGS) -Llib -L/usr/lib32 -m32 -s

else ifeq ($(config),release_win64)
TARGETDIR = bin
TARGET = $(TARGETDIR)/main.exe
OBJDIR = obj/Win64/Release
DEFINES += -DRELEASE
ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m64 -O2 -Wall -W -Wextra
ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -m64 -O2 -Wall -W -Wextra
ALL_LDFLAGS += $(LDFLAGS) -Llib -L/usr/lib64 -m64 -s

else ifeq ($(config),release_win32)
TARGETDIR = bin
TARGET = $(TARGETDIR)/main.exe
OBJDIR = obj/Win32/Release
DEFINES += -DRELEASE
ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m32 -O2 -Wall -W -Wextra
ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -m32 -O2 -Wall -W -Wextra
ALL_LDFLAGS += $(LDFLAGS) -Llib -L/usr/lib32 -m32 -s

endif

# Per File Configurations
# #############################################


# File sets
# #############################################

GENERATED :=
OBJECTS :=

GENERATED += $(OBJDIR)/main.o
OBJECTS += $(OBJDIR)/main.o

# Rules
# #############################################

all: $(TARGET)
	@:

$(TARGET): $(GENERATED) $(OBJECTS) $(LDDEPS) | $(TARGETDIR)
	$(PRELINKCMDS)
	@echo Linking main
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning main
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(GENERATED)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(GENERATED)) del /s /q $(subst /,\\,$(GENERATED))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild: | $(OBJDIR)
	$(PREBUILDCMDS)

ifneq (,$(PCH))
$(OBJECTS): $(GCH) | $(PCH_PLACEHOLDER)
$(GCH): $(PCH) | prebuild
	@echo $(notdir $<)
	$(SILENT) $(CC) -x c-header $(ALL_CFLAGS) -o "$@" -MF "$(@:%.gch=%.d)" -c "$<"
$(PCH_PLACEHOLDER): $(GCH) | $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) touch "$@"
else
	$(SILENT) echo $null >> "$@"
endif
else
$(OBJECTS): | prebuild
endif


# File Rules
# #############################################

$(OBJDIR)/main.o: src/main.c
	@echo "$(notdir $<)"
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"

-include $(OBJECTS:%.o=%.d)
ifneq (,$(PCH))
  -include $(PCH_PLACEHOLDER).d
endif