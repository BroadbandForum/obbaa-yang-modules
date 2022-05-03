This folder contains a list of draft YANG modules required
by OB-BAA.
When the final modules are published they must be added to the
standard folder and the drafts removed.


To consider:
- checkout the draft dependencies as git submodules. This will need
a re-factoring of the Makefiles.


TR-451 module list:
---------------------------
Source: BBF Bitbucket (tag v.1.0.0-sb) 
Commit id: 1afd76113d7abd50fb277300d0532fb10238a260 (Pull request #22: Remove the event-time leaf from notifications)
branch: develop

bbf-grpc-client.yang
bbf-kafka-agent.yang
bbf-network-function-client.yang
bbf-network-function-server.yang
bbf-network-function-types.yang
bbf-omci-message-retransmission.yang
bbf-voltmf-entity.yang
bbf-voltmf-message-monitor.yang
bbf-vomci-types.yang
bbf-vomci-proxy.yang
bbf-vomci-function.yang
bbf-vomci-entity.yang



