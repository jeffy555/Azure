  protocol = ["Http","Https"]
  appgwname = "frontendappGW"
  capacity = 2
  vnet-sub = "demo"
  rule_type = ["Basic", "PathBasedRouting"] 
  skuname = ["Standard_Small", "Standard_Medium", "Standard_Large", "Standard_v2","WAF_Medium","WAF_Large","WAF_v2"]
  tier    = ["Standard", "StandardV2","WAF","WAFV2"]
  request_timeout = 10