include defs.mk

export TOP_DIR=$(shell pwd)

YANG_DIRS=obbaa-yang yang-external standard-adapters nf-standard-adapters

all:   $(YANG_DIRS)
	@echo "Done!"

clean: $(YANG_DIRS)

$(YANG_DIRS):
	echo "Entering $@"
	$(MAKE) -C $@ $(MAKECMDGOALS)

tests:
	$(MAKE) -C obbaa-yang/aggregator-yang/test all
	$(MAKE) -C obbaa-yang/nbi-abstraction/test all
	$(MAKE) -C nf-standard-adapters tests

.PHONY: all $(YANG_DIRS) clean