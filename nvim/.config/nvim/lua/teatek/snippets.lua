local ls = require"luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets(nil, {
    xml = {
      s({
        trig = "javapom",
        namr = "javapom",
        dscr = "pom.xml for java project"
      },
      {
        t({"<?xml version=\"1.0\" encoding=\"UTF-8\"?>", "<project xmlns=\"http://maven.apache.org/POM/4.0.0\" ", "\txmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" ", "\txsi:schemaLocation=\"http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd\"> ", "\t<modelVersion>4.0.0</modelVersion>", "\t<groupId>"}),
          i(1, "org.example"),
          t({"</groupId>", "\t<artifactId>"}),
          i(2, "untitled"),
          t({"</artifactId>", "\t<version>1.0-SNAPSHOT</version>", "\t<properties>", "\t\t<maven.compiler.source>"}),
          i(3, "17"),
          t({"</maven.compiler.source>", "\t\t<maven.compiler.target>"}),
          i(4, "17"),
          t({"</maven.compiler.target>", "\t</properties>", "</project>"}),
          i(0)
      }),
    },
  })
