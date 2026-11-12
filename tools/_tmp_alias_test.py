import sys
sys.path.insert(0, "/opt/avacity/base")
import cmd_alias as c

assert c.rewrite_cmd_in("#h=eFX!.#p3Pq3") == "frn.buy"
assert c.rewrite_cmd_in("#bQ5fmf.#btBocf.#p3Pq3") == "a.clths.buy"
assert c.rewrite_cmd_in("#bQ5fmf.#btBocf.#bSDolT") == "a.clths.bac"
assert c.rewrite_cmd_out("frn.save") == "#h=eFX!.#h!ucjD"
assert c.rewrite_cmd_out("a.clths.buy") == "#bQ5fmf.#btBocf.#p3Pq3"
assert c.rewrite_cmd_in("o.#bchYr.#$=chq") == "o.r.info"
assert c.rewrite_cmd_out("o.r.info") == "o.#bchYr.#$=chq"
assert c.rewrite_cmd_out("o.r.jn") == "o.#bchYr.#hiIkBh"
assert c.rewrite_cmd_in("#hfwRG2.#bchYr.#bVp1lD") == "h.r.u"
assert c.rewrite_cmd_in("o.#bchYr.#bVp1lD") == "o.r.u"
assert c.rewrite_cmd_in("#hfwRG2.#bchYr.#bQT2uo") == "h.r.m"
assert c.rewrite_cmd_in("o.#bchYr.#bQT2uo") == "o.r.m"
assert c.rewrite_cmd_out("h.r.u") == "#hfwRG2.#bchYr.#bVp1lD"
assert c.rewrite_cmd_out("o.r.m") == "o.#bchYr.#bQT2uo"
print("OK")
