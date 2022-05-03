

SEARCH_PATHS= -p ../../../yang-external/draft/ -p ../../../yang-external/standard/

STD_ADAPTER_PATH_OLT_2p0=../../../standard-adapters/bbf-olt-standard-2.0/yang/
STD_ADAPTER_PATH_ONU_1p0=../../../standard-adapters/bbf-onu-standard-1.0/yang/
STD_ADAPTER_PATH_ONU_2p0=../../../standard-adapters/bbf-onu-standard-2.0/yang/

all:
	mkdir -p json
	
	#Network Manager
	yanglint  -Fbbf-kafka-agent:* -F bbf-network-function-client:* -Fbbf-obbaa-network-manager:* -t config -f xml $(SEARCH_PATHS) ../bbf-obbaa-xpon-onu-types.yang ../bbf-obbaa-network-manager.yang ../bbf-obbaa-onu-management.yang ../bbf-obbaa-deviations.yang ../../../yang-external/draft/bbf-network-function-types.yang  nm-onu-config-example1.xml > /dev/null
	
	#ONU auth notifications from OLT
	yanglint -t notif -f xml $(SEARCH_PATHS) ../bbf-obbaa-xpon-onu-types.yang ../bbf-obbaa-onu-management.yang ../bbf-obbaa-deviations.yang onu-auth-notification-example1.xml > /dev/null
	yanglint -t notif -f xml $(SEARCH_PATHS) ../bbf-obbaa-xpon-onu-types.yang ../bbf-obbaa-onu-management.yang ../bbf-obbaa-deviations.yang onu-auth-notification-example2.xml > /dev/null
	
	#vOMCI function/proxy configuration
	yanglint -F ietf-tcp-client:* -F bbf-vomci-function:* -F bbf-kafka-agent:* -F bbf-network-function-client:* -t config -f xml $(SEARCH_PATHS) ../../../yang-external/draft/bbf-network-function-types.yang  ../../../yang-external/draft/bbf-vomci-function.yang  vomci-endpoint-config.xml -f json > json/vomci-endpoint-config.json
	yanglint -F ietf-tcp-client:* -F bbf-vomci-proxy:* -F bbf-kafka-agent:* -F bbf-network-function-client:* -t config -f xml $(SEARCH_PATHS) ../../../yang-external/draft/bbf-network-function-types.yang  ../../../yang-external/draft/bbf-vomci-proxy.yang  vproxy-endpoint-config.xml -f json > json/vproxy-endpoint-config.json
	
	#alarms
	yanglint -t notif -f xml -p $(STD_ADAPTER_PATH_ONU_2p0) $(STD_ADAPTER_PATH_ONU_2p0)/ietf-alarms.yang  $(STD_ADAPTER_PATH_ONU_2p0)/bbf-alarm-types.yang  $(STD_ADAPTER_PATH_ONU_2p0)/ietf-interfaces.yang ../bbf-obbaa-xpon-onu-alarm-types.yang ietf-alarm-notification-example1.xml -f  json > json/ietf-alarm-notification-example1.json
	yanglint -t notif -f xml -p $(STD_ADAPTER_PATH_ONU_2p0) $(STD_ADAPTER_PATH_ONU_2p0)/ietf-alarms.yang  $(STD_ADAPTER_PATH_ONU_2p0)/bbf-alarm-types.yang  $(STD_ADAPTER_PATH_ONU_2p0)/ietf-interfaces.yang ../bbf-obbaa-ethernet-alarm-types.yang ietf-alarm-notification-example2.xml -f  json > json/ietf-alarm-notification-example2.json
	yanglint -t notif -f xml -p $(STD_ADAPTER_PATH_ONU_2p0) $(STD_ADAPTER_PATH_ONU_2p0)/ietf-alarms.yang  $(STD_ADAPTER_PATH_ONU_2p0)/bbf-alarm-types.yang  $(STD_ADAPTER_PATH_ONU_2p0)/ietf-interfaces.yang $(STD_ADAPTER_PATH_OLT_2p0)/bbf-hardware-transceiver-alarm-types.yang ietf-alarm-notification-example3.xml -f  json > json/ietf-alarm-notification-example3.json
	yanglint -t get -f xml   -p $(STD_ADAPTER_PATH_ONU_2p0) $(STD_ADAPTER_PATH_ONU_2p0)/ietf-alarms.yang  $(STD_ADAPTER_PATH_ONU_2p0)/bbf-alarm-types.yang  $(STD_ADAPTER_PATH_ONU_2p0)/ietf-interfaces.yang ietf-alarm-list-example.xml -f  json > json/ietf-alarm-list-example.json
	
	#ONU get data
	yanglint -t get -f xml   -p $(STD_ADAPTER_PATH_ONU_1p0) $(STD_ADAPTER_PATH_ONU_1p0)/ietf-hardware.yang $(STD_ADAPTER_PATH_ONU_1p0)/ietf-hardware-state@2018-03-13.yang $(STD_ADAPTER_PATH_ONU_2p0)/iana-hardware.yang helper-yang/bbf-software-management.yang  $(STD_ADAPTER_PATH_ONU_1p0)/ietf-interfaces@2018-02-20.yang onu-get-data-example-1.0.xml -f  json > json/onu-get-data-example-1.0.json
	yanglint -t get -f xml   -p $(STD_ADAPTER_PATH_ONU_2p0) $(STD_ADAPTER_PATH_ONU_2p0)/ietf-hardware.yang  $(STD_ADAPTER_PATH_ONU_2p0)/ietf-hardware-state.yang $(STD_ADAPTER_PATH_ONU_2p0)/iana-hardware.yang helper-yang/bbf-software-management.yang  $(STD_ADAPTER_PATH_ONU_2p0)/ietf-interfaces.yang onu-get-data-example-2.0-non-nmda.xml -f  json > json/onu-get-data-example-2.0-non-nmda.json
	yanglint -t get -f xml   -p $(STD_ADAPTER_PATH_ONU_2p0) $(STD_ADAPTER_PATH_ONU_2p0)/ietf-hardware.yang  $(STD_ADAPTER_PATH_ONU_2p0)/ietf-hardware-state.yang $(STD_ADAPTER_PATH_ONU_2p0)/iana-hardware.yang helper-yang/bbf-software-management.yang  $(STD_ADAPTER_PATH_ONU_2p0)/ietf-interfaces.yang onu-get-data-example-2.0-partial-nmda.xml -f  json > json/onu-get-data-example-2.0-partial-nmda.json
	echo "Done!"

clean: 
	@rm -rf json
	
.PHONY: all clean