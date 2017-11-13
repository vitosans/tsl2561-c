ifeq ($(config),debug)
override config := Debug
endif
ifeq ($(config),release)
override config := Release
endif
ifeq ($(config),Debug)
override CPPFLAGS += -DDEBUG
override CFLAGS += -g -O0
override CXXFLAGS += -g -O0
override LDFLAGS += -g
else ifeq ($(config),Release)
override CPPFLAGS += -DNDEBUG
override CFLAGS += -O2
override CXXFLAGS += -O2
else ifneq (,$(config))
$(warning Unknown configuration "$(config)")
endif

# Use "make RANLIB=''" for platforms without ranlib.
RANLIB ?= ranlib

CC := cc
CXX := c++

# The directory for the build files, may be overridden on make command line.
builddir = .

ifneq ($(builddir),.)
_builddir := $(builddir)/
_builddir_error := $(shell mkdir -p $(_builddir) 2>&1)
$(if $(_builddir_error),$(error Failed to create build directory: $(_builddir_error)))
endif
all: $(_builddir)tsl2561

$(_builddir)tsl2561: $(_builddir)tsl2561_TSL2561_test.o $(_builddir)tsl2561_TSL2561.o
	$(CXX) -o $@ $(LDFLAGS) $(_builddir)tsl2561_TSL2561_test.o $(_builddir)tsl2561_TSL2561.o -pthread

$(_builddir)tsl2561_TSL2561_test.o: TSL2561_test.c
	$(CC) -c -o $@ $(CPPFLAGS) $(CFLAGS) -MD -MP -pthread TSL2561_test.c

$(_builddir)tsl2561_TSL2561.o: TSL2561.c
	$(CC) -c -o $@ $(CPPFLAGS) $(CFLAGS) -MD -MP -pthread TSL2561.c

clean:
	rm -f $(_builddir)*.o
	rm -f $(_builddir)*.d
	rm -f $(_builddir)tsl2561

.PHONY: all clean

# Dependencies tracking:
-include $(_builddir)*.d
