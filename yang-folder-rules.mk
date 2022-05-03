# Copyright 2021 Broadband Forum
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Makefiles for OB-BAA YANG validation
# 
# Created by Andre Brizido(Altice Labs) on 25/10/2021
# 



#Variables that can be costumized
#  PYANG_EXTRA_OPTS	- additional pyang flags


YANGS_SUBDIR=.
YANGS=$(wildcard $(YANGS_SUBDIR)/*.yang)

OBJS=$(notdir $(YANGS:.yang=.tree))
OBJS:=$(addprefix docs/,$(OBJS))

all: $(OBJS)
	mkdir -p docs

docs/%.tree: %.yang
	@echo "Generating $@"
	@mkdir -p docs
	$(PYANG) $(PYANG_EXTRA_OPTS) $(@:docs/%.tree=%.yang) -p $(YANGS_SUBDIR)  $(addprefix -p $(TOP_DIR)/,$(YANG_EXTERNAL_DIRNAME)) -f tree -o $@

%.tree : %.yang

clean:
	@$(RM) -rf docs

.DELETE_ON_ERROR: docs/%.tree

 .PHONY: all clean install