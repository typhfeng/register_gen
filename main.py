import hjson
import csv
from collections import OrderedDict
import json
# Replace "filename.hjson" with the name of your Hjson file
with open("/Users/sunkewei/Documents/GitHub/terry_work/opentitan/hw/ip/i2c/data/i2c_temp.hjson", "r") as f:
    data = hjson.loads(f.read())
    data_dict = dict(data)
    register_dict = data_dict['registers']
    new_reg = dict()
    new_reg_keys = ["addr_offset", "sec_wr", "sec_rd", "size", "repeat", "field"]
    new_reg_field_keys = ["SW", "HW", "Type", "Default", "Lsb", "Msb", "Description"]
    for each_reg in register_dict:
        new_reg[each_reg['name'].lower()] = each_reg

    for each_new_reg in new_reg:
        del new_reg[each_new_reg]["name"]
        del new_reg[each_new_reg]['desc']
        new_reg[each_new_reg]['addr'] = "0x80"
        new_reg[each_new_reg]['sec_wr'] = ""
        new_reg[each_new_reg]['sec_rd'] = ""
        new_reg[each_new_reg]['size'] = "4"
        new_reg[each_new_reg]['repeat'] = "1"
        swaccess = new_reg[each_new_reg]['swaccess']
        if 'fields' in new_reg[each_new_reg]:
            new_reg[each_new_reg]['field'] = dict()
            if len(new_reg[each_new_reg]['fields']) == 1:
                new_reg[each_new_reg]['field'][new_reg[each_new_reg]] = dict()
                new_reg[each_new_reg]['field'][new_reg[each_new_reg]]["SW"] = swaccess.upper()
                new_reg[each_new_reg]['field'][new_reg[each_new_reg]]['HW'] = ""
                new_reg[each_new_reg]['field'][new_reg[each_new_reg]]['Type'] = ""
                if 'resval' in new_reg[each_new_reg]['field'][new_reg[each_new_reg]]:
                    new_reg[each_new_reg]['field'][new_reg[each_new_reg]]['Default'] = \
                        new_reg[each_new_reg]['field'][new_reg[each_new_reg]]['resval']
                else:
                    new_reg[each_new_reg]['field'][new_reg[each_new_reg]]['Default'] = "'h0"
                new_reg[each_new_reg]['field'][new_reg[each_new_reg]]['Description'] = \
                    new_reg[each_new_reg]['field'][new_reg[each_new_reg]]['desc']
                if ':' in new_reg[each_new_reg]['field'][new_reg[each_new_reg]]['bits']:
                    new_reg[each_new_reg]['field'][new_reg[each_new_reg]]['Msb'] = \
                        new_reg[each_new_reg]['field'][new_reg[each_new_reg]]['bits'].split(":")[0]
                    new_reg[each_new_reg]['field'][new_reg[each_new_reg]]['Lsb'] = \
                        new_reg[each_new_reg]['field'][new_reg[each_new_reg]]['bits'].split(":")[1]
                else:
                    new_reg[each_new_reg]['field'][new_reg[each_new_reg]]['Msb'] = \
                        new_reg[each_new_reg]['field'][new_reg[each_new_reg]]['bits']
                    new_reg[each_new_reg]['field'][new_reg[each_new_reg]]['Lsb'] = \
                        new_reg[each_new_reg]['field'][new_reg[each_new_reg]]['bits']
            else:
                for each_field_in_reg in new_reg[each_new_reg]['fields']:
                    new_reg[each_new_reg]['field'][each_field_in_reg['name'].lower()] = each_field_in_reg
                for each_new_reg_field in new_reg[each_new_reg]['field']:
                    new_reg[each_new_reg]['field'][each_new_reg_field]['SW'] = new_reg[each_new_reg]['swaccess'].upper()
                    new_reg[each_new_reg]['field'][each_new_reg_field]['HW'] = ""
                    new_reg[each_new_reg]['field'][each_new_reg_field]['Type'] = ""
                    if 'resval' in new_reg[each_new_reg]['field'][each_new_reg_field]:
                        new_reg[each_new_reg]['field'][each_new_reg_field]['Default'] = new_reg[each_new_reg]['field'][each_new_reg_field]['resval']
                    else:
                        new_reg[each_new_reg]['field'][each_new_reg_field]['Default'] = "'h0"
                    new_reg[each_new_reg]['field'][each_new_reg_field]['Description'] = new_reg[each_new_reg]['field'][each_new_reg_field]['desc']
                    if ':' in new_reg[each_new_reg]['field'][each_new_reg_field]['bits']:
                        new_reg[each_new_reg]['field'][each_new_reg_field]['Msb'] = \
                        new_reg[each_new_reg]['field'][each_new_reg_field]['bits'].split(":")[0]
                        new_reg[each_new_reg]['field'][each_new_reg_field]['Lsb'] = \
                        new_reg[each_new_reg]['field'][each_new_reg_field]['bits'].split(":")[1]
                    else:
                        new_reg[each_new_reg]['field'][each_new_reg_field]['Msb'] = \
                            new_reg[each_new_reg]['field'][each_new_reg_field]['bits']
                        new_reg[each_new_reg]['field'][each_new_reg_field]['Lsb'] = \
                            new_reg[each_new_reg]['field'][each_new_reg_field]['bits']
        #each_reg['field']: dict(each_reg['fields'])

    #    if 'fields' in each_reg and each_reg['fields'] == '':

#    register_dic = dict(register_dict)
    filename = "register_dict.json"
    # write dictionary to file in JSON format
    with open(filename, "w") as file:
        # Write dictionary to file in JSON format
        json.dump(register_dict, file, indent=4)

filename = "new_dict.json"
# write dictionary to file in JSON format
with open(filename, "w") as file:
    # Write dictionary to file in JSON format
    json.dump(new_reg, file, indent=4)

# close file
f.close()

