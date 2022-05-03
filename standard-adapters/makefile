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

include ../defs.mk

SUBDIRS := $(wildcard *-standard-*)

all: $(SUBDIRS) zip
	
clean:  $(SUBDIRS)
	@$(RM) -rf bin
	
$(SUBDIRS):
	$(MAKE) -C $@/yang $(MAKECMDGOALS)

zip: 
	@echo "Creating standard adapter zip files"
	@mkdir -p bin
	$(foreach dir,$(SUBDIRS),cd $(dir) && zip -q -r ../bin/$(dir).zip model yang/*.yang; cd ..;)

	
.PHONY: all $(SUBDIRS) install