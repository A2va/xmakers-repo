package("xmrs-bar")
    set_description("Test package for the xmake-rs test suite")
    set_urls("https://github.com/A2va/xmakers-repo.git")
    add_versions("0.1", "6ee2ec5724f6a57ede17071d9e2f8099af44b7dd")

    add_deps("xmrs-foo")

    on_install(function (package)
        os.cd("bar")
        if not package:config("shared") then
            package:add("defines", "BAR_STATIC")
        end    
        import("package.tools.xmake").install(package)
    end)

    on_test(function (package)
        assert(package:check_csnippets({test = [[
            void test() {
               int b = bar();
            }
        ]]}, {includes = "bar/bar.h"}))
    end)    