cask "metasploit" do
  version "6.1.6,20210912102848"
  sha256 "af57397aedde9bad10742da1f9fefb3f0b75e3cb144df8fc4eb048a91525140e"

  url "https://osx.metasploit.com/metasploit-framework-#{version.before_comma}%2B#{version.after_comma}-1rapid7-1.pkg"
  name "Metasploit Framework"
  desc "Penetration testing framework"
  homepage "https://www.metasploit.com/"

  livecheck do
    url "https://osx.metasploit.com/LATEST"
    strategy :page_match do |page|
      match = page.match(/metasploit-framework-(\d+(?:\.\d+)*)\+(\d+)-1rapid7-1\.pkg/i)
      "#{match[1]},#{match[2]}"
    end
  end

  depends_on formula: "nmap"

  pkg "metasploit-framework-#{version.before_comma}+#{version.after_comma}-1rapid7-1.pkg"
  binary "/opt/metasploit-framework/bin/msfbinscan"
  binary "/opt/metasploit-framework/bin/msfconsole"
  binary "/opt/metasploit-framework/bin/msfd"
  binary "/opt/metasploit-framework/bin/msfdb"
  binary "/opt/metasploit-framework/bin/msfelfscan"
  binary "/opt/metasploit-framework/bin/msfmachscan"
  binary "/opt/metasploit-framework/bin/msfpescan"
  binary "/opt/metasploit-framework/bin/msfrop"
  binary "/opt/metasploit-framework/bin/msfrpc"
  binary "/opt/metasploit-framework/bin/msfrpcd"
  binary "/opt/metasploit-framework/bin/msfvenom"

  uninstall script: {
    executable: "/opt/metasploit-framework/bin/msfremove",
    input:      ["y"],
    sudo:       true,
  },
            rmdir:  "/opt/metasploit-framework"

  zap trash: "~/.msf4"
end
