# drake-humanoid-controller

A minimal binary distribution of Drake's humanoid controller.

To update the controller (extract required files from a Drake installation):
```bash
./extract_controller.sh /path/to/drake
```

To run controller:
```bash
DRAKE_RESOURCE_ROOT=`pwd`/install/share ./install/share/drake/examples/humanoid_controller/valkyrie_balancing_demo
```
