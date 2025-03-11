package("xmrs-foo")
    set_description("Test package for the xmake-rs test suite")
    set_urls("https://github.com/A2va/xmakers-repo.git")
    add_versions("0.1", "c43b7f50043dc0fa1409eaf4db521a2450b2663c")

    on_install(function (package)
        os.cd("foo")
        if not package:config("shared") then
            package:add("defines", "FOO_STATIC")
        end  
        import("package.tools.xmake").install(package)
    end)

    on_test(function (package)
        assert(package:check_csnippets({test = [[
            void test() {
               int f = foo();
            }
        ]]}, {includes = "foo/foo.h"}))
    end)