import logging


class Module():
    def __init__(self):
        self.commands = {}

    async def on_message(self, msg, client):
        command = msg[1].split(".")[1]
        if command not in self.commands:
            logging.warning(f"Command {msg[1]} not found")
            return
        try:
            await self.commands[command](msg, client)
        except Exception:
            logging.exception("Command %s failed uid=%s room=%s",
                              msg[1], client.uid,
                              msg[0] if msg else None)
            # Keep implementation failures in the server log. Raw command
            # payloads must not interrupt players with a technical modal.
