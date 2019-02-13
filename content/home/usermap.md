+++
# Custom widget.
# An example of using the custom widget to create your own homepage section.
# To create more sections, duplicate this file and edit the values below as desired.
widget = "custom"  # Do not modify this line!
active = true  # Activate this widget? true/false

# Note: a full width section format can be enabled by commenting out the `title` and `subtitle` with a `#`.
title = '<i class="fas fa-map-marked"></i> 用户分布'
subtitle = ""

# Order that this section will appear in.
weight = 80

+++

如果想将自己所在单位添加到用户分布图中，请将“城市+单位+经纬度信息”发送至
<i class="fas fa-envelope"></i> [admin@gmt-china.org](mailto:admin@gmt-china.org)。

{{% google_map "user-map.json" %}}
