include defs.mk

export TOP_DIR=$(shell pwd)

YANG_DIRS=obbaa-yang yang-external standard-adapters nf-standard-adapters

all:   $(YANG_DIRS)
	@echo "Done!"

clean: $(YANG_DIRS)

$(YANG_DIRS):
	echo "Entering $@"
	$(MAKE) -C $@ $(MAKECMDGOALS)


.PHONY: all $(YANG_DIRS) clean