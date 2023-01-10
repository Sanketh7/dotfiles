local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("cpp", {
    s("cp", {
        t({
            "#include <bits/stdc++.h>",
            "using namespace std;",
            "using ll = long long;",
            "const int INF = 1<<30;",
            "const ll LINF = 1ll<<60;",
            "",
            "int main() {",
            "\tcin.tie(0)->sync_with_stdio(0);",
            "\t",
            "\t",
        }),
        i(0),
        t({
            "",
            "\t",
            "\treturn 0;",
            "}"
        })
    }),
    s("cptest", {
        t({
            "#include <bits/stdc++.h>",
            "using namespace std;",
            "using ll = long long;",
            "const int INF = 1<<30;",
            "const ll LINF = 1ll<<60;",
            "",
            "void test_case() {",
            "\t"
        }),
        i(0),
        t({
            "",
            "}",
            "",
            "int main() {",
            "\tcin.tie(0)->sync_with_stdio(0);",
            "\tint t; cin >> t;",
            "\twhile (t--) test_case();",
            "\treturn 0;",
            "}"
        })
    })
})
