cask "fermata" do
  version "0.2.0"
  sha256 "9ce718396dbddd28926bc66b9b6d87558cbb699bcdaaa2cfac98c50dc54c7335"

  url "https://github.com/matthew-fernando/Fermata/releases/download/v#{version}/Fermata_#{version}_universal.dmg"
  name "Fermata"
  desc "Menu bar break timer that earns break time as you work"
  homepage "https://github.com/matthew-fernando/Fermata"

  auto_updates true

  app "Fermata.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Fermata.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.matthewfernando.fermata",
    "~/Library/Caches/com.matthewfernando.fermata",
    "~/Library/WebKit/com.matthewfernando.fermata",
  ]
end