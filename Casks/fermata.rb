cask "fermata" do
  version "0.3.0"
  sha256 "7c2a6dc680548c156ef9d47437806adc2b5feaf22cdf9b40c47da9c39ae4890b"

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