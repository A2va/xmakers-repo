add_repositories("xmakers-repo https://github.com/A2va/xmakers-repo")
add_requires("xmrs-foo")

target("bar")
    set_kind("$(kind)")
    add_files("bar.c")
    add_headerfiles("bar/bar.h", {prefixdir = "bar"})

    add_packages("xmrs-foo")

    add_defines("BAR_BUILD")
    if is_kind("static") then
        add_defines("BAR_STATIC", {public = true})
    end