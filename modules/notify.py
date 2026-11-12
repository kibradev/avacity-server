async def update_resources(client, server):
    user_data = await server.get_user_data(client.uid)
    await client.send(["ntf.res", {"res": {"gld": user_data["gld"],
                                           "slvr": user_data["slvr"],
                                           "enrg": user_data["enrg"],
                                           "emd": user_data["emd"]}}])


async def update_vip_info(client, server):
    vipinf = await server.modules["vp"].get_vip_info(client.uid)
    await client.send(["ntf.vpinfc", {"vipinf": vipinf}])
