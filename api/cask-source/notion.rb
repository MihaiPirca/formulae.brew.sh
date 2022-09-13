cask "notion" do
  arch arm: "-arm64"
  livecheck_folder = on_arch_conditional arm: "apple-silicon", intel: "mac"

  on_intel do
    version "2.0.24"
    sha256 "aedd3ba982d8f98937cb5a1bf2f5ad5c92a28ad03ed45c6af93bf5cf43628350"
  end
  on_arm do
    version "2.1.2"
    sha256 "6698d4fa7877bbeff0e9fbcea29c44cc08d32a4db5bb4ac1f43e8e953b88fece"
  end

  url "https://desktop-release.notion-static.com/Notion-#{version}#{arch}.dmg",
      verified: "desktop-release.notion-static.com/"
  name "Notion"
  desc "App to write, plan, collaborate, and get organized"
  homepage "https://www.notion.so/"

  livecheck do
    url "https://www.notion.so/desktop/#{livecheck_folder}/download"
    strategy :header_match
    regex(/Notion[._-]v?(\d+(?:\.\d+)*?)[^.]*?\.dmg/i)
  end

  auto_updates true

  app "Notion.app"

  zap trash: [
    "~/Library/Application Support/Caches/notion-updater",
    "~/Library/Application Support/Notion",
    "~/Library/Caches/notion.id",
    "~/Library/Logs/Notion",
    "~/Library/Preferences/notion.id.helper.plist",
    "~/Library/Preferences/notion.id.plist",
    "~/Library/Saved Application State/notion.id.savedState",
    "~/Library/WebKit/notion.id",
  ]
end
