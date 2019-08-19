&ltrecv response="200" chance="0.161"&gt
    &ltaction&gt
      &ltadd assign_to="reg_repeat" value="1" /&gt
    &lt/action&gt
  &lt/recv&gt

  &ltpause milliseconds="0" /&gt

  &ltlabel id="1"/&gt

  &ltsend start_rtd="register"&gt
    &lt![CDATA[
      REGISTER sip:[$my_dn]@[service] SIP/2.0
      Via: SIP/2.0/[transport] [local_ip]:[local_port];rport;branch=[branch]-[$my_dn]-[$reg_repeat]
      Route: &ltsip:[service];transport=[transport];lr&gt
      Max-Forwards: 70
      From: &ltsip:[$my_dn]@[service]&gt;tag=[pid]SIPpTag00[call_number]
      To: &ltsip:[$my_dn]@[service]&gt
      Call-ID: [$my_dn]///[call_id]
      CSeq: [cseq] REGISTER
      User-Agent: Accession 4.0.0.0
      Supported: outbound, path
      Contact: &ltsip:[$my_dn]@[$nat_ip_addr]:[$nat_port];transport=[transport];ob&gt;+sip.ice;reg-id=1;+sip.instance="&lturn:uuid:00000000-0000-0000-0000-000000000001&gt"
      Contact: &ltsip:[$my_dn]@[local_ip]:[local_port];transport=[transport];ob&gt;expires=0;+sip.ice;reg-id=1;+sip.instance="&lturn:uuid:00000000-0000-0000-0000-000000000001&gt"
      Expires: 3600
      Allow: PRACK, INVITE, ACK, BYE, CANCEL, UPDATE, SUBSCRIBE, NOTIFY, REFER, MESSAGE, OPTIONS
      Content-Length: 0
    ]]&gt
  &lt/send&gt

  &ltrecv response="200" rtd="register"&gt
    &ltaction&gt
      &ltadd assign_to="reg_repeat" value="1" /&gt
    &lt/action&gt
  &lt/recv&gt

  &ltsend start_rtd="register"&gt
    &lt![CDATA[
      REGISTER sip:[$peer_dn]@[service] SIP/2.0
      Via: SIP/2.0/[transport] [local_ip]:[local_port];rport;branch=[branch]-[$my_dn]-[$reg_repeat]
      Route: &ltsip:[service];transport=[transport];lr&gt
      Max-Forwards: 70
      From: &ltsip:[$peer_dn]@[service]&gt;tag=[pid]SIPpTag00[call_number]
      To: &ltsip:[$peer_dn]@[service]&gt
      Call-ID: [$my_dn]///[call_id]
      CSeq: [cseq] REGISTER
      User-Agent: Accession 4.0.0.0
      Supported: outbound, path
      Contact: &ltsip:[$peer_dn]@[$nat_ip_addr]:[$nat_port];transport=[transport];ob&gt;+sip.ice;reg-id=1;+sip.instance="&lturn:uuid:00000000-0000-0000-0000-000000000001&gt"
      Contact: &ltsip:[$peer_dn]@[local_ip]:[local_port];transport=[transport];ob&gt;expires=0;+sip.ice;reg-id=1;+sip.instance="&lturn:uuid:00000000-0000-0000-0000-000000000001&gt"
      Expires: 3600
      Allow: PRACK, INVITE, ACK, BYE, CANCEL, UPDATE, SUBSCRIBE, NOTIFY, REFER, MESSAGE, OPTIONS
      Content-Length: 0
    ]]&gt
  &lt/send&gt

  &ltrecv response="200" rtd="register" chance="0.161"&gt
    &ltaction&gt
      &ltadd assign_to="reg_repeat" value="1" /&gt
    &lt/action&gt
  &lt/recv&gt

  &ltpause milliseconds="0"  /&gt

  &ltlabel id="2" /&gt

  &ltnop hide="true"&gt
    &ltaction&gt
      &ltadd assign_to="call_repeat" value="1" /&gt
      &ltsample assign_to="pre_call_delay" distribution="uniform" min="0" max="0" /&gt
      &ltassign assign_to="post_call_delay" value="0" /&gt
      &ltsubtract assign_to="post_call_delay" variable="pre_call_delay" /&gt
    &lt/action&gt
  &lt/nop&gt

  &ltpause variable="pre_call_delay" /&gt

  &ltsend start_rtd="call-setup"&gt
    &lt![CDATA[
      INVITE sip:[$peer_dn]@[service] SIP/2.0
      Via: SIP/2.0/[transport] [$nat_ip_addr]:[$nat_port];rport;branch=z9hG4bK-[$my_dn]-[call_number]-[$call_repeat]-1
      Max-Forwards: 70
      From: sip:[$my_dn]@[service];tag=[pid]SIPpTag00[call_number]1234
      To: sip:[$peer_dn]@[service]
      Contact: &ltsip:[$my_dn]@[$nat_ip_addr]:[$nat_port];transport=[transport];ob&gt;+sip.ice
      Call-ID: [$my_dn]-[$call_repeat]///[call_id]
      CSeq: [cseq] INVITE
      Route: &ltsip:[service];transport=[transport];lr&gt
      Allow: PRACK, INVITE, ACK, BYE, CANCEL, UPDATE, SUBSCRIBE, NOTIFY, REFER, MESSAGE, OPTIONS
      Supported: replaces, 100rel, timer, norefersub
      Session-Expires: 1800
      Min-SE: 90
      User-Agent: Accession 4.0.0.0
      Content-Type: application/sdp
      Content-Length: [len]
      v=0
      o=- 3547439529 3547439529 IN IP4 23.23.222.251
      s=pjmedia
      c=IN IP4 23.23.222.251
      b=AS:84
      t=0 0
      a=X-nat:3
      m=audio 34012 RTP/AVP 120 121 106 0 8 96
      c=IN IP4 23.23.222.251
      b=TIAS:64000
      a=rtcp:41203 IN IP4 23.23.222.251
      a=sendrecv
      a=rtpmap:120 SILK/8000
      a=fmtp:120 maxaveragebitrate=64000;useinbandfec=1;usedtx=1
      a=rtpmap:121 SILK/16000
      a=fmtp:121 maxaveragebitrate=64000;useinbandfec=1;usedtx=1
      a=rtpmap:106 AMR-WB/16000
      a=rtpmap:0 PCMU/8000
      a=rtpmap:8 PCMA/8000
      a=rtpmap:96 telephone-event/8000
      a=fmtp:96 0-15
      a=ice-ufrag:63eab89f
      a=ice-pwd:2cbaece5
      a=candidate:Sc0a801c2 1 UDP 1694498815 192.91.191.20 54989 typ srflx raddr 192.168.1.194 rport 42506
      a=candidate:Hc0a801c2 1 UDP 2130706431 192.168.1.194 42506 typ host
      a=candidate:R1717defb 1 UDP 16777215 23.23.222.251 34012 typ relay raddr 192.91.191.20 rport 27564
      a=candidate:Sc0a801c2 2 UDP 1694498814 192.91.191.20 40944 typ srflx raddr 192.168.1.194 rport 59288
      a=candidate:Hc0a801c2 2 UDP 2130706430 192.168.1.194 59288 typ host
      a=candidate:R1717defb 2 UDP 16777214 23.23.222.251 41203 typ relay raddr 192.91.191.20 rport 49972
    ]]&gt
  &lt/send&gt

  &lt!-- The 100 response is generated by sprout and so it and the proxied INVITE can be received in either order. --&gt
  &lt!-- If we receive the 100 response first, move onto label 3 where we expect the INVITE and then continue. --&gt
  &lt!-- If we receive the INVITE first, expect a 100 response and then move onto label 4, where we continue. --&gt
  &ltrecv response="100" optional="true" next="3"&gt
  &lt/recv&gt

  &ltrecv request="INVITE"&gt
  &lt/recv&gt

  &ltnop hide="true"&gt
    &ltaction&gt
      &ltassignstr assign_to="uas_via" value="[last_Via:]" /&gt
    &lt/action&gt
  &lt/nop&gt

  &ltrecv response="100" next="4"&gt
  &lt/recv&gt

  &ltlabel id="3" /&gt

  &ltrecv request="INVITE"&gt
  &lt/recv&gt

  &ltnop hide="true"&gt
    &ltaction&gt
      &ltassignstr assign_to="uas_via" value="[last_Via:]" /&gt
    &lt/action&gt
  &lt/nop&gt

  &ltlabel id="4" /&gt

  &ltsend&gt
    &lt![CDATA[
      SIP/2.0 100 Trying
      [$uas_via]
      [last_Record-Route:]
      Call-ID: [$my_dn]-[$call_repeat]///[call_id]
      From: &ltsip:[$peer_dn]@[service]&gt;tag=[pid]SIPpTag00[call_number]1234
      To: &ltsip:[$my_dn]@[service]&gt
      [last_CSeq:]
      Content-Length: 0
    ]]&gt
  &lt/send&gt

  &ltsend&gt
    &lt![CDATA[
      SIP/2.0 180 Ringing
      [$uas_via]
      [last_Record-Route:]
      Call-ID: [$my_dn]-[$call_repeat]///[call_id]
      From: &ltsip:[$peer_dn]@[service]&gt;tag=[pid]SIPpTag00[call_number]1234
      To: &ltsip:[$my_dn]@[service]&gt;tag=[pid]SIPpTag00[call_number]4321
      [last_CSeq:]
      Contact: &ltsip:[$peer_dn]@[$nat_ip_addr]:[$nat_port];transport=[transport];ob&gt;+sip.ice
      Allow: PRACK, INVITE, ACK, BYE, CANCEL, UPDATE, SUBSCRIBE, NOTIFY, REFER, MESSAGE, OPTIONS
      Content-Length: 0
    ]]&gt
  &lt/send&gt

  &ltrecv response="180"&gt
  &lt/recv&gt

  &ltpause milliseconds="0" /&gt

  &ltsend&gt
    &lt![CDATA[
      SIP/2.0 200 OK
      [$uas_via]
      [last_Record-Route:]
      Call-ID: [$my_dn]-[$call_repeat]///[call_id]
      From: &ltsip:[$peer_dn]@[service]&gt;tag=[pid]SIPpTag00[call_number]1234
      To: &ltsip:[$my_dn]@[service]&gt;tag=[pid]SIPpTag00[call_number]4321
      [last_CSeq:]
      Allow: PRACK, INVITE, ACK, BYE, CANCEL, UPDATE, SUBSCRIBE, NOTIFY, REFER, MESSAGE, OPTIONS
      Contact: &ltsip:[$peer_dn]@[$nat_ip_addr]:[$nat_port];transport=[transport];ob&gt;+sip.ice
      Supported: replaces, 100rel, timer, norefersub
      Session-Expires: 1800;refresher=uac
      Content-Type: application/sdp
      Content-Length: 948
      v=0
      o=- 3547439528 3547439529 IN IP4 23.23.222.251
      s=pjmedia
      c=IN IP4 23.23.222.251
      b=AS:84
      t=0 0
      a=X-nat:3
      m=audio 59808 RTP/AVP 120 96
      c=IN IP4 23.23.222.251
      b=TIAS:64000
      a=rtcp:36110 IN IP4 23.23.222.251
      a=sendrecv
      a=rtpmap:120 SILK/8000
      a=fmtp:120 maxaveragebitrate=64000;useinbandfec=1;usedtx=1
      a=rtpmap:96 telephone-event/8000
      a=fmtp:96 0-15
      a=ice-ufrag:32ffb0d4
      a=ice-pwd:6b7c406b
      a=candidate:Sac123cc4 1 UDP 1694498815 192.91.191.29 57173 typ srflx raddr 172.18.60.196 rport 57931
      a=candidate:Hac123cc4 1 UDP 2130706431 172.18.60.196 57931 typ host
      a=candidate:R1717defb 1 UDP 16777215 23.23.222.251 59808 typ relay raddr 192.91.191.29 rport 62536
      a=candidate:Sac123cc4 2 UDP 1694498814 192.91.191.29 60865 typ srflx raddr 172.18.60.196 rport 59842
      a=candidate:Hac123cc4 2 UDP 2130706430 172.18.60.196 59842 typ host
      a=candidate:R1717defb 2 UDP 16777214 23.23.222.251 36110 typ relay raddr 192.91.191.29 rport 57129
    ]]&gt
  &lt/send&gt

  &ltrecv response="200" rrs="true"&gt
  &lt/recv&gt

  &ltsend&gt
    &lt![CDATA[
      ACK sip:[$peer_dn]@[$nat_ip_addr]:[$nat_port];transport=[transport];ob SIP/2.0
      Via: SIP/2.0/[transport] [$nat_ip_addr]:[$nat_port];rport;branch=z9hG4bK-[$my_dn]-[call_number]-[$call_repeat]-1
      [routes]
      Max-Forwards: 70
      From: sip:[$my_dn]@[service];tag=[pid]SIPpTag00[call_number]1234
      To: sip:[$peer_dn]@[service];tag=[pid]SIPpTag00[call_number]4321
      Call-ID: [$my_dn]-[$call_repeat]///[call_id]
      CSeq: [cseq] ACK
      Content-Length: 0
    ]]&gt
  &lt/send&gt

  &ltrecv request="ACK"&gt
  &lt/recv&gt

  &ltsend&gt
    &lt![CDATA[
      UPDATE sip:[$peer_dn]@[$nat_ip_addr]:[$nat_port];transport=[transport];ob SIP/2.0
      Via: SIP/2.0/[transport] [$nat_ip_addr]:[$nat_port];rport;branch=z9hG4bK-[$my_dn]-[call_number]-[$call_repeat]-2
      [routes]
      Max-Forwards: 70
      From: sip:[$my_dn]@[service];tag=[pid]SIPpTag00[call_number]1234
      To: sip:[$peer_dn]@[service];tag=[pid]SIPpTag00[call_number]4321
      Contact: &ltsip:[$my_dn]@[$nat_ip_addr]:[$nat_port];transport=[transport];ob&gt;+sip.ice
      Call-ID: [$my_dn]-[$call_repeat]///[call_id]
      CSeq: [cseq] UPDATE
      Session-Expires: 1800;refresher=uac
      Min-SE: 90
      User-Agent: Accession 4.0.0.0
      Content-Type: application/sdp
      Content-Length: 843
      v=0
      o=- 3547439529 3547439530 IN IP4 23.23.222.251
      s=pjmedia
      c=IN IP4 192.91.191.20
      b=AS:84
      t=0 0
      a=X-nat:3
      m=audio 54989 RTP/AVP 120 121 106 0 8 96
      c=IN IP4 192.91.191.20
      b=TIAS:64000
      a=sendrecv
      a=rtpmap:120 SILK/8000
      a=fmtp:120 maxaveragebitrate=64000;useinbandfec=1;usedtx=1
      a=rtpmap:121 SILK/16000
      a=fmtp:121 maxaveragebitrate=64000;useinbandfec=1;usedtx=1
      a=rtpmap:106 AMR-WB/16000
      a=rtpmap:0 PCMU/8000
      a=rtpmap:8 PCMA/8000
      a=rtpmap:96 telephone-event/8000
      a=fmtp:96 0-15
      a=ice-ufrag:63eab89f
      a=ice-pwd:2cbaece5
      a=rtcp:40944 IN IP4 192.91.191.20
      a=candidate:Sc0a801c2 1 UDP 1694498815 192.91.191.20 54989 typ srflx raddr 192.168.1.194 rport 42506
      a=candidate:Sc0a801c2 2 UDP 1694498814 192.91.191.20 40944 typ srflx raddr 192.168.1.194 rport 59288
      a=remote-candidates:1 23.23.222.251 59808 2 23.23.222.251 36110
    ]]&gt
  &lt/send&gt

  &ltrecv request="UPDATE"&gt
  &lt/recv&gt

  &ltsend&gt
    &lt![CDATA[
      SIP/2.0 200 OK
      [last_Via:]
      [last_Record-Route:]
      Call-ID: [$my_dn]-[$call_repeat]///[call_id]
      From: sip:[$peer_dn]@[service];tag=[pid]SIPpTag00[call_number]1234
      To: sip:[$my_dn]@[service];tag=[pid]SIPpTag00[call_number]4321
      [last_CSeq:]
      Session-Expires: 1800;refresher=uac
      Contact: &ltsip:[$peer_dn]@[$nat_ip_addr][$nat_port];transport=[transport];ob&gt;+sip.ice
      Allow: PRACK, INVITE, ACK, BYE, CANCEL, UPDATE, SUBSCRIBE, NOTIFY, REFER, MESSAGE, OPTIONS
      Supported: replaces, 100rel, timer, norefersub
      Content-Type: application/sdp
      Content-Length: 606
      v=0
      o=- 3547439528 3547439530 IN IP4 23.23.222.251
      s=pjmedia
      c=IN IP4 23.23.222.251
      b=AS:84
      t=0 0
      a=X-nat:3
      m=audio 59808 RTP/AVP 120 96
      c=IN IP4 23.23.222.251
      b=TIAS:64000
      a=sendrecv
      a=rtpmap:120 SILK/8000
      a=fmtp:120 maxaveragebitrate=64000;useinbandfec=1;usedtx=1
      a=rtpmap:96 telephone-event/8000
      a=fmtp:96 0-15
      a=ice-ufrag:32ffb0d4
      a=ice-pwd:6b7c406b
      a=rtcp:36110 IN IP4 23.23.222.251
      a=candidate:R1717defb 1 UDP 16777215 23.23.222.251 59808 typ relay raddr 192.91.191.29 rport 62536
      a=candidate:R1717defb 2 UDP 16777214 23.23.222.251 36110 typ relay raddr 192.91.191.29 rport 57129
    ]]&gt
  &lt/send&gt

  &ltrecv response="200" rtd="call-setup"&gt
  &lt/recv&gt

  &ltpause milliseconds="0" /&gt

  &ltsend start_rtd="call-teardown"&gt
    &lt![CDATA[
      BYE sip:[$peer_dn]@[$nat_ip_addr]:[$nat_port];transport=[transport];ob SIP/2.0
      Via: SIP/2.0/[transport] [$nat_ip_addr]:[$nat_port];rport;branch=z9hG4bK-[$my_dn]-[call_number]-[$call_repeat]-3
      [routes]
      From: &ltsip:[$my_dn]@[service]&gt;tag=[pid]SIPpTag00[call_number]1234
      To: &ltsip:[$peer_dn]@[service]&gt;tag=[pid]SIPpTag00[call_number]4321
      Call-ID: [$my_dn]-[$call_repeat]///[call_id]
      CSeq: [cseq] BYE
      Contact: &ltsip:[$my_dn]@[$nat_ip_addr][$nat_port];transport=[transport];ob&gt;+sip.ice
      Max-Forwards: 70
      Subject: Performance Test
      Content-Length: 0
    ]]&gt
  &lt/send&gt

  &ltrecv request="BYE"&gt
  &lt/recv&gt

  &ltsend&gt
    &lt![CDATA[
      SIP/2.0 200 OK
      [last_Via:]
      [last_Record-Route:]
      From: sip:[$peer_dn]@[service];tag=[pid]SIPpTag00[call_number]1234
      To: sip:[$my_dn]@[service];tag=[pid]SIPpTag00[call_number]4321
      Call-ID: [$my_dn]-[$call_repeat]///[call_id]
      [last_CSeq:]
      Contact: &ltsip:[$peer_dn]@[$nat_ip_addr][$nat_port];transport=[transport];ob&gt;+sip.ice
      Content-Length: 0
    ]]&gt
  &lt/send&gt

  &ltrecv response="200" rtd="call-teardown"&gt
  &lt/recv&gt

  &ltpause variable="post_call_delay" /&gt

  &lt!-- definition of the response time repartition table (unit is ms)   --&gt
  &ltResponseTimeRepartition value="500, 1000, 2000, 3000, 4000, 7000, 10000"/&gt

  &lt!-- definition of the call length repartition table (unit is ms)     --&gt
  &ltCallLengthRepartition value="10, 50, 100, 500, 1000, 5000, 10000"/&gt

&lt/scenario&gt