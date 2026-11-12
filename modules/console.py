from modules.base_module import Module


class_name = "Console"


class Console(Module):
    """Server-side handshake for the client's built-in developer console."""

    prefix = "console"

    def __init__(self, server):
        self.server = server
        self.commands = {"acclvl": self.access_level}

    async def access_level(self, msg, client):
        user_data = await self.server.get_user_data(client.uid)
        # Console command descriptors use the same 0..5 authority scale as
        # acl.xml. Unknown/guest sessions receive no console permissions.
        level = int(user_data["role"]) if user_data else -1
        await client.send(["console.acclvl", {"level": level}])
