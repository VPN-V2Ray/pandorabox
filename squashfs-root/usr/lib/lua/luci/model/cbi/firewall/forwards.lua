LuaQ               n      A@   E     \   Α@  AΑ  E  \   ΐ  ΐ  BΑ A  ΑA    @ @ ΐC@ @D@ @D@ @Δ@ Ζ@E  ά ΐ @  Ζ@ δ   ΐ@ δ@      ΐ @ δ  ΐ Η Ε@ A E  \ @  €ΐ     δ     $A    EA KΘΕA Β E B \ \  GΑ EΑ IADEΑ IΙEΑ €         IEA KΘΕA 	 E Β	 \ \  G	 E	 IADE	 IΚE	 €Α    IFAΚ A Ε
  AΒ
  \  IΛEΑ  ^   -      require    luci.dispatcher    luci.tools.firewall    m    Map 	   firewall 
   translate    Firewall - Port Forwards    Port forwarding allows remote computers on the Internet to 
	           connect to a specific computer or service within the 
	           private LAN.    s    section    TypedSection 	   redirect    Port Forwards 	   template    cbi/tblsection 
   addremove 
   anonymous 	   sortable    extedit 
   build_url #   admin/network/firewall/forwards/%s    template_addremove    firewall/cbi_addforward    create    parse    filter 	   opt_name    DummyValue    Name    match    option    Match    rawhtml    width    50% 	   cfgvalue    dest    Forward to    40%    opt_enabled    Flag    Enable    1%        #   <     e      @@  Ε   Λ@ΐAΑ  ά  A@ E  KAΐΑA \  A@ Ε  ΛAΐAΒ ά  B@ W@Βΐ Ϊ   ΐΪ  @EΒ FΓ  ΐ \G FBC KΓΕ Γ A \BFBC KΓΕ C [C   A \BFBC KΓΕ Γ [C   A \BFBC KΓΕ C W@Β@ [C  A \BFBC KΓΕ Γ @\BFBC KΓΕ  @\BFBC KΓΕ C @ \BFBC KΓΕ  @ \BW@Β@ CG         m 
   formvalue    _newfwd.name    _newfwd.proto    _newfwd.extzone    _newfwd.extport    _newfwd.intzone    _newfwd.intaddr    _newfwd.intport    other    created    TypedSection    create    map    set    target    DNAT    src    wan    dest    lan    proto    all 
   src_dport    dest_ip 
   dest_port    name                     >   F         @@ΐ   %  @       @ΐ   A@A @ΐ  B@BΔ   ΖΒΑ E  ά @          TypedSection    parse    created    m    uci    save 	   firewall    luci    http 	   redirect 
   build_url     admin/network/firewall/redirect                     H   J         @ @@  A   ΐ@  @              map    get    target    SNAT                     P   V    
     Ε@    ά   Α@FA KAΑΐ  \ A AA  AΒ    A     ’@      	      %s-%s 
   translate    IPv4 
   fmt_proto    map    get    proto 
   icmp_type    TCP+UDP                     X   e    H       @Ζ@@ Λΐ@ Α  ά  AA    Δ   ΖΑA@ @ ΑΑ  E  \ ά    ABFA@ Kΐΐ  \   D  FΑΒA@ @  A  \    Z   A Α  @  ΐ   ΐA  @ Z  @A ΑΑ  @ B     @A Α  @         	   fmt_zone    map    get    src 
   translate 	   any zone    fmt_ip    src_ip 	   any host 	   fmt_port 	   src_port    fmt_mac    src_mac    translatef $   From %s in %s with source %s and %s    From %s in %s with source %s    From %s in %s                     g   p    "       @Ζ@@ Λΐ@ Α  ά  AA    Δ   ΖΑA@ @ ΑΑ  ά  Ϊ    AA  ΐ     A            fmt_ip    map    get    src_dip 
   translate    any router IP 	   fmt_port 
   src_dport    translatef    Via %s at %s    Via %s                     u   {         Δ      @ ά @   D   ΐ \’@          "   <small>%s<br />%s<br />%s</small>                            
9       @Ζ@@ Λΐ@ Α  ά  AA    Δ   ΖΑA@ @ ΑΑ  E  \ ά    ABFA@ Kΐΐ  \   A  ΐ  ABFA@ Kΐΐ Β \     ΐE A ΐ  @ ]^  @E  ΐ  ] ^       	   fmt_zone    map    get    dest 
   translate 	   any zone    fmt_ip    dest_ip 	   any host 	   fmt_port 
   dest_port 
   src_dport    translatef    %s, %s in %s 	   %s in %s                             