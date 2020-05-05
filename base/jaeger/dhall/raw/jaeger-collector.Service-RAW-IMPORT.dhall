{ apiVersion = "v1"
, kind = "Service"
, metadata =
  { annotations = None (List { mapKey : Text, mapValue : Text })
  , clusterName = None Text
  , creationTimestamp = None Text
  , deletionGracePeriodSeconds = None Natural
  , deletionTimestamp = None Text
  , finalizers = None (List Text)
  , generateName = None Text
  , generation = None Natural
  , labels = Some
    [ { mapKey = "app.kubernetes.io/name", mapValue = "jaeger" }
    , { mapKey = "app", mapValue = "jaeger" }
    , { mapKey = "app.kubernetes.io/component", mapValue = "collector" }
    , { mapKey = "deploy", mapValue = "sourcegraph" }
    ]
  , managedFields =
      None
        ( List
            { apiVersion : Text
            , fieldsType : Optional Text
            , fieldsV1 : Optional (List { mapKey : Text, mapValue : Text })
            , manager : Optional Text
            , operation : Optional Text
            , time : Optional Text
            }
        )
  , name = Some "jaeger-collector"
  , namespace = None Text
  , ownerReferences =
      None
        ( List
            { apiVersion : Text
            , blockOwnerDeletion : Optional Bool
            , controller : Optional Bool
            , kind : Text
            , name : Text
            , uid : Text
            }
        )
  , resourceVersion = None Text
  , selfLink = None Text
  , uid = None Text
  }
, spec = Some
  { clusterIP = None Text
  , externalIPs = None (List Text)
  , externalName = None Text
  , externalTrafficPolicy = None Text
  , healthCheckNodePort = None Natural
  , ipFamily = None Text
  , loadBalancerIP = None Text
  , loadBalancerSourceRanges = None (List Text)
  , ports = Some
    [ { name = Some "jaeger-collector-tchannel"
      , nodePort = None Natural
      , port = 14267
      , protocol = Some "TCP"
      , targetPort = Some (< Int : Natural | String : Text >.Int 14267)
      }
    , { name = Some "jaeger-collector-http"
      , nodePort = None Natural
      , port = 14268
      , protocol = Some "TCP"
      , targetPort = Some (< Int : Natural | String : Text >.Int 14268)
      }
    , { name = Some "jaeger-collector-grpc"
      , nodePort = None Natural
      , port = 14250
      , protocol = Some "TCP"
      , targetPort = Some (< Int : Natural | String : Text >.Int 14250)
      }
    ]
  , publishNotReadyAddresses = None Bool
  , selector = Some
    [ { mapKey = "app.kubernetes.io/name", mapValue = "jaeger" }
    , { mapKey = "app.kubernetes.io/component", mapValue = "all-in-one" }
    ]
  , sessionAffinity = None Text
  , sessionAffinityConfig =
      None { clientIP : Optional { timeoutSeconds : Optional Natural } }
  , topologyKeys = None (List Text)
  , type = Some "ClusterIP"
  }
, status =
    None
      { loadBalancer :
          Optional
            { ingress :
                Optional (List { hostname : Optional Text, ip : Optional Text })
            }
      }
}
