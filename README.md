# SmartWatch Unknown W9 TWRP Device Tree

This branch is for building of TeamWin Recovey Project (TWRP) Recovery.
This tree compatible with TWRP 3.4.0.0

---
![SmartWatch Unknown W9](https://ae01.alicdn.com/kf/Hb6320ee12fbd44048fe080460f1a332d4/4G-GPS-Wi-Fi.jpg_Q90.jpg_.webp)


# About Device

SmartWatch Unknown W9

### Specifications

Basic   | Spec Sheet
-------:|:-------------------------
CPU     | Quad-core 1.1 GHz ARM® Cortex™ A7
CHIPSET | Qualcomm MSM8909 Snapdragon 210
GPU     | Adreno 304
Memory  | 1 GB
Shipped Android Version | 6.0.1
Storage | 8 GB 
Battery | 710 mAh

---

#  Steps to Compile

 Add Omni Source or Minimal TWRP Source
 
 `repo sync git://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-6.0`
 
Then Run `repo sync` 

```sh
. source ./build/envsetup.sh && lunch omni_FAO-userdebug && make clean && make -j# recoveryimage
```
`# = No. of CPU threads of your PC'

