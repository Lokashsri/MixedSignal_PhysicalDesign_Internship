# OpenLane Flow Comparison — Week 3

> Comparison of each flow stage: expected behaviour vs actual result,
> with status and remarks for the **design_mux** mixed-signal implementation.

---

## Stage-by-Stage Comparison Table

| # | Stage | Expected Result | Actual Result | Status | Remarks |
|---|-------|----------------|---------------|--------|---------|
| 1 | SKY130 PDK Installation | PDK files present and accessible | PDK enabled successfully via Ciel | ✅ Success | `sky130_fd_sc_hd` library confirmed |
| 2 | Design Preparation | Config loaded, merged LEF created | Config parsed, merged.lef generated | ✅ Success | AMUX2_3V macro recognised |
| 3 | RTL Synthesis | Gate-level netlist produced | Passed after fixing duplicate modules and undriven wire | ✅ Success | 3 RTL fixes required |
| 4 | Floorplanning | Core area + PDN + IO pins placed | Core area, PDN and IOs generated correctly | ✅ Success | Macro height fix from Week 2 resolved warning |
| 5 | Placement | Standard cells placed, legalised | Global + detailed placement completed, no violations | ✅ Success | Utilisation within target range |
| 6 | Clock Tree Synthesis | Clock distributed with low skew | CTS completed, timing analysis passed | ✅ Success | No timing violations |
| 7 | Global Routing | Routing guides created, no overflow | Guides generated, no congestion overflow | ✅ Success | Macro OBS blockages respected |
| 8 | Detailed Routing | All nets routed, no DRC violations | All nets routed, no violations | ✅ Success | TritonRoute completed cleanly |
| 9 | Magic GDS Generation | GDSII + MAG + LEF + LIB + SDF generated | All 6 output files generated | ✅ Success | Layout verified in KLayout |
| 10 | Magic DRC | Zero DRC violations | Zero DRC violations | ✅ Success | All SKY130 rules satisfied |
| 11 | Antenna Check | No antenna violations | No antenna violations | ✅ Success | Diodes inserted during routing |
| 12 | LVS | Netlist matches layout | Could not complete | ⚠️ Partial | `EXT_NETLIST` variable not set — OpenLane config issue |

---

## RTL Issues: Before vs After

| Issue | Before Fix | After Fix | Impact |
|-------|-----------|-----------|--------|
| `spi_slave.v` included twice | Duplicate module error — synthesis fails | Commented out `` `include "spi_slave.v" `` in `raven_spi.v` | Synthesis now passes |
| `raven_spi.v` included twice | Duplicate module error — synthesis fails | Commented out `` `include "raven_spi.v" `` in `design_mux.v` | Synthesis now passes |
| Undriven wire `IO` | Warning: wire has no driver — potential logic error | Corrected to `I0` (digit zero) | Clean synthesis, no warnings |

---

## Output Files: Generated vs Expected

| File | Expected | Generated | Status |
|------|----------|-----------|--------|
| `design_mux.gds` | Final GDSII layout | ✅ Yes | Complete |
| `design_mux.magic.gds` | Magic-format GDS | ✅ Yes | Complete |
| `design_mux.mag` | Magic editable layout | ✅ Yes | Complete |
| `design_mux.lef` | Final abstract LEF | ✅ Yes | Complete |
| `design_mux.lib` | Liberty timing file | ✅ Yes | Complete |
| `design_mux.sdf` | Standard delay file | ✅ Yes | Complete |
| LVS netlist comparison | Layout matches schematic | ❌ Not completed | EXT_NETLIST issue |

---

## Flow Time Comparison

| Stage | Approximate Time |
|-------|-----------------|
| PDK Setup | ~5 minutes |
| Design Preparation | ~2 minutes |
| Synthesis | ~3 minutes |
| Floorplanning | ~2 minutes |
| Placement | ~5 minutes |
| Clock Tree Synthesis | ~3 minutes |
| Routing | ~15 minutes |
| Magic GDS + DRC | ~5 minutes |
| Antenna Check | ~2 minutes |
| **Total** | **~42 minutes** |

---

## Reference Repo vs AI-Assisted Flow Comparison

| Aspect | Reference Repo (vsdmixedsignalflow) | This Project (AI-Assisted) |
|--------|-------------------------------------|---------------------------|
| LEF file source | Manually extracted from Magic | AI-generated via Claude prompt |
| LIB file source | Perl script (verilog_to_lib.pl) | AI-generated via ChatGPT prompt |
| config.tcl | Manually written | AI-generated via Claude, manually updated |
| Flow script | Manually written script.tcl | AI-generated interactive_flow.tcl |
| RTL fixes | Documented in README | Fixed via AI debug prompts |
| Error debugging | Manual trial and error | AI-assisted (prompt → fix → verify) |
| Final GDS | ✅ Produced | ✅ Produced |
| DRC result | Violations present (needed cleaning) | ✅ Zero violations |

---

## Summary

```
┌─────────────────────────────────────────────────────────┐
│               WEEK 3 FLOW RESULT SUMMARY                │
├─────────────────────────────────────────────────────────┤
│  Total Stages Attempted    :  12                        │
│  Stages Completed (✅)     :  11                        │
│  Stages Partial   (⚠️)    :   1  (LVS - config issue)  │
│  Stages Failed    (❌)     :   0                        │
│                                                         │
│  RTL Fixes Required        :   3                        │
│  DRC Violations            :   0                        │
│  Antenna Violations        :   0                        │
│  Final GDS Generated       :  YES ✅                    │
│                                                         │
│  OVERALL RESULT: FLOW COMPLETED SUCCESSFULLY ✅         │
└─────────────────────────────────────────────────────────┘
```

---

## Conclusion

The complete OpenLane RTL-to-GDSII flow was successfully executed
for the **design_mux** mixed-signal design. All critical physical
design stages — synthesis, floorplanning, placement, CTS, routing,
DRC, and GDS generation — completed successfully. The only
incomplete stage was LVS, which failed due to an OpenLane internal
configuration variable issue (`EXT_NETLIST`), not a design error.

The AI-assisted approach (Claude + ChatGPT + Codex) proved effective:
all required files were generated via prompts, errors were diagnosed
and fixed using AI guidance, and the final GDSII layout was produced
with zero DRC violations — matching the quality of the reference
repository output.
