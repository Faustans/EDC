# -*- coding: utf-8 -*-
# This example shows how queries can be executed in an iterative manner.
# Iterative evaluation will be slower, as more server requests are performed.
#
# Documentation: http://docs.basex.org/wiki/Clients
#
# (C) BaseX Team 2005-12, BSD License

import BaseXClient

# create session
session = BaseXClient.Session("localhost", 1984, "admin", "admin");

try:
    # create query instance
    input = "import module namespace funcs = \"com.funcs.my.index\" at \"../../finalProject/queries/funcs_library.xq\";<house>{ funcs:houses-by-condition(\"Usado\",<node></node>) }</house>"
    query = session.query(input)

    # loop through all results
    for typecode, item in query.iter():
        print("typecode=%d" % typecode)
        print("item=%s" % item)

    # close query object
    query.close()

finally:
    # close session
    if session:
        session.close()