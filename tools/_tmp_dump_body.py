import sys
import xml.etree.ElementTree as ET


targets = {int(value) for value in sys.argv[2:]}
inside = False
index = 0
for event, element in ET.iterparse(sys.argv[1], events=("start", "end")):
    if event == "start" and element.tag == "bodies":
        inside = True
    elif (event == "end" and inside and element.tag == "item" and
          element.attrib.get("type") == "MethodBody"):
        if index in targets:
            print("BODY", index)
            print(ET.tostring(element, encoding="unicode")[:12000])
        index += 1
    elif event == "end" and element.tag == "bodies":
        break
