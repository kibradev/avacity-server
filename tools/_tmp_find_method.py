import xml.etree.ElementTree as ET


path = "/tmp/avacity-main.xml"
inside_strings = False
string_index = 0
targets = {}

for event, element in ET.iterparse(path, events=("start", "end")):
    if event == "start" and element.tag == "constant_string":
        inside_strings = True
        string_index = 0
    elif event == "end" and inside_strings and element.tag == "item":
        if (element.text and
                ("chtdbgLog" in element.text or
                 element.text.endswith("/_-BOOM") or
                 element.text.endswith("/_-DBGBOOM"))):
            targets[string_index] = element.text
        string_index += 1
        element.clear()
    elif event == "end" and element.tag == "constant_string":
        break

print("strings", targets)


def read_items(section):
    inside = False
    result = []
    for event, element in ET.iterparse(path, events=("start", "end")):
        if event == "start" and element.tag == section:
            inside = True
        elif event == "end" and inside and element.tag == "item":
            result.append(dict(element.attrib))
            element.clear()
        elif event == "end" and element.tag == section:
            break
    return result


# Resolve trait names too: most older injected classes have an anonymous
# MethodInfo and carry the useful name only on their trait multiname.
all_strings = []
inside_strings = False
for event, element in ET.iterparse(path, events=("start", "end")):
    if event == "start" and element.tag == "constant_string":
        inside_strings = True
    elif event == "end" and inside_strings and element.tag == "item":
        all_strings.append(element.text or "")
        element.clear()
    elif event == "end" and element.tag == "constant_string":
        break

namespaces = read_items("constant_namespace")
multinames = read_items("constant_multiname")

def string_at(index):
    return all_strings[index] if 0 <= index < len(all_strings) else ""

def multiname_at(index):
    if not 0 <= index < len(multinames):
        return "", ""
    item = multinames[index]
    name = string_at(int(item.get("name_index", "0")))
    namespace_index = int(item.get("namespace_index", "0"))
    namespace = ""
    if 0 <= namespace_index < len(namespaces):
        namespace = string_at(int(namespaces[namespace_index].get("name_index", "0")))
    return namespace, name

method_infos = []
inside_methods = False
for event, element in ET.iterparse(path, events=("start", "end")):
    if event == "start" and element.tag == "method_info":
        inside_methods = True
    elif event == "end" and inside_methods and element.tag == "item":
        if element.attrib.get("type") == "MethodInfo":
            index = len(method_infos)
            name_index = int(element.attrib.get("name_index", "0"))
            method_infos.append(name_index)
            if name_index in targets:
                print("method_info", index, targets[name_index])
        element.clear()
    elif event == "end" and element.tag == "method_info":
        break

trait_methods = {}
for event, element in ET.iterparse(path, events=("end",)):
    if element.tag == "item" and element.attrib.get("type") == "TraitMethodGetterSetter":
        namespace, name = multiname_at(int(element.attrib["name_index"]))
        if name in {"_-chtdbgLog", "_-BOOM", "_-DBGBOOM"}:
            method_info = int(element.attrib["method_info"])
            trait_methods[method_info] = f"{namespace}/{name}"
            print("trait method_info", method_info, trait_methods[method_info])
    element.clear()

inside_bodies = False
body_index = 0
for event, element in ET.iterparse(path, events=("start", "end")):
    if event == "start" and element.tag == "bodies":
        inside_bodies = True
    elif event == "end" and inside_bodies and element.tag == "item":
        if element.attrib.get("type") == "MethodBody":
            method_info = int(element.attrib["method_info"])
            if method_infos[method_info] in targets:
                print("body", body_index, "method_info", method_info,
                      targets[method_infos[method_info]])
            elif method_info in trait_methods:
                print("body", body_index, "method_info", method_info,
                      trait_methods[method_info])
            body_index += 1
        element.clear()
    elif event == "end" and element.tag == "bodies":
        break
