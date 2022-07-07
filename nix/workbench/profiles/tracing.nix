{ profile, nodeSpec }:
{
  UseTraceDispatcher   = true;

  TraceOptions  = {
    ""                            = { severity = "Notice";
                                      backends = [
                                        "Stdout MachineFormat"
                                        "EKGBackend"
                                      ] ++ (if !profile.node.tracer then [] else
                                      [
                                        "Forwarder"
                                      ]);
                                    };
    "BlockFetch.Client"                                       = { severity = "Info"; detail = "DMinimal"; };
    "BlockFetch.Client.CompletedBlockFetch"                   = { maxFrequency = 2.0; };
    "BlockFetch.Server"                                       = { severity = "Info"; };
    "ChainDB"                                                 = { severity = "Info"; };
    "ChainDB.AddBlockEvent.AddBlockValidation.ValidCandidate" = { maxFrequency = 2.0; };
    "ChainDB.AddBlockEvent.AddedBlockToQueue"                 = { maxFrequency = 2.0; };
    "ChainDB.AddBlockEvent.AddedBlockToVolatileDB"            = { maxFrequency = 2.0; };
    "ChainDB.CopyToImmutableDBEvent.CopiedBlockToImmutableDB" = { maxFrequency = 2.0; };
    "ChainSync.Client"                                        = { severity = "Info"; detail = "DMinimal"; };
    "ChainSync.ServerBlock"                                   = { severity = "Info"; };
    "ChainSync.ServerHeader"                                  = { severity = "Info"; };
    "Forge"                                                   = { severity = "Info"; };
    "Mempool"                                                 = { severity = "Info"; };
    "Net.AcceptPolicy"                                        = { severity = "Info"; };
    "Net.DNSResolver"                                         = { severity = "Info"; };
    "Net.ErrorPolicy"                                         = { severity = "Info"; };
    "Net.Subscription"                                        = { severity = "Info"; };
    "Resources"                                               = { severity = "Info"; };
    "Startup.DiffusionInit"                                   = { severity = "Info"; };
    "TxSubmission.Remote"                                     = { detail = "DMinimal"; };
  };
}
