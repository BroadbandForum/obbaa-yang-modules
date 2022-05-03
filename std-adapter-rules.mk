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
#  YANGS_IGNORE		- ignore some yang files

YANGS_SUBDIR=.

YANGS=$(filter-out $(YANGS_IGNORE), $(YANGS_ALL))


OBJS=$(notdir $(YANGS:.yang=.tree))
OBJS:=$(addprefix docs/,$(OBJS))

all: docs/all.tree

# Some notes:
#-------------------------------------------------
# - Standard adapter yangs are self contained, don't include the external 
#   yang folder as search path.
# - Validating files one by one takes too long, we just wan't to check
#   consistency.
docs/all.tree:
	@mkdir -p docs	
	$(PYANG) $(PYANG_EXTRA_OPTS) *.yang -f tree -o $@

clean:
	@$(RM) -rf docs



.DELETE_ON_ERROR: docs/all.tree

.PHONY: all clean install