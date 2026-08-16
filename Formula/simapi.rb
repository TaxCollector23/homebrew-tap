class Simapi < Formula
  desc "Validate simulation results before they reach production"
  homepage "https://sim-api.vercel.app"
  url "https://github.com/TaxCollector23/SimAPI-YC-/archive/refs/tags/v1.1.2.tar.gz"
  sha256 "33ad9fe4d85603cd771dfaabfa359aee58af3cfe92204cd1ed3112b201686d6c"
  license "MIT"
  head "https://github.com/TaxCollector23/SimAPI-YC-.git", branch: "main"

  depends_on "node"

  def install
    libexec.install "sdk-node/bin/simapi.js"
    (bin/"simapi").write <<~SH
      #!/bin/sh
      exec node "#{libexec}/simapi.js" "$@"
    SH
    chmod 0755, bin/"simapi"
  end

  test do
    assert_match "v1.1.2", shell_output("#{bin}/simapi version")
  end
end
