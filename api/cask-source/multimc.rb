cask "multimc" do
  version "0.6.13"
  sha256 :no_check

  url "https://files.multimc.org/downloads/mmc-stable-osx64.tar.gz"
  name "Multi MC"
  desc "Minecraft launcher"
  homepage "https://multimc.org/"

  livecheck do
    url "https://files.multimc.org/update/osx64-5.15.2/stable/index.json"
    strategy :page_match do |page|
      JSON.parse(page)["Versions"][0]["Name"]
    end
  end

  auto_updates true

  app "MultiMC.app"

  zap trash: [
    "~/Library/Caches/MultiMC",
    "~/Library/Preferences/org.multimc.MultiMC5.plist",
    "~/Library/Saved Application State/org.multimc.MultiMC5.savedState",
  ]
end
