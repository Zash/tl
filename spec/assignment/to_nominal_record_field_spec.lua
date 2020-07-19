local util = require("spec.util")

describe("assignment to nominal record field", function()
   it("passes", util.check [[
      local type Node = record
         foo: boolean
      end
      local type Type = record
         node: Node
      end
      local t: Type = {}
      t.node = {}
   ]])

   it("fails if mismatch", util.check_type_error([[
      local type Node = record
         foo: boolean
      end
      local type Type = record
         node: Node
      end
      local t: Type = {}
      t.node = 123
   ]], {
      { msg = "in assignment: got number, expected Node" }
   }))
end)
