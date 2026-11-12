import sys
import xml.etree.ElementTree as ET


target = 108506
for path in sys.argv[1:]:
    inside = False
    index = 0
    for event, element in ET.iterparse(path, events=("start", "end")):
        if event == "start" and element.tag == "method_info":
            inside = True
        elif event == "end" and inside and element.tag == "item" and element.attrib.get("type") == "MethodInfo":
            if index == target:
                print(path, ET.tostring(element, encoding="unicode")[:1500])
                break
            index += 1
        elif event == "end" and element.tag == "method_info":
            break
