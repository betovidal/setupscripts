#!/usr/bin/env python3

import sys
import json
import pathlib

def main():
	pass
if __name__ == "__main__":
	# 0 - program name
	# 1 - type
	# 2 - hostname
	if len(sys.argv) != 3:
		sys.exit()
	connection_type = sys.argv[1]
	host_name = sys.argv[2]
	conf_path = pathlib.Path(
		pathlib.Path.home(),
		".config",
		"remotes.json"
	)
	with open(conf_path) as f:
		remotes = json.load(f)
	base_type_args = remotes.get("base-conf", {}).get(connection_type, {})
	host_args = [x for x in remotes["hosts"] if x.get("name") == host_name]
	if not host_args:
		sys.exit()
	host_args = host_args.pop()
	host_type_args = host_args.get(connection_type, {})
	# Merge configuration arguments, as per specified type
	args = {**base_type_args, **host_type_args}
	if connection_type == "rdp":
		args["/v"] = host_args["host"]
		args["/u"] = host_args["user"]
		password = host_args.get("password", "")
		if password:
			args["/p"] = password
		args_str = " ".join(["{}{}".format(x, ":{}".format(y) if y else "") for x, y in args.items()])
	elif connection_type == "ssh":
		args_str = "{}@{}".format(host_args["user"], host_args["host"])
	print(args_str)
