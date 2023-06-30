

SEARCH_PATHS= -p ../../../yang-external/draft/ -p ../../../yang-external/standard/

YANG_EXTERNAL_PATH=../../../yang-external/standard/
YANG_EXTERNAL_DRAFT_PATH=../../../yang-external/draft/

STD_ADAPTER_PATH_OLT_2p0=../../../standard-adapters/bbf-olt-standard-2.0/yang/
STD_ADAPTER_PATH_ONU_1p0=../../../standard-adapters/bbf-onu-standard-1.0/yang/
STD_ADAPTER_PATH_ONU_2p0=../../../standard-adapters/bbf-onu-standard-2.0/yang/

STD_ADAPTER_PATH_VOMCI_2p0=../../../nf-standard-adapters/bbf-nf-vomci-standard-2.0/yang/
STD_ADAPTER_PATH_VPROXY_2p0=../../../nf-standard-adapters/bbf-nf-vproxy-standard-2.0/yang/

all:
	mkdir -p json
	
	#Network Manager
	yanglint  -Fbbf-kafka-agent:* -F bbf-network-function-client:* -Fbbf-obbaa-network-manager:* -t config -f xml $(SEARCH_PATHS) ../bbf-obbaa-xpon-onu-types.yang ../bbf-obbaa-network-manager.yang ../bbf-obbaa-onu-management.yang ../bbf-obbaa-deviations.yang ../../../yang-external/draft/bbf-network-function-types.yang  nm-onu-config-example1.xml > /dev/null
	yanglint  -Fbbf-kafka-agent:* -F bbf-network-function-client:* -Fbbf-obbaa-network-manager:* \
		-t config -f xml $(SEARCH_PATHS)  \
		../bbf-obbaa-xpon-onu-types.yang  \
		../bbf-obbaa-network-manager.yang \
		../bbf-obbaa-onu-management.yang  \
		../bbf-obbaa-deviations.yang      \
		../../../yang-external/draft/bbf-network-function-types.yang \
		../../../yang-external/draft/bbf-d-olt-network-function-types.yang \
		nm-config-nf-pppoe.xml > /dev/null
	
	#ONU auth notifications from OLT
	yanglint -t notif -f xml $(SEARCH_PATHS) ../bbf-obbaa-pmaa-onu-types.yang ../bbf-obbaa-xpon-onu-types.yang ../bbf-obbaa-onu-management.yang ../bbf-obbaa-deviations.yang onu-auth-notification-example1.xml > /dev/null
	yanglint -t notif -f xml $(SEARCH_PATHS) ../bbf-obbaa-pmaa-onu-types.yang ../bbf-obbaa-xpon-onu-types.yang ../bbf-obbaa-onu-management.yang ../bbf-obbaa-deviations.yang onu-auth-notification-example2.xml > /dev/null
	
	#vOMCI function/proxy configuration	
	yanglint -Fbbf-kafka-agent:*  -F bbf-vomci-function:* -F bbf-grpc-client:* -F bbf-grpc-server:* -t config -f xml -p $(STD_ADAPTER_PATH_VOMCI_2p0) \
		$(STD_ADAPTER_PATH_VOMCI_2p0)/bbf-network-function-types.yang \
		$(STD_ADAPTER_PATH_VOMCI_2p0)/bbf-vomci-function-kafka-agent-tcp.yang \
		$(STD_ADAPTER_PATH_VOMCI_2p0)/bbf-vomci-function-kafka-agent.yang \
		$(STD_ADAPTER_PATH_VOMCI_2p0)/bbf-vomci-function-grpc-client-tcp.yang \
		$(STD_ADAPTER_PATH_VOMCI_2p0)/bbf-vomci-function-grpc-client.yang \
		$(STD_ADAPTER_PATH_VOMCI_2p0)/bbf-vomci-function-grpc-server-tcp.yang \
		$(STD_ADAPTER_PATH_VOMCI_2p0)/bbf-vomci-function-grpc-server.yang \
		$(STD_ADAPTER_PATH_VOMCI_2p0)/bbf-vomci-function.yang  \
		vomci-endpoint-config.xml -f json > json/vomci-endpoint-config.json
	
	yanglint -Fbbf-kafka-agent:*  -F bbf-vomci-proxy:* -F bbf-grpc-client:* -F bbf-grpc-server:* -t config -f xml -p $(STD_ADAPTER_PATH_VPROXY_2p0) \
		$(STD_ADAPTER_PATH_VPROXY_2p0)/bbf-network-function-types.yang \
		$(STD_ADAPTER_PATH_VPROXY_2p0)/bbf-vomci-proxy-kafka-agent-tcp.yang \
		$(STD_ADAPTER_PATH_VPROXY_2p0)/bbf-vomci-proxy-kafka-agent.yang \
		$(STD_ADAPTER_PATH_VPROXY_2p0)/bbf-vomci-proxy-grpc-client-tcp.yang \
		$(STD_ADAPTER_PATH_VPROXY_2p0)/bbf-vomci-proxy-grpc-client.yang \
		$(STD_ADAPTER_PATH_VPROXY_2p0)/bbf-vomci-proxy-grpc-server-tcp.yang \
		$(STD_ADAPTER_PATH_VPROXY_2p0)/bbf-vomci-proxy-grpc-server.yang \
		$(STD_ADAPTER_PATH_VPROXY_2p0)/bbf-vomci-proxy.yang  \
		vproxy-endpoint-config.xml -f json > json/vproxy-endpoint-config.json
	
	#alarms
	yanglint -t notif -f xml -p $(STD_ADAPTER_PATH_ONU_2p0) $(STD_ADAPTER_PATH_ONU_2p0)/ietf-alarms.yang  $(STD_ADAPTER_PATH_ONU_2p0)/bbf-alarm-types.yang  $(STD_ADAPTER_PATH_ONU_2p0)/ietf-interfaces.yang ../bbf-obbaa-xpon-onu-alarm-types.yang ietf-alarm-notification-example1.xml -f  json > json/ietf-alarm-notification-example1.json
	yanglint -t notif -f xml -p $(STD_ADAPTER_PATH_ONU_2p0) $(STD_ADAPTER_PATH_ONU_2p0)/ietf-alarms.yang  $(STD_ADAPTER_PATH_ONU_2p0)/bbf-alarm-types.yang  $(STD_ADAPTER_PATH_ONU_2p0)/ietf-interfaces.yang ../bbf-obbaa-ethernet-alarm-types.yang ietf-alarm-notification-example2.xml -f  json > json/ietf-alarm-notification-example2.json
	yanglint -t notif -f xml -p $(STD_ADAPTER_PATH_ONU_2p0) $(STD_ADAPTER_PATH_ONU_2p0)/ietf-alarms.yang  $(STD_ADAPTER_PATH_ONU_2p0)/bbf-alarm-types.yang  $(STD_ADAPTER_PATH_ONU_2p0)/ietf-interfaces.yang $(STD_ADAPTER_PATH_OLT_2p0)/bbf-hardware-transceiver-alarm-types.yang ietf-alarm-notification-example3.xml -f  json > json/ietf-alarm-notification-example3.json
	yanglint -t get -f xml   -p $(STD_ADAPTER_PATH_ONU_2p0) $(STD_ADAPTER_PATH_ONU_2p0)/ietf-alarms.yang  $(STD_ADAPTER_PATH_ONU_2p0)/bbf-alarm-types.yang  $(STD_ADAPTER_PATH_ONU_2p0)/ietf-interfaces.yang ietf-alarm-list-example.xml -f  json > json/ietf-alarm-list-example.json
	
	#ONU get data
	yanglint -t get -f xml   -p $(STD_ADAPTER_PATH_ONU_1p0) $(STD_ADAPTER_PATH_ONU_1p0)/ietf-hardware.yang $(STD_ADAPTER_PATH_ONU_1p0)/ietf-hardware-state@2018-03-13.yang $(STD_ADAPTER_PATH_ONU_2p0)/iana-hardware.yang helper-yang/bbf-software-management.yang  $(STD_ADAPTER_PATH_ONU_1p0)/ietf-interfaces@2018-02-20.yang onu-get-data-example-1.0.xml -f  json > json/onu-get-data-example-1.0.json
	yanglint -t get -f xml   -p $(STD_ADAPTER_PATH_ONU_2p0) $(STD_ADAPTER_PATH_ONU_2p0)/ietf-hardware.yang  $(STD_ADAPTER_PATH_ONU_2p0)/ietf-hardware-state.yang $(STD_ADAPTER_PATH_ONU_2p0)/iana-hardware.yang helper-yang/bbf-software-management.yang  $(STD_ADAPTER_PATH_ONU_2p0)/ietf-interfaces.yang onu-get-data-example-2.0-non-nmda.xml -f  json > json/onu-get-data-example-2.0-non-nmda.json
	yanglint -t get -f xml   -p $(STD_ADAPTER_PATH_ONU_2p0) $(STD_ADAPTER_PATH_ONU_2p0)/ietf-hardware.yang  $(STD_ADAPTER_PATH_ONU_2p0)/ietf-hardware-state.yang $(STD_ADAPTER_PATH_ONU_2p0)/iana-hardware.yang helper-yang/bbf-software-management.yang  $(STD_ADAPTER_PATH_ONU_2p0)/ietf-interfaces.yang onu-get-data-example-2.0-partial-nmda.xml -f  json > json/onu-get-data-example-2.0-partial-nmda.json
	
	#Convert to JSON using the YANGS in the NF adapter
	yanglint -t rpc -f xml   -p $(STD_ADAPTER_PATH_VOMCI_2p0) $(STD_ADAPTER_PATH_VOMCI_2p0)/bbf-vomci-types.yang \
		$(STD_ADAPTER_PATH_VOMCI_2p0)/bbf-vomci-function.yang \
		vomci-create-onu.xml -f  json > json/vomci-create-onu.json
	 
	yanglint -t rpc -f xml   -p $(STD_ADAPTER_PATH_VOMCI_2p0) $(STD_ADAPTER_PATH_VOMCI_2p0)/bbf-vomci-types.yang \
		$(STD_ADAPTER_PATH_VOMCI_2p0)/bbf-vomci-function.yang \
		vomci-set-onu-communication.xml -f  json > json/vomci-set-onu-communication.json
		
	yanglint -t rpc -f xml   -p $(STD_ADAPTER_PATH_VOMCI_2p0) \
		$(STD_ADAPTER_PATH_VOMCI_2p0)/bbf-vomci-function.yang \
		vomci-delete-onu.xml -f  json > json/vomci-delete-onu.json
		
	yanglint -t notif -f xml   -p $(STD_ADAPTER_PATH_VOMCI_2p0) \
		$(STD_ADAPTER_PATH_VOMCI_2p0)/bbf-vomci-function.yang \
		vomci-onu-aligment-notification.xml -f  json > json/vomci-onu-aligment-notification.json
		
	yanglint -t notif -f xml   -p $(STD_ADAPTER_PATH_VOMCI_2p0) \
		$(STD_ADAPTER_PATH_VOMCI_2p0)/bbf-vomci-function.yang \
		vomci-onu-alarm-misalignment.xml -f  json > json/vomci-onu-alarm-misalignment.json
		
	#Make sure that the YANGs used by vOLTMF are in accordance to the adapter
	yanglint -t rpc -f xml   $(SEARCH_PATHS) $(YANG_EXTERNAL_DRAFT_PATH)/bbf-vomci-types.yang \
		$(YANG_EXTERNAL_DRAFT_PATH)/bbf-vomci-function.yang \
		vomci-create-onu.xml -f  json >> /dev/null
	 
	yanglint -t rpc -f xml    $(SEARCH_PATHS) $(YANG_EXTERNAL_DRAFT_PATH)/bbf-vomci-types.yang \
		$(YANG_EXTERNAL_DRAFT_PATH)/bbf-vomci-function.yang \
		vomci-set-onu-communication.xml -f  json >> /dev/null
		
	yanglint -t rpc -f xml   $(SEARCH_PATHS) \
		$(YANG_EXTERNAL_DRAFT_PATH)/bbf-vomci-function.yang \
		vomci-delete-onu.xml -f  json >> /dev/null
		
	yanglint -t notif -f xml   $(SEARCH_PATHS) \
		$(YANG_EXTERNAL_DRAFT_PATH)/bbf-vomci-function.yang \
		vomci-onu-aligment-notification.xml -f  json >> /dev/null
		
	yanglint -t notif -f xml   $(SEARCH_PATHS) \
		$(YANG_EXTERNAL_DRAFT_PATH)/bbf-vomci-function.yang \
		vomci-onu-alarm-misalignment.xml -f  json >> /dev/null
		
	yanglint -F ietf-tcp-client:* -F bbf-kafka-agent:* -F bbf-network-function-client:* -F bbf-obbaa-network-manager:* \
		-t config -f xml $(SEARCH_PATHS)  \
		../../../yang-external/draft/bbf-network-function-types.yang \
		../bbf-obbaa-network-manager.yang \
		 baa-config-networkfunctions.xml -f json > json/baa-config-networkfunctions.json

	yanglint -F ietf-tcp-client:* -F bbf-kafka-agent:* -F bbf-network-function-client:* -F bbf-obbaa-network-manager:* \
		-t config -f xml $(SEARCH_PATHS)  \
		$(YANG_EXTERNAL_PATH)/bbf-xpon-types.yang \
		../bbf-obbaa-xpon-onu-types.yang  \
		../bbf-obbaa-network-manager.yang \
		../bbf-obbaa-onu-management.yang \
		baa-create-onu.xml -f json > json/baa-create-onu.json
	 
	echo "Done!"

clean: 
	@rm -rf json
	
.PHONY: all clean