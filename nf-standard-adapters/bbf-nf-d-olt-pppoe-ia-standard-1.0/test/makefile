
NF_ADAPTER_YANG=../yang

all: tests

tests:
	mkdir -p json
	
	yanglint -Fietf-crypto-types:* -F ietf-tcp-client:*  -F bbf-network-function-client:* -Fietf-tls-client:* -Fietf-tls-client:* -Fietf-truststore:* -Fietf-keystore:* -Fbbf-grpc-client:* -Fbbf-d-olt-pppoe-intermediate-agent:* -t config \
			-p $(NF_ADAPTER_YANG)  \
			$(NF_ADAPTER_YANG)/bbf-d-olt-pppoe-intermediate-agent.yang \
			$(NF_ADAPTER_YANG)/bbf-d-olt-network-function-types.yang \
			$(NF_ADAPTER_YANG)/ietf-crypto-types@2023-04-25.yang\
			$(NF_ADAPTER_YANG)/bbf-network-function-types.yang \
			../../../yang-external/standard/ietf-netconf.yang \
			pppoeia-config-client.xml -f json > json/pppoeia-config-client.json
	
	yanglint -Fietf-crypto-types:* -F ietf-tcp-server:*  -F bbf-network-function-server:* -Fietf-tls-server:* -Fietf-tls-server:* -Fietf-truststore:* -Fietf-keystore:* -Fbbf-grpc-server:* -Fbbf-d-olt-pppoe-intermediate-agent:* -t config \
			-p $(NF_ADAPTER_YANG)  \
			$(NF_ADAPTER_YANG)/bbf-d-olt-pppoe-intermediate-agent.yang \
			$(NF_ADAPTER_YANG)/bbf-d-olt-network-function-types.yang \
			$(NF_ADAPTER_YANG)/ietf-crypto-types@2023-04-25.yang\
			$(NF_ADAPTER_YANG)/bbf-network-function-types.yang \
			../../../yang-external/standard/ietf-netconf.yang \
			pppoeia-config-server.xml -f json > json/pppoeia-config-server.json


	echo "Done!"

clean: 
	@rm -rf json
	
.PHONY: all clean tests