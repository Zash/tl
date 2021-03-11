local util = require("spec.util")

describe("-s combined with -b", function ()
   it("should work", function ()
      util.run_mock_project(finally, {
            dir_structure = {
               ["tlconfig.lua"] = [[return {
                  source_dir = "src";
                  build_dir = "build";
               }]],
               ["src"] = {
                  ["a.tl"] = [[return "hello"]]
               },
            },
            cmd = "build",
            generated_files = {
               ["build"] ={
                  "a.lua"
               }
            },
         })

   end);
   it("should work even if there's a - in the path", function ()
      util.run_mock_project(finally, {
            dir_structure = {
               ["tlconfig.lua"] = [[return {
                  source_dir = "foo-src";
                  build_dir = "foo";
               }]],
               ["foo-src"] = {
                  ["a.tl"] = [[return "hello"]]
               },
            },
            cmd = "build",
            generated_files = {
               ["foo"] ={
                  "a.lua"
               }
            },
         })

   end);

end)
