local workspace_dir = os.getenv("HOME") .. "/workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local config = {
    cmd = {
        "java", -- or '/path/to/java17_or_newer/bin/java'
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-javaagent:" .. os.getenv("HOME") .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
        "-Xms1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",
        "-jar",
        vim.fn.glob(
            os.getenv("HOME") .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"
        ),
        "-configuration",
        os.getenv("HOME") .. "/.local/share/nvim/mason/packages/jdtls/config_linux",
        "-data",
        workspace_dir,
    },
    root_dir = require("jdtls.setup").find_root({
        ".git",
        "mvnw",
        "gradlew",
        "pom.xml",
        "build.gradle",
    }),
    settings = {
        java = {
            autobuild = { enabled = false },
            signatureHelp = { enabled = true },
            contentProvider = { preferred = "fernflower" },
            codeGeneration = {
                toString = {
                    template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
                },
                hashCodeEquals = {
                    useJava7Objects = true,
                },
                useBlocks = true,
            },
            eclipse = {
                downloadSources = true,
            },
            configuration = {
                updateBuildConfiguration = "interactive",
                runtimes = {
                    {
                        name = "JavaSE-11",
                        path = "~/.sdkman/candidates/java/11.0.22-amzn",
                    },
                    {
                        name = "JavaSE-17",
                        path = "~/.sdkman/candidates/java/17.0.10-amzn",
                    },
                    {
                        name = "JavaSE-21",
                        path = "~/.sdkman/candidates/java/21.0.2-open",
                    },
                },
            },
            maven = {
                downloadSources = true,
            },
            implementationsCodeLens = {
                enabled = true,
            },
            referencesCodeLens = {
                enabled = true,
            },
            references = {
                includeDecompiledSources = true,
            },
            inlayHints = {
                parameterNames = {
                    enabled = "all", -- literals, all, none
                },
            },
            format = {
                enabled = false,
            },
        },
    },
}
require("jdtls").start_or_attach(config)
